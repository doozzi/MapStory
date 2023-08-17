/**
 * 
 */
google.charts.load('current', {'packages':['bar']});
google.charts.setOnLoadCallback(drawChart);

var age_cnt = document.getElementById("age_tbody").getElementsByTagName("tr");

//console.log(age_cnt.length);
//console.log(age_cnt[0].getElementsByTagName("td")[1].firstChild.data);
	
function drawChart() {
  var bardata = google.visualization.arrayToDataTable([
    ['나이대', '이용자수'],
    [age_cnt[0].getElementsByTagName("td")[0].firstChild.data, age_cnt[0].getElementsByTagName("td")[1].firstChild.data],
    [age_cnt[1].getElementsByTagName("td")[0].firstChild.data, age_cnt[1].getElementsByTagName("td")[1].firstChild.data],
    [age_cnt[2].getElementsByTagName("td")[0].firstChild.data, age_cnt[2].getElementsByTagName("td")[1].firstChild.data],
    [age_cnt[3].getElementsByTagName("td")[0].firstChild.data, age_cnt[3].getElementsByTagName("td")[1].firstChild.data],
    [age_cnt[4].getElementsByTagName("td")[0].firstChild.data, age_cnt[4].getElementsByTagName("td")[1].firstChild.data],
    [age_cnt[5].getElementsByTagName("td")[0].firstChild.data, age_cnt[5].getElementsByTagName("td")[1].firstChild.data]
  ]);

  var options = {
    chart: {
      title: '게임 결과 통계',
	  vAxis: {title: "나이대"},
	  hAxis: {title: "이용자수"},
    }
  };

  var barchart = new google.charts.Bar(document.getElementById('columnchart_material'));

  barchart.draw(bardata, google.charts.Bar.convertOptions(options));
}