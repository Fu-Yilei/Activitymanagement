package AM_service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import AM_entity.Activity;
import AM_entity.User;

public class DatabaseService {

	static final String dburl = "jdbc:mysql://localhost:3306/Activitymanagement";
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
			
			PreparedStatement Statement=connect.prepareStatement("INSERT INTO user_table VALUES (?,?,?)");
			Statement.setString(1, u.getEmail());
			Statement.setString(2, u.getPassword());
			Statement.setInt(3, u.getUsertype());
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
	public void AddActivity(Activity a) {
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch (Exception e){
			return;
		}
		
		try{
			Connection connect = DriverManager.getConnection(
					dburl,dbuser,dbpwd);
			Statement stmt = connect.createStatement();
			ResultSet rs = stmt.executeQuery("select * from activity");
			int id = 0;
			if (rs.last())
				id = rs.getRow();
			
			try{
				PreparedStatement Statement=connect.prepareStatement("insert into activity values (?,?,?,?,?,?,?)");
				Statement.setInt(1, id);
				Statement.setString(2, a.getTitle());
				Statement.setDate(3, a.getDate());
				Statement.setTime(4, a.getTime());
				Statement.setString(5, a.getSite());
				Statement.setString(6, a.getdetails());
				Statement.setString(7, a.getHolder());
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
}
