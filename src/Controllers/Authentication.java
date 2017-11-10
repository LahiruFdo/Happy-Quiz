package Controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Models.Users;

@WebServlet("/Authentication")
public class Authentication extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public Authentication() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String username = request.getParameter("username").toLowerCase();
			
			PasswordConvertion PW = new PasswordConvertion(request.getParameter("password"));
			String password = PW.getPassword();
			
			Users signedUser = new Users();
			
			boolean userExist = signedUser.checkUser(username);
			
			if(userExist){
				boolean successfullAuth = signedUser.checkPW(password, username);
				
				if(successfullAuth){
					String[] userDetails = signedUser.getUserDetails(username);
					
					HttpSession session = request.getSession();
			        session.setAttribute("name", userDetails[0]);
			        session.setAttribute("username", userDetails[2]);
			        session.setAttribute("email", userDetails[1]);
					
					response.sendRedirect("userHome.jsp");
				}
				
				else{
					String error = "Invalid password.&nbsp;&nbsp;&nbsp;<button data-toggle='modal' data-target='#myModal' class='btn btn-warning'>Try Again</button>";
					request.setAttribute("error",error);
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
			}
			else{
				String error = "Invalid User.&nbsp;&nbsp;&nbsp;<button data-toggle='modal' data-target='#myModal' class='btn btn-warning'>Try Again</button>";
				request.setAttribute("error",error);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}
		catch(Exception e){
			response.sendRedirect("index.jsp");
		}
		
	}

}
