<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		var myInfo = JSON.parse('${myInfo}');
		var myCost = JSON.parse('${myCost}');
		
		$("#deptCost").text(myCost +"(원)");
		
		var $meetingList = $("#meetingList");
		var $divCol12 = $("<div></div>").attr("class","col-md-12");
		var $divTile = $("<div></div>").attr("class","tile");
		
		// 정보뿌리기부터
		$("#oneWeek").on("click",function(){
			
		})
	})
</script>
<style type="text/css">
	#meetingInfo{display: inline-block;}
	#deptCostInfo{ float : right;}
	#mypageTitle{background-color: gray;}
	#btnGroup{margin-left:2%;}
</style>
<title>Insert title here</title>
</head>
<body class="app sidebar-mini rtl">
<main class="app-content">
	<div class="app-title">
		<h3>마이페이지</h3>
	</div>
	
	<div class="col-md-12">
		<div class="tile" id="mypageTitle">
			<p>4월달에 총 6번의 회의일정이 있습니다.</p>
			<p>예정된 회의실 사용일정 : </p>
			<hr>
			<div id="meetingInfo">
				<h3 class="tile-title">4월 24일 10 : 00</h3>
				<h3 class="tile-title">본사 - 산토리니</h3>
			</div>
			
			<div id="deptCostInfo">
				<h3 class="tile-title">팀별 회의실 사용 누적금액</h3>
				<h3 class="tile-title" id="deptCost"></h3>
			</div>
		</div>
	</div>
	
	<div class="col-md-12">
		<button class="btn btn-primary" id="scheduledMeeting">예정된 예약</button>
		<button class="btn btn-primary" id="oneWeek">일주일</button>
		<button class="btn btn-primary" id="oneMonth">한달</button>
		<button class="btn btn-primary" id="sixMonth">6개월</button>
		<button class="btn btn-primary" id="oneYear">1년</button>
	</div>
	<br>
	<div id="meetingList">
		
	</div>
</main>
</body>
</html>