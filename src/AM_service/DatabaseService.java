package AM_service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import AM_entity.User;

public class DatabaseService {

	static final String dburl = "jdbc:mysql://localhost:3306/Activitymanagement";
	static final String dbuser = "root";
	static final String dbpwd = "fuyilei@96";
	public boolean NewAccount(User u) {
		System.out.println(u.getEmail()+" "+u.getPassword()+" "+u.getUsertype());
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
	
	
}
