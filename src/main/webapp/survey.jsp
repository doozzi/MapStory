<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Model.userDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 2431 </title>

<link rel="stylesheet" href="./css/survey.css">

</head>
<body>
    <% 
		userDTO info = (userDTO)session.getAttribute("info");
	%>
	
    
    <% if(info == null) { %>
   	<div class="wrapper">
  		<div class="inner">
      		<div class="image-holder">
          		<img src="./img/5.jpg" alt>
      		</div>
      	<form action = "SurveyCon" method = "post"> 
        	<div> 
          		<h1> 사전조사 </h1>
        	</div>
	        <div>
          		<h4> 나이 * </h4>
          		<select name = "age" class="select">
	            	<option value="10대">10대</option>
	                <option value="20대">20대</option>
	                <option value="30대">30대</option>
	                <option value="40대">40대</option>
	                <option value="50대">50대</option>
	                <option value="60대이상">60대이상</option>
          		</select> 
        	</div>
        <div>
        	<h4> 지역 * </h4>
           	<select name = "city" class="select">
               <option value="서울특별시">서울특별시</option>
               <option value="광주광역시">광주광역시</option>
               <option value="인천광역시">인천광역시</option>
               <option value="부산광역시">부산광역시</option>
               <option value="대전광역시">대전광역시</option>
               <option value="울산광역시">울산광역시</option>
               <option value="대구광역시">대구광역시</option>
               <option value="경기도">경기도</option>
               <option value="충청북도">충청북도</option>
               <option value="충청남도">충청남도</option>
               <option value="전라북도">전라북도</option>
               <option value="전라남도">전라남도</option>
               <option value="경상북도">경상북도</option>
               <option value="경상남도">경상남도</option>
               <option value="강원도">강원도</option>
               <option value="제주도">제주도</option>
            </select>
        </div>
        <div class="letter">
        	<h4> 5.18하면 떠오르는 단어 혹은 문장 * </h4>
          	<input type="text" name="prevletter" id="kk" placeholder="5.18하면 떠오르는 단어 혹은 문장"> 
        </div>
        <div class="submit">
            <input type="submit" value="제출">
        </div>
      </form>
    </div>  
  </div>
 
	<% } else { %>
		<div class="wrapper">
  			<div class="inner">
      			<div class="image-holder">
          			<img src="./img/6.jpg" alt>
      			</div>
				<form action = "nextSurveyCon" method = "post">`
					<div> 
			      		<h1> 게임 후 조사 </h1>
			    	</div>
			    	<input type = "text" name = "user_id" value = <%= info.getNickname() %> style = "display: none;" >
		    		<div>
			      		<h4> 게임 후기 * </h4>
			        	<label><input type="radio" name="review" value=100> 매우 도움이 됐다. </label> <br>
			        	<label><input type="radio" name="review" value=75> 어느정도 도움이 됐다. </label> <br>
			        	<label><input type="radio" name="review" value=50> 보통이다. </label> <br>
			        	<label><input type="radio" name="review" value=25> 별로 도움이 안됐다. </label> <br>
			        	<label><input type="radio" name="review" value=0> 전혀 도움이 안됐다. </label> <br>
			        </div>
			    	<div class="letter">
			        	<h4> 게임 후 5.18하면 떠오르는 단어 혹은 문장 * </h4>
			     		<input type="text" name="nextletter" id="kk" placeholder="게임 후 5.18하면 떠오르는 단어 혹은 문장"> 
			    	</div>
		        	<div class="submit">
		        		<input type="submit" value="제출">
		        	</div>
	    		</form>
	    	</div>
	 	</div>
	<% } %>
  	
  
</body>
</html>