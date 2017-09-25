package Models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


public class DBConnection {
	public static String user="root";
	public static String password="root";
	public static String url="jdbc:mysql://localhost:3306/happyquiz";
	public static Connection con=null;

	public static Connection getConnection()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection(url,user,password);

		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}
	
	public static Statement getStatement()
	{
		Statement st=null;
		try
		{
			con=getConnection();
			st=con.createStatement();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return st;
	}
	
	public static PreparedStatement getPrepareStatement(String query)
	{
		PreparedStatement pst=null;
		try
		{
			con=getConnection();
			//con.getConnection();
			pst=con.prepareStatement(query);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return pst;
	}
	
	public static ResultSet getResultSet(String query)
	{
		ResultSet rs=null;

		try
		{
			PreparedStatement pst=getPrepareStatement(query);
			//rs=st.executeQuery(query);
			rs=pst.executeQuery();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return rs;
	}
}