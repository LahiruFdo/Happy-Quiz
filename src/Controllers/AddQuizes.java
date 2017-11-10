package Controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@WebServlet("/AddQuizes")
public class AddQuizes extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public AddQuizes() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String refNo = request.getParameter("refNo");
		String noq = request.getParameter("NoQ");
		//String apq;
		int NoQ = Integer.parseInt(noq);
		JSONArray jArray = new JSONArray();
		
		for(int i=1; i<NoQ; i++){
			String ind = ""+i+"";
			String qst = request.getParameter(ind);
			JSONObject obj = new JSONObject();
			try {
				obj.put("qst", qst);
                                System.out.println(qst);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			for(int j=1; j<5; j++){
				String index = ind+"-"+j;
				String op = request.getParameter(index);
				String option = "option-"+i;
				try {
					obj.put(option, op);
                                        System.out.println(op);
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			jArray.put(obj);
		}
		System.out.println(jArray.toString());
	}

}
