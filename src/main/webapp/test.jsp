<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Model.placeDAO" %>
<%@ page import="Model.placeDTO" %>
<%@ page import = "java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	placeDAO dao = new placeDAO();
	ArrayList<placeDTO> list = dao.placeinfo();
	
	for(int i = 0; i < list.size(); i++){
		System.out.println("insert into placeinfo values('" + list.get(i).getPlaceid() + "', '" + list.get(i).getQuiz() + "' , '" + list.get(i).getExplanation() + "' , " + list.get(i).getLatitude() + " , " + list.get(i).getLongitude() + " , '" + list.get(i).getPath()+"');");
	}
%>
</body>
</html>