package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.cityDTO;
import Model.quizDAO;
import Model.quizDTO;
import Model.reviewDTO;
import Model.statisticsDAO;
import Model.statisticsDTO;

@WebServlet("/statisticsCon")
public class statisticsCon extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("STATISTICS CONTROLLER");
		
		ArrayList<statisticsDTO> age_cnt = new ArrayList<statisticsDTO>();
		ArrayList<reviewDTO> review_cnt = new ArrayList<reviewDTO>();
		ArrayList<cityDTO> city_cnt = new ArrayList<cityDTO>(); 
//		String age = request.getParameter("age");
//		String review = request.getParameter("review");
	
		statisticsDAO dao = new statisticsDAO();
		
		age_cnt = dao.statistics();
		review_cnt = dao.review();
		city_cnt = dao.city();
		
		System.out.println(age_cnt);
		System.out.println(review_cnt);
		System.out.println(city_cnt);
		
		
		
//		String quiz_path = dto.getQuiz_path();
		//String t = "./wordle/wordle.jsp";
		
//		if(slist != null) {
//			System.out.println("Success Select statistics");
//			
//			HttpSession session = request.getSession();
//			session.setAttribute("info", slist);
//			
//			//response.sendRedirect("./wordle/wordle.jsp");
//			response.sendRedirect(quiz_path);
//		} else {
//			System.out.println("Fail Select statistics");
//			response.sendRedirect("./charte.html");
//		}
		
	
	}

}
