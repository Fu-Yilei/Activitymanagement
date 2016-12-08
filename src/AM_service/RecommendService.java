package AM_service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import AM_entity.User;


class likearray{
	private String Email;
	private double percent;
	public likearray(){};
	public likearray(String e,double p){
		Email = e;
		percent = p;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public Double getPercent() {
		return percent;
	}
	public void setPercent(double percent) {
		this.percent = percent;
	}
	
}

class MyComparator implements Comparator<likearray>
{
    public int compare(likearray o1, likearray o2)
    {
        return o1.getPercent().compareTo(o2.getPercent());
    }
}

public class RecommendService {

	static final String dburl = "jdbc:mysql://localhost:3306/activitymanagement";
	static final String dbuser = "root";
	static final String dbpwd = "fuyilei@96";
	
	public void AddTmpTable(String email,int tmp[],int cnt){
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch (Exception e){
			return ;
		}
		try{
			System.out.println("In AddTmpTable");
			System.out.println("tmp is ");
			for (int i = 0;i < tmp.length;i++)
				System.out.println(tmp[i]);
			Connection connect = DriverManager.getConnection(
					dburl,dbuser,dbpwd);
			for (int i = 0;i < cnt;i++){
				PreparedStatement Statement=connect.prepareStatement("INSERT INTO tmprectable VALUES (?,?)");
				Statement.setString(1, email);
				Statement.setInt(2, tmp[i]);
				Statement.executeUpdate();
				
			}
			System.out.println("Out AddTmpTable");
		}catch(Exception e){
			return ;
		}
	}
	
	public void FindProperAc(String email) {
		DatabaseService ds = new DatabaseService();
		String LikeArray = ds.CalcAndWriteLike(email);
		if (LikeArray == null)
			return ;
		System.out.println("78:Like Array is " + LikeArray);/**********************************/
		
		List<User> users = ds.getAllUsers();
		
		double ThisArray[] = new double[8];
		String tmp[] = LikeArray.split("/");
		for (int i = 1;i < 8;i++)
			ThisArray[i] = Float.parseFloat(tmp[i-1]);
		
		System.out.println("88:ThisArray is ");
		for (int i = 1;i < 8;i++)
			System.out.println(ThisArray[i]);
		
		List<likearray> la = new ArrayList<likearray>();
		for (int i = 0;i < users.size();i++){
			String emailtmp = users.get(i).getEmail();
			if (emailtmp.equals(email))
				continue;
			String liketmp = users.get(i).getLike();
			double likearraytmp[] = {0,0,0,0,0,0,0,0};
			if (liketmp != null){
				String tt[] = liketmp.split("/");
				for (int j = 1;j < 8;j++)
					likearraytmp[j] = Float.parseFloat(tt[j-1]);
				
			}
			double per = 0;
			for (int j = 1;j < 8;j++)
				per += ThisArray[j] * likearraytmp[j];
			la.add(new likearray(emailtmp,per));
		}
		Collections.sort(la,new MyComparator());
		Collections.reverse(la);
		
		System.out.println("108:la after sort is ");
		for (int i = 0;i < la.size();i++){
			System.out.println(la.get(i).getEmail() + "--" + la.get(i).getPercent());
		}
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch (Exception e){
			System.out.println("exception in RS 122");
			return ;
		}
		try{
			Connection connect = DriverManager.getConnection(
					dburl,dbuser,dbpwd);
			int cnt = 0;
			int inttmp[] = new int[5];
			for (int i = 0;i < la.size();i++){
				Statement stmt = connect.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT * from userlike where Email = '"+la.get(i).getEmail()+"' and ActivityID not in (select ActivityID from userlike where Email = '"+email+"' )");
				while (rs.next()){
					inttmp[cnt++] = rs.getInt("ActivityID");
					if (cnt >= 5){
						AddTmpTable(email,inttmp,cnt);
						return ;
					}
				}
				
			}
			AddTmpTable(email,inttmp,cnt);
			return;
		}catch(Exception e){
			System.out.println("Exception in RS 145 ->" + e);
			return ;
		}
		
		
	}

}
