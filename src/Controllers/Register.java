package Controllers;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import Models.Users;

@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
          
    public Register() {
        super();
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String username = request.getParameter("username").toLowerCase();
			String password  = this.getHashedValue(request.getParameter("pw"));	
			
			Users newUser = new Users();
			
			String[] existence = newUser.getUserDetails(username);
			if(existence[2] != null){
				response.sendRedirect("register.jsp");
				return;
			}
			boolean status = newUser.addUsers(name, email, username, password);
			
			if(status){
				//System.out.println(email);
				System.out.println("new user has been registered successfully...");
				boolean status1 = this.sendMail(email);
				
				String[] userDetails = newUser.getUserDetails(username);
				
				HttpSession session = request.getSession();
		        session.setAttribute("name", userDetails[0]);
		        session.setAttribute("username", userDetails[2]);
		        session.setAttribute("email", userDetails[1]);
		        session.setAttribute("ID", userDetails[3]);
				
				//request.setAttribute("userData", userDetails);
				//request.getRequestDispatcher("userHome.jsp").forward(request, response);
				response.sendRedirect("userHome.jsp");
			}
			
			else{
				response.sendRedirect("register.jsp");
			}
		}
		catch(Exception e){
			response.sendRedirect("index.jsp");
		}
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
	
	private boolean sendMail(String mailAddress){
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		
		try
		  {
			//PasswordAuthentication pwa = new PasswordAuthentication("happyquiz17@gmail.com","happyquiz2017");
			//Authenticator auth = new Authenticator(pwa);
			Session s=Session.getDefaultInstance(props,
					new javax.mail.Authenticator() {
	            			protected PasswordAuthentication getPasswordAuthentication() {
	            				return new PasswordAuthentication("happyquiz17@gmail.com", "happyquiz2017");
	            			}
	         		}
			);
			MimeMessage m=new MimeMessage(s);
			m.setSubject("Welcome to Happy-Quiz !");
			m.setRecipient(Message.RecipientType.TO,new InternetAddress(mailAddress));
			BodyPart b=new MimeBodyPart();
			b.setText("Congratulations! You are successfully connected with Happy-Quiz.");
			Multipart m1=new MimeMultipart();
			m1.addBodyPart(b);
			m.setContent(m1);
			Transport.send(m);
			System.out.println("mail sent");
			return true;
		  }
		  catch (Exception e)
		  {
			  e.printStackTrace();
			  return false;
		  }
	}

}



