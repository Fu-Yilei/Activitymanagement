package AM_service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CheckAndSend{
	static final String dburl = "jdbc:mysql://localhost:3306/activitymanagement";
	static final String dbuser = "root";
	static final String dbpwd = "fuyilei@96";
	static final String title0 = "活动提醒";
	public void Do(){
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch (Exception e){
			System.out.println(e);
			return ;
		}
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat tf = new SimpleDateFormat("HH:mm");
		while (true){
			
			String d = df.format(new Date());
			String t = tf.format(new Date());
			if (!t.equals("08:00")){
				System.out.println(t);
				try {
					Thread.sleep(30000);
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
					String acdate = df.format(rs.getDate("Date"));
					
					if (acdate.equals(d)){
						Statement stmt0 = connect.createStatement();
						System.out.println("Find and is "+rs.getInt("ID"));
						ResultSet rs0 = stmt0.executeQuery("select * from userlike where ActivityID = '"+rs.getInt("ID")+"'");
						while (rs0.next()){
							System.out.println("send");
							SendEmailService ses = new SendEmailService();
							String con = "您好："+rs0.getString("Email")+".您收藏的"+"\""+rs.getString("Title")+"\""
									+"活动将于今日"+rs.getTime("Time")+"于"+rs.getString("Site")+"举办，请不要忘记";
							ses.setAddress(rs0.getString("Email"),title0);
							ses.send(con);
						}
					}
				}
				Thread.sleep(60000);
			}catch(Exception e){
				System.out.println(e);
				return ;
			}
		}
		
	}

}
