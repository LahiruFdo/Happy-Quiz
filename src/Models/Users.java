package Models;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.PreparedStatement;

public class Users {
	private int ID;
	private String name;
	private String email;
	private String username;
	private String password;
	
	private DBConnection dbcon;
	
	private String query;
	
	public Users(){
		dbcon = new DBConnection();
	}
	
	public boolean addUsers(String name, String email, String username, String password){
		this.name = name;
		this.email = email;
		this.username = username;
		this.password = password;
		
		this.query = "insert into users (name, email, username, password) values(?,?,?,?)";
		PreparedStatement insrt = (PreparedStatement) dbcon.getPrepareStatement(query);
		try {
			insrt.setString(1,this.name);
			insrt.setString(2,this.email);
			insrt.setString(3,this.username);
			insrt.setString(4,this.password);
			
			int a = insrt.executeUpdate();
			
			if(a==1){
				return true;
			}
			else{
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}		
	}
	
	public String[] getUserDetails(String username){
		this.query = "select * from users where username = '"+username+"';";
		String[] userDetails = new String[4];
		
		ResultSet rst = dbcon.getResultSet(query);
		try {
			while(rst.next()){
				userDetails[0] = rst.getString("name");
				userDetails[1] = rst.getString("email");
				userDetails[2] = rst.getString("username");
				userDetails[3] = String.valueOf(rst.getInt("ID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userDetails;
	}
	
	public int getUserID(String username){
		this.query = "select ID from users where username = '"+username+"';";
		ResultSet rst = dbcon.getResultSet(query);
		int ID=0;
		try {
			while(rst.next()){
				ID = rst.getInt("ID");
			}
		}
		catch(Exception e){
			ID = 0;
		}
		return ID;
	}
	
	public boolean checkUser(String username){
		this.query = "select * from users where username = '"+username+"';";
		int count = 0;
		ResultSet rst = dbcon.getResultSet(query);
		try {
			while(rst.next()){
				count++;
			}
		}catch (SQLException e) {
			e.printStackTrace();
			return false;
		}	
		if(count>0){
			return true;
		}
		return false;
	}
	
	public boolean checkPW(String password, String username){
		this.query = "select password from users where username = '"+username+"';";
		
		ResultSet rst = dbcon.getResultSet(query);
		try {
			while(rst.next()){
				if(password.equals(rst.getString("password"))){
					return true;
				}
				else{
					return false;
				}
			}
		}catch (SQLException e) {
			e.printStackTrace();
			return false;
		}	
		return false;
	}
	
}
