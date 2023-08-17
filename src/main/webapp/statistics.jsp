<%@page import="Model.cityDTO"%>
<%@page import="Model.reviewDTO"%>
<%@page import="Model.letterDTO"%>
<%@page import="Model.statisticsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="Model.statisticsDAO"%>
<%@ page import="java.util.HashMap"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="shortcut icon" type="image/x-icon" href="docs/images/favicon.ico" />
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin=""/>
<link rel="stylesheet" href="./css/common.css">

<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js" integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA==" crossorigin=""></script>

<style>
@font-face {
  font-family: 'GmarketSansMedium';
  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
  font-weight: normal;
  font-style: normal;
}

.info {
	padding: 6px 8px;
	font: 14px/16px Arial, Helvetica, sans-serif;
	background: white;
	background: rgba(255, 255, 255, 0.8);
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
	border-radius: 5px;
}

.info h4 {
	margin: 0 0 5px;
	color: #777;
}

.legend {
	text-align: left;
	line-height: 18px;
	color: #555;
}

.legend i {
	width: 18px;
	height: 18px;
	float: left;
	margin-right: 8px;
	opacity: 0.7;
}

.city_cnt { display: none; }
.age_cnt { display: none; }
.prev_cnt { display: none; }
.next_cnt {	display: none; }

#map {
	height: 800px;
	width: 100%;
}

#columnchart_material {
	width: 100%;
	height: 300px;
}

#prevletter {
	width: 100%;
	height: 400px;
	float: left;
}

#nextletter {
	width: 100%;
	height: 400px;
	float: right;
}

.map-section {
	width: 35%;
	height: 800px;
	float: left;
	margin-left: 2%;
	margin-top: 2%;
	box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
}

.bar-section {
	width: 60%;
	height: 400px;
	float: right;
	margin-right: 2%;
	margin-top: 2%;
	box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
}

.word-section {
	width: 60%;
	height: 400px;
	float: right;
	margin-right: 2%;
}

.prevletter {
	width: 45%;
	height: 400px;
	float: left;
	margin-right: 2%;
	box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
}

.nextletter {
	width: 45%;
	height: 400px;
	float: right;
	box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
}

.title {
	text-align: center;
	font-size: 20px;
	font-family: 'GmarketSansMedium';
}
</style>

</head>
<body>
<%
statisticsDAO dao = new statisticsDAO();

ArrayList<statisticsDTO> age_cnt = new ArrayList<statisticsDTO>();
ArrayList<reviewDTO> review_cnt = new ArrayList<reviewDTO>();
ArrayList<cityDTO> city_cnt = new ArrayList<cityDTO>();
ArrayList<letterDTO> prevletters = new ArrayList<letterDTO>();
ArrayList<letterDTO> nextletters = new ArrayList<letterDTO>();

age_cnt = dao.statistics();
review_cnt = dao.review();
city_cnt = dao.city();
prevletters = dao.prevletter();
System.out.println(prevletters.size());
nextletters = dao.nextletter();
System.out.println(nextletters.size());
%>
	<header class="header">
		<div class="inner">
			<ul class="header-menu">
				<li class="nav-item">
					<a href="./main2.jsp"> HOME </a>
				</li>
				<li class="nav-item">
					<a href="./survey.jsp"> GAME </a>
				</li>
				<li class="nav-item">
					<a href="./statistics.jsp">	STATISTICS </a>
				</li>
				<li class="nav-item">
					<a href="./historic.jsp"> HISTORIC SITE </a>
				</li>
			</ul>
		</div>
	</header>
	
	<table class = "city_cnt">
		<thead>
			<tr>
				<th> 지역 </th>
				<th> 이용자수 </th>
			</tr>
		</thead>
		<tbody id = "city_tbody">
		<% for(int i = 0; i < city_cnt.size(); i++){ %>
			<tr>
				<td> <%= city_cnt.get(i).getCity() %> </td>
				<td> <%= city_cnt.get(i).getCnt() %> </td>
			</tr>
		<% } %>
		</tbody>
	</table>
	
	<table class = "age_cnt">
		<thead>
			<tr>
				<th> 나이대 </th>
				<th> 이용자수 </th>
			</tr>
		</thead>
		<tbody id = "age_tbody">
		<% for(int i = 0; i < age_cnt.size(); i++){ %>
		
			<tr>
				<td> <%= age_cnt.get(i).getAge() %> </td>
				<td> <%= age_cnt.get(i).getCnt() %> </td>
			</tr>
		
		<% } %>
		</tbody>
	</table>
	
	<table class = "prev_cnt">
		<thead>
			<tr>
				<th> 단어 </th>
				<th> 갯수 </th>
			</tr>
		</thead>
		<tbody id = "prev_tbody">
		<% for(int i = 0; i < prevletters.size(); i++){ %>
		
			<tr>
				<td> <%= prevletters.get(i).getLetter() %> </td>
				<td> <%= prevletters.get(i).getCnt() %> </td>
			</tr>
		
		<% } %>
		</tbody>
	</table>
	
	<table class = "next_cnt">
		<thead>
			<tr>
				<th> 단어 </th>
				<th> 갯수 </th>
			</tr>
		</thead>
		<tbody id = "next_tbody">
		<% for(int i = 0; i < nextletters.size(); i++){ %>
		
			<tr>
				<td> <%= nextletters.get(i).getLetter() %> </td>
				<td> <%= nextletters.get(i).getCnt() %> </td>
			</tr>
		
		<% } %>
		</tbody>
	</table>
	
	<section class = "map-section">
        <strong class = "title"> 지역별 이용자 수 </strong>
        <div id='map'></div>
	</section>
	
	<section class = "bar-section">
        <strong class = "title"> 나이대별 이용자 수 </strong>
        <div id="columnchart_material"></div>
	</section>
	
	<section class = "word-section">
        <section class = "prevletter">
            <strong class = "title"> 게임 전 단어 </strong>
            <div id="prevletter"></div>
        </section>

        <section class = "nextletter"> 
            <strong class ="title"> 게임 후 단어</strong>
            <div id="nextletter"></div>
        </section>
	</section>

<script src="https://cdn.anychart.com/releases/v8/js/anychart-base.min.js"></script>
<script src="https://cdn.anychart.com/releases/v8/js/anychart-tag-cloud.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript" src ="./js/mapStatistic.js"></script>
<script type="text/javascript" src="./js/barStatistic.js"></script>

<script type="text/javascript"> 
var prev_cnt = document.getElementById("prev_tbody").getElementsByTagName("tr");
console.log("prev : " + prev_cnt.length);

/* 
var data = "[";

for(int i = 0; prev_cnt.length; i++){
	data += "{ 'x' : " + prev_cnt[i].getElementsByTagName("td")[0].firstChild.data + ", 'value': " + prev_cnt[i].getElementsByTagName("td")[1].firstChild.data + ", category: 'Sino-Tibetan' }";
	
	if(i < (prev_cnt.length-1)) {
		data += ",";
	} else if (i == (prev_cnt.length - 1)){
		data += "];"
	}
}
console.log(data);
 */
 
anychart.onDocumentReady(function (){
	//var prevdata = data;
	var prevdata = [ 
		{ "x": "민주화운동", "value": 27, category: "Sino-Tibetan" },
		{ "x": "광주", "value": 38, category: "Indo-European" },
		{ "x": "억압", "value": 26, category: "Indo-European" },
		{ "x": "전두환", "value": 14, category: "Indo-European" },	
		{ "x": "민주주의", "value": 4,	category: "Indo-European" },
		{ "x": "시민", "value": 4, category: "Afro-Asiatic" },
		{ "x": "시위", "value": 1, category: "Afro-Asiatic" },
		{ "x": "518", "value": 11, category: "Afro-Asiatic" },
		{ "x": "26년", "value": 1, category: "Afro-Asiatic" },
		{ "x": "계엄군", "value": 2, category: "Afro-Asiatic" },
		{ "x": "계엄령", "value": 1, category: "Afro-Asiatic" },
		{ "x": "민주화", "value": 9, category: "Afro-Asiatic" },
		{ "x": "화려한휴가", "value": 1, category: "Afro-Asiatic" },
		{ "x": "공수부대", "value": 1, category: "Afro-Asiatic" },
		{ "x": "택시운전사", "value": 3, category: "Afro-Asiatic" }];
	
	var prevchart = anychart.tagCloud(prevdata);
	prevchart.angles([0]);
	prevchart.container("prevletter");
	// chart.getCredits().setEnabled(false);
	prevchart.draw(); }); 
</script>

<script type="text/javascript"> 

anychart.onDocumentReady(function (){
	var nextdata = [ 
		{ "x": "시민", "value": 25, category: "Sino-Tibetan" },
		{ "x": "희생", "value": 23, category: "Indo-European" },			
		{ "x": "학생", "value": 9, category: "Indo-European" },	
		{ "x": "민주화", "value": 23,	category: "Indo-European" },
		{ "x": "열망", "value": 15, category: "Afro-Asiatic" },
		{ "x": "전남대학교", "value": 4, category: "Afro-Asiatic" },
		{ "x": "택시", "value": 3, category: "Afro-Asiatic" },
		{ "x": "자유", "value": 11, category: "Afro-Asiatic" },
		{ "x": "시민군", "value": 1, category: "Afro-Asiatic" },
		{ "x": "금남로", "value": 1, category: "Afro-Asiatic" },
		{ "x": "광주", "value": 1, category: "Afro-Asiatic" },
		{ "x": "민주주의", "value": 1, category: "Afro-Asiatic" } ];
	
	var nextchart = anychart.tagCloud(nextdata);
	nextchart.angles([0]);
	nextchart.container("nextletter");
	// chart.getCredits().setEnabled(false);
	nextchart.draw(); }); 
</script>

</body>
</html>