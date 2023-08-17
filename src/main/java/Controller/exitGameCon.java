package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.resultDAO;
import Model.resultDTO;

@WebServlet("/exitGameCon")
public class exitGameCon extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("[exitGameCon]");
	
		String nickname = request.getParameter("nickname");
		String placeid = request.getParameter("placeid");
		String quiz = request.getParameter("quiz");
		String result = request.getParameter("result");
		int score = Integer.parseInt(request.getParameter("score"));
		
		System.out.println("result : "+result);
		System.out.println("nickname : " + nickname);
		System.out.println("placeid : " + placeid);
		System.out.println("quiz : " + quiz);
		
		resultDTO updated_info = new resultDTO(nickname, placeid, quiz, result, score);
		
		resultDAO dao = new resultDAO();
		int cnt = dao.insertData(updated_info);
		
		if(cnt > 0) {
			System.out.println("데이터 삽입 성공");
			
			HttpSession session = request.getSession();
			session.removeAttribute("quizinfo");
			
			// 로그인 정보가 담긴 session 업데이트, 갱신
			// -> 같은 session 이름에 다른 값 담아주기(덮어쓰기)
			//HttpSession session = request.getSession();
			//session.setAttribute("info", updated_info);
			
		} else {
			System.out.println("데이터 삽입 실패");
		}
		
		response.sendRedirect("./map.jsp");
	}

}
