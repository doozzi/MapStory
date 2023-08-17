<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.anychart.com/releases/v8/js/anychart-base.min.js"></script>
<script src="https://cdn.anychart.com/releases/v8/js/anychart-tag-cloud.min.js"></script>
</head>
<body>

<div class="chart-area">
	<div id="container" style="width:500px; height:500px;"></div>
</div>

<script> 
anychart.onDocumentReady(function (){
	var data = [ { "x": "IT",
		"value": 59,
		category: "Sino-Tibetan" },
		{ "x": "Python",
		"value": 28,
		category: "Indo-European" },
		{ "x": "소프트웨어",
		"value": 100,
		category: "Indo-European" },
		{ "x": "JAVA",
		"value": 52,
		category: "Indo-European" },
		{ "x": "C++",
		"value": 42,
		category: "Afro-Asiatic" },
		{ "x": "HTML",
		"value": 62,
		category: "Afro-Asiatic" } ];
	var chart = anychart.tagCloud(data);
	chart.angles([0]);
	chart.container("container");
	// chart.getCredits().setEnabled(false);
	chart.draw(); }); 
</script>


</body>
</html>