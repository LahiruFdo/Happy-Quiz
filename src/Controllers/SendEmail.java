package Controllers;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

public class SendEmail {
	private String recipient;
	private String name;
	
	public SendEmail(String recipient, String name){
		this.recipient = recipient;
		this.name = name;		
	}

	public boolean send() {    
	   	final String username = "happyquiz17@gmail.com";
		final String password = "happyquiz2017";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("happyquiz17@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,InternetAddress.parse("lahirudfdo95@gmail.com"));
			message.setSubject("Welcome to HappyQuiz !!!");
			message.setText("Dear "+this.name+",\n\n\n\t You are successfully registered with the Happy-Quiz. Now you can manage your own quizzes with us.\n Go through the instructions on the application");

			Transport.send(message);
			System.out.println("Done");
			
			return true;

		} catch (MessagingException e) {
			System.out.println("Error Here");
			return false;
		}
   }
	
	public static void main(String args[]){
		SendEmail ss = new SendEmail("Lahiru","darshana");
		ss.send();
	}
}