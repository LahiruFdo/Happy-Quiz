package Controllers;

import Models.DBConnection;

import java.io.*;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CheckUsername")
public class CheckUsername extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public CheckUsername() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("val").toLowerCase();
		PrintWriter out = response.getWriter();
		
		DBConnection dbCon = new DBConnection();
		
		String query = "select username from users where username = '"+username+"';";
		
		ResultSet rst = dbCon.getResultSet(query);
		
		try {
			if(rst.next()){
				out.print("Username already exists !");
			}
			else{
				out.print("");
			}
		} catch (SQLException e) {
			out.print("Username already exists !");
		}
	}

}
