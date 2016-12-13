package AM_service;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DelOvertime{
	static final String dburl = "jdbc:mysql://cqcstizsnftm.mysql.sae.sina.com.cn:10404/activitymanage";
	static final String dbuser = "root";
	static final String dbpwd = "fuyilei96";
	public void Do(){
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat tf = new SimpleDateFormat("HH:mm");
		while (true){
			String t = tf.format(new Date());
			if (!t.equals("23:59")){
				try {
					Thread.sleep(30000);
					System.out.println("waitfor30");
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				continue;
			}
			try{
				Connection connect = DriverManager.getConnection(
						dburl,dbuser,dbpwd);
				
				Statement stmt = connect.createStatement();
				ResultSet rs = stmt.executeQuery("select * from activity");
				while (rs.next()){
					String acdate_str = df.format(rs.getDate("Date"));
					String nowdate_str = df.format(new Date());
					Date acdate = df.parse(acdate_str);
					Date nowdate = df.parse(nowdate_str);
					if (acdate.equals(nowdate) || acdate.before(nowdate)){
						System.out.println("hhh");
						DatabaseService ds = new DatabaseService();
						ds.DelfromAll(rs.getInt("ID"));
					}
				}
			}catch(Exception e){
				System.out.println(e);
				return ;
			}
		}
		
	}
}
