package Models;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.PreparedStatement;

public class Users {
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
		String[] userDetails = new String[3];
		
		ResultSet rst = dbcon.getResultSet(query);
		try {
			while(rst.next()){
				userDetails[0] = rst.getString("name");
				userDetails[1] = rst.getString("email");
				userDetails[2] = rst.getString("username");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userDetails;
	}
}
