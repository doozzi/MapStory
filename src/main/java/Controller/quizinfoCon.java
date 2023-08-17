package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.quizDAO;
import Model.quizDTO;

@WebServlet("/quizinfoCon")
public class quizinfoCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("QUIZINFO CONTROLLER");
		
		String quiz = request.getParameter("quiz");
		String placeid = request.getParameter("placeid");
		System.out.println(quiz);
		System.out.println(placeid);
		
		quizDAO dao = new quizDAO();
		quizDTO dto = dao.quizinfo(quiz, placeid);
		String quiz_path = dto.getQuiz_path();
		
		if(dto != null) {
			System.out.println("Success Select QUIZINFO");
			
			HttpSession session = request.getSession();
			session.setAttribute("quizinfo", dto);
			
			response.sendRedirect(quiz_path);
		} else {
			System.out.println("Fail Select QUIZINFO");
			response.sendRedirect("./map.jsp");
		}
		
	}

}
