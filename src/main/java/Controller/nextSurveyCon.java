package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.userDAO;
import Model.userDTO;

@WebServlet("/nextSurveyCon")
public class nextSurveyCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String nickname = request.getParameter("user_id");
		int review = Integer.parseInt(request.getParameter("review"));
		String nextletter = request.getParameter("nextletter");
		
		System.out.println(nickname);
		System.out.println(review);
		System.out.println(nextletter);
		
		userDTO dto = new userDTO(nickname, nextletter, review);
		userDAO dao = new userDAO();
		
		int cnt = dao.updateUser(dto);
		
		if(cnt != 0) {
			System.out.println("UserData Update Success");
			
			HttpSession session = request.getSession();
			//session.removeAttribute("info");
			session.invalidate();
			
		} else {
			System.out.println("UserData Update Fail");
		}
		
		response.sendRedirect("./main2.jsp");
	}

}
