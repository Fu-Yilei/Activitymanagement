package AM_service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import AM_entity.Activity;
import AM_entity.User;


public class DatabaseService {

	static final String dburl = "jdbc:mysql://localhost:3306/activitymanagement";
	static final String dbuser = "root";
	static final String dbpwd = "fuyilei@96";
	public boolean NewAccount(User u) {
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch (Exception e){
			return false;
		}
		
		try{
			Connection connect = DriverManager.getConnection(
					dburl,dbuser,dbpwd);
			
			PreparedStatement Statement=connect.prepareStatement("INSERT INTO user_table VALUES (?,?,?,?)");
			Statement.setString(1, u.getEmail());
			Statement.setString(2, u.getPassword());
			Statement.setInt(3, u.getUsertype());
			Statement.setString(4, u.getLike());
			Statement.executeUpdate();
		}catch(Exception e){
			return false;
		}
		
		return true;
	}
	public int CheckUser(String signinEmail, String signinPassword) {
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch (Exception e){
			return -1;
		}
		try{
			Connection connect = DriverManager.getConnection(
					dburl,dbuser,dbpwd);
			Statement stmt = connect.createStatement();
			ResultSet rs = stmt.executeQuery("select * from user_table where Email = '"+signinEmail+"' ");
			if (rs.wasNull())
				return -1;
			while (rs.next()){
				if (rs.getString("Password").equals(signinPassword)){
					return rs.getInt("Type");
				}
			}
		}catch(Exception e){
			return -1;
		}
		return -1;
	}
	public void AddActivity(Activity a,String holder) {
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch (Exception e){
			return ;
		}
		
		try{
			Connection connect = DriverManager.getConnection(
					dburl,dbuser,dbpwd);
			Statement stmt = connect.createStatement();
			ResultSet rs = stmt.executeQuery("select * from activity");
			int id = 0;
			while (rs.next()){
				if (rs.getInt("ID") == id)
					id++;
				else
					break;
			}
			
			try{
				PreparedStatement Statement=connect.prepareStatement("insert into activity values (?,?,?,?,?,?,?,?)");
				Statement.setInt(1, id);
				Statement.setString(2, a.getTitle());
				Statement.setDate(3, a.getDate());
				Statement.setTime(4, a.getTime());
				Statement.setString(5, a.getSite());
				Statement.setString(6, a.getDetails());
				Statement.setString(7, a.getHolder());
				Statement.setString(8, a.getTag());
				Statement.executeUpdate();
			}catch(Exception e){
				System.out.println("92"+e);
				return ;
			}
			try{
				PreparedStatement Statement=connect.prepareStatement("insert into holderhold values (?,?)");
				Statement.setString(1, holder);
				Statement.setInt(2, id);

				Statement.executeUpdate();
			}catch(Exception e){
				System.out.println("92"+e);
				return ;
			}

				
		}catch(Exception e){
			System.out.println("97"+e);
			return ;
		}
		return ;
		
	}
	public void LikeAC(String userEmail, int activityID) {
		String tmp;
		if (userEmail.charAt(0) == '0')
			tmp = userEmail.substring(1, userEmail.length()-1);
		else
			tmp = userEmail;
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch (Exception e){
			return ;
		}
		
		try{
			Connection connect = DriverManager.getConnection(
					dburl,dbuser,dbpwd);
			
			try{
				PreparedStatement Statement=connect.prepareStatement("insert into userlike values (?,?)");
				Statement.setString(1, tmp);
				Statement.setInt(2, activityID);

				Statement.executeUpdate();
			}catch(Exception e){
				return ;
			}
		}catch(Exception e){
			return ;
		}
		return ;
		
	}
	public void DelfromUserLike(String delUser,int delID) {
		System.out.println("user:"+delUser);
		System.out.println("delID:"+delID);
		String tmp = delUser.substring(1, delUser.length()-1);
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch (Exception e){
			System.out.println(e);
			return ;
		}
		
		try{
			Connection connect = DriverManager.getConnection(
					dburl,dbuser,dbpwd);
			Statement stmt = connect.createStatement();
			stmt.executeUpdate("delete from userlike where Email = '"+tmp+"' and ActivityID = '"+delID+"' ");
			return ;
		}catch (Exception e){
			System.out.println(e);
			return ;
		}
		
	}
	public void DelfromAll(int delID) {
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch (Exception e){
			System.out.println(e);
			return ;
		}
		
		try{
			Connection connect = DriverManager.getConnection(
					dburl,dbuser,dbpwd);
			Statement stmt = connect.createStatement();
			stmt.executeUpdate("delete from userlike where ActivityID = '"+delID+"' ");
			stmt.executeUpdate("delete from holderhold where ActivityID = '"+delID+"' ");
			stmt.executeUpdate("delete from activity where ID = '"+delID+"' ");
			return ;
		}catch (Exception e){
			System.out.println(e);
			return ;
		}
		
	}
	public void UpdateActivity(int activityID, Activity a) {
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch (Exception e){
			System.out.println(e);
			return ;
		}
		
		try{
			Connection connect = DriverManager.getConnection(
					dburl,dbuser,dbpwd);
			Statement stmt = connect.createStatement();
			stmt.executeUpdate("update activity set Title='"+a.getTitle()+"' ,Date='"+a.getDate()+"' ,Time='"+a.getTime()+"' ,Site='"+a.getSite()+"' ,Details='"+a.getDetails()+"' ,Tag='"+a.getTag()+"' where ID = '"+activityID+"'");
			return ;
		}catch (Exception e){
			System.out.println(e);
			return ;
		}
		
	}
	public boolean whetherLike(String email, int iD) {
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch (Exception e){
			System.out.println(e);
			return false;
		}
		try{
			Connection connect = DriverManager.getConnection(
					dburl,dbuser,dbpwd);
			Statement stmt = connect.createStatement();
			ResultSet rs = stmt.executeQuery("select * from userlike where Email = '"+email+"' and ActivityID = '"+iD+"'");
			System.out.println("in ds wl");
			if (rs.next()){
				System.out.println("yes");
				return true;
			}
			else{
				System.out.println("no");
				return false;
			}
			
		}catch (Exception e){
			System.out.println(e);
			return false;
		}
	}
	public String CalcAndWriteLike(String email) {
		System.out.println("In DS calcAndWriteLike");
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch (Exception e){
			System.out.println(e);
			return null;
		}
		try{
			System.out.println("In second try");
			String tags = "";
			Connection connect = DriverManager.getConnection(
					dburl,dbuser,dbpwd);
			Statement stmt = connect.createStatement();
			System.out.println("267 success");
			ResultSet rs = stmt.executeQuery("SELECT * from activity where ID in (select ActivityID from userlike where Email = '"+email+"')");
			System.out.println("269 success");
			while (rs.next())
				tags += rs.getString("Tag");
			
			int data[] = {0,0,0,0,0,0,0,0};
			int cnt = tags.length();
			double ProAd = 0;
			for (int i = 0;i < cnt;i++)
				data[ (int)(tags.charAt(i)) - 48 ] ++;
			
			double ratio[] = {0,0,0,0,0,0,0,0};
			for (int i = 1;i < 8;i++)
				ProAd += Math.pow(data[i],2);
			
			ProAd = Math.pow(ProAd, 0.5);
			
			if (ProAd == 0)
				return "";
			
			for (int i = 1; i < 8;i++)
				ratio[i] = data[i] / ProAd;
			String likearray = "";
			
			for (int i = 1;i < 7;i++)
				likearray += (new DecimalFormat("0.00").format(ratio[i]))+"/";
			likearray += (new DecimalFormat("0.00").format(ratio[7]))+"";
			
			System.out.println("296success");
			Statement stmt2 = connect.createStatement();
			stmt2.executeUpdate("update user_table set LikeLs = '"+likearray+"' where Email = '"+email+"'");
			System.out.println("Out ds cawl");
			return likearray;
			
		}catch (Exception e){
			System.out.println(e);
			return null;
		}

	}
	public List<User> getAllUsers() {
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch (Exception e){
			return null;
		}
		try{
			Connection connect = DriverManager.getConnection(
					dburl,dbuser,dbpwd);
			Statement stmt = connect.createStatement();
			List<User> lu = new ArrayList<User>();
			
			ResultSet rs = stmt.executeQuery("select * from user_table where Type = 0");
			while (rs.next()){

				User u = new User(rs.getString("Email"),
				rs.getString("Password"),
				rs.getInt("Type"),
				rs.getString("LikeLs"));
				lu.add(u);			
			}
			return lu;
		}catch (Exception e){
			System.out.println(e);
			return null;
		}
	}
	public void DelACfromTmp(String email) {
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch (Exception e){
			System.out.println(e);
			return ;
		}
		
		try{
			Connection connect = DriverManager.getConnection(
					dburl,dbuser,dbpwd);
			Statement stmt = connect.createStatement();
			stmt.executeUpdate("delete from tmprectable where Email = '"+email+"' ");
			return ;
		}catch (Exception e){
			System.out.println(e);
			return ;
		}
	}
	
}
