package Models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpSession;

import com.mysql.jdbc.PreparedStatement;

public class Quiz {
	private String refNo;
	private String name;
	private String quiz_key;
	private String noq;
	private String nqp;
	private String apq;
	private String quizSet;
	private String created_date;
	private String last_edited_date;
	private int creator_id;
	private boolean activation;
	private String act_str_date;
	private String act_end_date;
	
	private DBConnection dbcon;
	
	private String query;
	private String owner_name;
	
	public static final String DATE_FORMAT_NOW = "yyyy/MM/dd";
	
	public Quiz(){
		this.dbcon = new DBConnection();
	}
	
	public Quiz(String name, String key, String noq, String nqp, String apq, String owner_name){
		this.dbcon = new DBConnection();
		this.name = name;
		this.quiz_key = key;
		this.noq = noq;
		this.nqp = nqp;
		this.apq = apq;
		this.owner_name = owner_name;
	}
	
	public String InitializeQuiz(){
		this.query = "insert into quiz (refNo, name, quiz_key, noq, nqp, apq, created_date, last_edited_date, creator_id) values(?,?,?,?,?,?,?,?,?)";
		PreparedStatement insrt = (PreparedStatement) dbcon.getPrepareStatement(query);
		
		Users creator = new Users();
		this.creator_id = creator.getUserID(this.owner_name);
		
		if(this.creator_id == 0){
			return "";
		}
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_NOW);
		String d = sdf.format(cal.getTime());
		this.created_date = d;
		this.last_edited_date = d;
		this.refNo = this.getRefNo();
		try {
			insrt.setString(1,this.refNo);
			insrt.setString(2,this.name);
			insrt.setString(3,this.quiz_key);
			insrt.setString(4,this.noq);
			insrt.setString(5,this.nqp);
			insrt.setString(6,this.apq);
			insrt.setString(7,this.created_date);
			insrt.setString(8,this.last_edited_date);
			insrt.setInt(9,this.creator_id);
			
			int a = insrt.executeUpdate();
			
			if(a==1){
				return this.refNo;
			}
			else{
				return "";
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return "";
		}
	}
	
	private String getRefNo(){
		String dd = this.created_date;
		String ref_No = "";
		int count = this.countQuizes();
		Random rand = new Random();
		int  n = rand.nextInt(9) + 1;
		ref_No = ref_No + String.valueOf(n);
		String[] parts = dd.split("/");
		if(count<10){
			ref_No = ref_No +"00"+String.valueOf(count);
		}
		else if(count<100){
			ref_No = ref_No +"0"+String.valueOf(count);
		}
		else{
			ref_No = ref_No +String.valueOf(count);
		}
		ref_No = ref_No + parts[1];
		ref_No = ref_No + parts[2];
		return ref_No;
	}
	
	private int countQuizes(){
		this.query = "select refNo from quiz;";
		ResultSet rst = dbcon.getResultSet(query);
		int count = 0;
		try {
			while(rst.next()){
				count = count + 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public String[] getQuizDetails(String refNo){
		this.query = "select * from quiz where refNo = '"+refNo+"';";
		String[] quizDetails = new String[11];
		
		ResultSet rst = dbcon.getResultSet(query);
		try {
			while(rst.next()){
				quizDetails[0] = rst.getString("refNo");
				quizDetails[1] = rst.getString("name");
				quizDetails[2] = rst.getString("quiz_key");
				quizDetails[3] = rst.getString("quizSet");
				quizDetails[4] = rst.getString("created_date");
				quizDetails[5] = rst.getString("last_edited_date");
				quizDetails[6] = rst.getString("activation");				
				quizDetails[7] = String.valueOf(rst.getInt("creator_id"));
				quizDetails[8] = String.valueOf(rst.getInt("noq"));
				quizDetails[9] = String.valueOf(rst.getInt("nqp"));
				quizDetails[10] = String.valueOf(rst.getInt("apq"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return quizDetails;
	}
	
	public String getQuizContent(String refNo){
		this.query = "select quizSet from quiz where refNo = '"+refNo+"';";
		String content = "";
		ResultSet rst = dbcon.getResultSet(query);
		try {
			while(rst.next()){
				content = rst.getString("quizSet");
			}
		}
		catch(SQLException e){
			content = null;
		}
		return content;
	}
	
	public String getQuizName(String refNo){
		this.query = "select name from quiz where refNo = '"+refNo+"';";
		String content = "";
		ResultSet rst = dbcon.getResultSet(query);
		try {
			while(rst.next()){
				content = rst.getString("name");
			}
		}
		catch(SQLException e){
			content = null;
		}
		return content;
	}
}
