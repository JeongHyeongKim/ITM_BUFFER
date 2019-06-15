<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		var resId;
		var myInfo = JSON.parse('${myInfo}');
		var myCost = JSON.parse('${myCost}');
		
		$("#deptCost").text(myCost +"(원)");
		
		function drawPage(myInfo){
			/* $("#listCondition").empty(); */
			$("#meetingList").empty();
			
			$.each(myInfo, function(i, $list) {
				/*
				
				<div class="btn-group btn-group-toggle" data-toggle="buttons">
				<label class="btn btn-primary active">
				<input id="weekList" type="radio" name="listPeriod" autocomplete="off" checked="">일주일 </label>
				<label class="btn btn-primary">
				<input id="monthList" type="radio" name="listPeriod" autocomplete="off"> 1개월 </label>
				<label class="btn btn-primary">
				<input id="6monthList" type="radio" name="listPeriod" autocomplete="off"> 6개월 </label>
				<label class="btn btn-primary">
				<input id="yearList" type="radio" name="listPeriod" autocomplete="off"> 1년 </label>
				<label class="btn btn-primary">
				<input id="allOfList" type="radio" name="listPeriod" autocomplete="off"> 전체 </label>
			</div>
				*/
				var $meetingList = $("#meetingList");
				var $divCol12 = $("<div></div>").attr("class","card mb-3").appendTo($meetingList);
				/* 카드 헤더 */
				var $divTile = $("<div></div>").attr("class","card-header").appendTo($divCol12);
				var $divItag = $("<i></i>").attr("class","fa fa-table").text("회의실 예약 현황").appendTo($divTile);
				
				/* 카드 바디 */
				var $divCard = $("<div class='card-body'></div>").appendTo($divCol12);
				var $divRes = $("<div class='table-responsive'></div>").appendTo($divCard);
				
				var $tableTag = $("<table class='table table-bordered' id='dataTable' width='100%' cellspacing='0'></table>").appendTo($divRes);
				
				var $headTag = $("<thead></thead>").appendTo($tableTag);
				var $headTrTag= $("<tr></tr>").appendTo($headTag);
				$("<th></th>").text("예약일").appendTo($headTrTag);
				$("<th></th>").text("사용일").appendTo($headTrTag);
				$("<th></th>").text("장소").appendTo($headTrTag);
				$("<th></th>").text("상태").appendTo($headTrTag);
				$("<th></th>").text("변경").appendTo($headTrTag);
				
				var $bodyTag = $("<tbody></tbody>").appendTo($tableTag);
				var $bodyTrTag= $("<tr></tr>").appendTo($bodyTag);
				$("<td></td>").text($list.resDate).appendTo($bodyTrTag);
				$("<td></td>").text($list.resStartTime).appendTo($bodyTrTag);
				$("<td></td>").text($list.brName + " - " + $list.mrName).appendTo($bodyTrTag);
				var $currentState = $("<td></td>").text(mappingState($list.resState)).appendTo($bodyTrTag);
				var $changeState = $("<td></td>").appendTo($bodyTrTag);
				
				if(($list.resState=="res_0")||($list.resState=="res_1")){
					resId=$list.resId;
					var $divBtn = $("<div></div>").css("text-align","center").appendTo($changeState);  
					$("<button></button>").attr("class","btn btn-info btn-sm").text("예약 취소").appendTo($divBtn); 
					
					$('.btn').on("click",function(e){
						$.ajax({
							  url : "/meeting/reservation/cancelRes/"+resId,
							  type : "post",
							  data:"_csrf=${_csrf.token}",
							  success:function(){
								  location.href= "/meeting/users/mypage"
							  }, error:function(){
				                	console.log("error")
				              }
						});
					});
				}
				
				/* 카드푸터  */
				var $divFooter = $("<div class='card-footer small text-muted'></div>").appendTo($divCol12);	
			});
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
	#btnGroup{margin-left:2%;}
</style>
<title>Insert title here</title>
</head>
<body class="app sidebar-mini rtl">
<main class="app-content">
	<div class="app-title">
		<div>
			<h1><i class="fa fa-calendar"></i>마이페이지</h1>
			<p>
				나의 회의실 예약 이력과 비용을 확인할 수 있습니다
			</p>
		</div>
		<ul class="app-breadcrumb breadcrumb">
			<li class="breadcrumb-item">
				<i class="fa fa-home fa-lg"></i>
			</li>
			<li class="breadcrumb-item">
				<a href="#">예약이력</a>
			</li>
		</ul>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="tile" >
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
			<div class="tile">
				<div class="tile-body">
					<div class="bs-component" style="margin-bottom: 15px;" id="listCondition">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-primary active">
							<input id="weekList" type="radio" name="listPeriod" autocomplete="off" checked="">일주일 </label>
							<label class="btn btn-primary">
							<input id="monthList" type="radio" name="listPeriod" autocomplete="off"> 1개월 </label>
							<label class="btn btn-primary">
							<input id="6monthList" type="radio" name="listPeriod" autocomplete="off"> 6개월 </label>
							<label class="btn btn-primary">
							<input id="yearList" type="radio" name="listPeriod" autocomplete="off"> 1년 </label>
							<label class="btn btn-primary">
							<input id="allOfList" type="radio" name="listPeriod" autocomplete="off"> 전체 </label>
						</div>
					</div>
				     <div id="meetingList">
		
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="/meeting/resources/js/datatables/jquery.dataTables.js"></script>
<script src="/meeting/resources/js/datatables/dataTables.bootstrap4.js"></script>
<script src="/meeting/resources/js/plugins/sb-admin-datatables.min.js"></script>
<script>
$(document).ready(function() {  
	 $.ajax({
	        url:"/meeting/users/getCurrentId",
	        method :"post",
	        data : "_csrf=${_csrf.token}",
	        success : function(data){
	           var emp = data
	           console.log(emp.empName);
	        }
	     });
});
</script>
</html>