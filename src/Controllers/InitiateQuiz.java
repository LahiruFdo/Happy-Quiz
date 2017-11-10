package Controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Models.Quiz;

@WebServlet("/InitiateQuiz")
public class InitiateQuiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InitiateQuiz() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String quizName = request.getParameter("quiz-name");
		String key = request.getParameter("key");
		String noq = request.getParameter("noq");
		String nqp = request.getParameter("nqp");
		String apq = request.getParameter("apq");
		
		HttpSession session1 = request.getSession(false);
		String user_username = (String)session1.getAttribute("username");
		
		Quiz newQuiz = new Quiz(quizName, key, noq, nqp, apq, user_username);
		String initialization = newQuiz.InitializeQuiz();
		
		if(initialization != ""){
			String[] newQuizDetails = newQuiz.getQuizDetails(initialization);
			request.setAttribute("quizDetails",newQuizDetails);
			request.getRequestDispatcher("quiz-view.jsp").forward(request, response);
		}
		
		else{}
		System.out.println(quizName+" "+key+" "+noq+" "+nqp+" "+apq);		
		
	}

}
