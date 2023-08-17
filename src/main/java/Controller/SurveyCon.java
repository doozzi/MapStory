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

@WebServlet("/SurveyCon")
public class SurveyCon extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String age = request.getParameter("age");
		String city = request.getParameter("city");
		String prevletter = request.getParameter("prevletter");
		
		System.out.println(age);
		System.out.println(city);
		System.out.println(prevletter);
		
		userDTO dto = new userDTO(age, city, prevletter);
		userDAO dao = new userDAO();
		
		userDTO info = dao.user(dto);
		
		if(info != null ) {
			System.out.println("insert success");
			
			HttpSession session = request.getSession();
			session.setAttribute("info", info);
			
		} else {
			System.out.println("insert fail");
		}
		
		//response.sendRedirect("./main.jsp");
		response.sendRedirect("./placeinfoCon");
	}

}
