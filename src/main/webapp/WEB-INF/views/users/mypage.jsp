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
		
		function drawPage(myInfo){
			$("#meetingList").empty();

			$.each(myInfo, function(i, $list) {
				var $meetingList = $("#meetingList");
				var $divCol12 = $("<div></div>").attr("class","col-md-12").appendTo($meetingList);
				var $divTile = $("<div></div>").attr("class","tile").appendTo($divCol12);
				
				$("<p class='tile-title'></p>").text($list.resStartTime).appendTo($divTile);
				$("<hr>").appendTo($divTile);
				var $divBlock = $("<div></div>").css("display","inline-block").appendTo($divTile);
				$("<p></p>").text("10 : 30 - 11 : 00").appendTo($divBlock);
				$("<p></p>").text($list.brName + " - " + $list.mrName).appendTo($divBlock);
				var currentState = mappingState($list.resState);
				
				var $divBtn = $("<div></div>").css("float","right").appendTo($divTile);
				$("<button></button>").attr("class","btn btn-warning").text(currentState).appendTo($divBtn);
			})
		}
		
		drawPage(myInfo);
		
		function mappingState(resState){
			var state = null;
			if(resState == "res_0"){
				return state = "1차승인대기"
			} else if(resState == "res_1"){
				return state = "2차승인대기"
			} else if(resState == "res_2"){
				return state = "예약완료"
			} else if(resState == "res_3"){
				return state = "반려된예약"
			} else if(resState == "res_4"){
				return state = "취소된예약"
			} else if(resState == "res_5"){
				return state = "사용종료"
			} else {
				return state = "미사용"
			} 
		}
		$(".btn-primary").on("click",function(e){
			  
			  var searchtype = e.currentTarget.id;
			  $.ajax({
				  url : "/meeting/users/search/"+searchtype,
				  type : "post",
				  data:"_csrf=${_csrf.token}",
				  success:function(data){
					  console.log(data)
					  var pageInfo = JSON.parse(data);
					  drawPage(pageInfo)
				  }
			})
		})
	})
</script>
<style type="text/css">
	#meetingInfo{
		display: inline-block;
		
	}
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
		<button class="btn btn-primary" id="oneWeek"  data-searchtype="oneWeek">일주일</button>
		<button class="btn btn-primary" id="oneMonth"  data-searchtype="oneMonth">한달</button>
		<button class="btn btn-primary" id="sixMonth"  data-searchtype="sixMonth">6개월</button>
		<button class="btn btn-primary" id="oneYear"  data-searchtype="oneYear">1년</button>
	</div>
	<br>
	<div id="meetingList">
		
	</div>
</main>
</body>
</html>