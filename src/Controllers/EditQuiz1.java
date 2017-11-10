package Controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.Quiz;

@WebServlet("/EditQuiz1")
public class EditQuiz1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditQuiz1() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String refNo = request.getParameter("id");
		Quiz editingQuiz = new Quiz();
		String[] quizDetails = editingQuiz.getQuizDetails(refNo);
		
		request.setAttribute("name", quizDetails[1]);
		request.setAttribute("refNo", refNo);
		request.setAttribute("noq", quizDetails[8]);
		request.setAttribute("nqp", quizDetails[9]);
		request.setAttribute("apq", quizDetails[10]);
		request.getRequestDispatcher("edit-quiz-first.jsp").forward(request, response);
	}

}