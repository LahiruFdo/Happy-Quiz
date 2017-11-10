package Controllers;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordConvertion{
	private String password;
	private String hashedValue;
	private MessageDigest md;
	
	PasswordConvertion(String password){
		this.password = password;
		try {
			md = MessageDigest.getInstance("MD5");
			md.update(this.password.getBytes());
		    
		    byte byteData[] = md.digest();

	        //convert the byte to hex format method 1
	        StringBuffer sb = new StringBuffer();
	        for (int i = 0; i < byteData.length; i++) {
	         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
	        }
		    this.hashedValue =  sb.toString();
		    
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			this.hashedValue = null;
		}
	}
	
	public String getPassword(){
		return this.hashedValue;
	}
}