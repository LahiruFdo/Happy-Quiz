package Controllers;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.Users;

@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
          
    public Register() {
        super();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password  = this.getHashedValue(request.getParameter("pw"));		
		
		Users newUser = new Users();
		boolean status = newUser.addUsers(name, email, username, password);
		
		if(status){
			System.out.println("new user has been registered successfully...");
			//String fName = name.split(" ")[0];
//			SendEmail sendingMail = new SendEmail(email,name);
//			sendingMail.send();
//			if(status1){
//				System.out.println("mail is sent");
//			}
//			else{
//				System.out.println("mail is not sent");
//			}
			
			String[] userDetails = newUser.getUserDetails(username);
			
			request.setAttribute("userData", userDetails);
			request.getRequestDispatcher("userHome.jsp").forward(request, response);
		}
		
		else{
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}
				
		//System.out.println(name+" "+email+" "+username+" "+password);
		//System.out.print("81dc9bdb52d04dc20036dbd8313ed055");
	}
	
	private String getHashedValue(String pw){
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("MD5");
			md.update(pw.getBytes());
		    
		    byte byteData[] = md.digest();

	        //convert the byte to hex format method 1
	        StringBuffer sb = new StringBuffer();
	        for (int i = 0; i < byteData.length; i++) {
	         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
	        }
		    return sb.toString();
		    
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return "error";
		}
		
	}

}
