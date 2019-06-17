<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
$(function(){
	var allPayment = JSON.parse('${allPayment}');
	
	function drawMySchedule(allPayment){
		$("#costInfo").empty(); 
		var $meetingInfo = $("#costInfo");
		$("<h3></h3>").attr("class","tile-title").text(allPayment).appendTo($meetingInfo);
		
	}
	function drawListPeriod(){
		$("#listCondition").empty(); 
		/* listCondition  */
		var $listCondition = $("#listCondition");
		var $divDataToggle = $("<div data-toggle='buttons'></div>").attr("class","btn-group btn-group-toggle").appendTo($listCondition);
		
		var $allOfList = $("<label id='allOfList'></label>").attr("class","btn btn-primary active").text("전체").appendTo($divDataToggle);
		$("<input id='allOfList' type='radio' name='listPeriod' value='all' autocomplete='off' checked=''>").appendTo($allOfList);
		
		
		var $weekLabel = $("<label id='oneWeek'></label>").attr("class","btn btn-primary").text("일주일").appendTo($divDataToggle);
		$("<input id='oneWeek' type='radio' name='listPeriod'  autocomplete='off'>").appendTo($weekLabel);
		
		var $onemonthLabel = $("<label id='oneMonth'></label>").attr("class","btn btn-primary").text("1개월").appendTo($divDataToggle);
		$("<input id='oneMonth' type='radio' name='listPeriod' autocomplete='off'>").appendTo($onemonthLabel);
		
		var $sixmonthLabel = $("<label id='sixMonth'></label>").attr("class","btn btn-primary").text("6개월").appendTo($divDataToggle);
		$("<input id='sixMonth' type='radio' name='listPeriod'  autocomplete='off'>").appendTo($sixmonthLabel);
		
		var $yearList = $("<label id='yearList'></label>").attr("class","btn btn-primary").text("1년").appendTo($divDataToggle);
		$("<input id='yearList' type='radio' name='listPeriod'  autocomplete='off'>").appendTo($yearList);
	}
	function drawPage(myInfo){

		$("#meetingList").empty();
		/* meetingList  */
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
		
		$.each(myInfo, function(i, $list) {
			var $bodyTrTag= $("<tr></tr>").appendTo($bodyTag);
			$("<td></td>").text($list.resDate).appendTo($bodyTrTag);
			$("<td></td>").text($list.resStartTime).appendTo($bodyTrTag);
			$("<td></td>").text(($list.brName) + " - " + ($list.mrName)).appendTo($bodyTrTag);
			var $currentState = $("<td></td>").text(mappingState($list.resState)).appendTo($bodyTrTag);
			var $changeState = $("<td></td>").appendTo($bodyTrTag);
			
			if(($list.resState=="res_0")||($list.resState=="res_1")){
				resId=$list.resId;
				var $divBtn = $("<div></div>").css("text-align","center").appendTo($changeState);  
				$("<button id='"+resId+"'></button>").attr("class","btn btn-info btn-sm").text("예약 취소").appendTo($divBtn); 
				
				$('#'+resId+'').on("click",function(e){
					$.ajax({
						  url : "/meeting/reservation/cancelRes/"+resId, /* 이후 users로 패키지 변경 */
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
		});
		/* 카드푸터  */
		var $divFooter = $("<div class='card-footer small text-muted'></div>").appendTo($divCol12);	
	}
	drawMySchedule(allPayment);
	drawListPeriod();
	drawPage();
});
</script>
<main class="app-content">
	<div class="app-title">
		<div>
			<h1><i class="fa fa-calendar"></i>결제관리</h1>
			<p>
				회의실 결제 관리입니다.
			</p>
		</div>
		<ul class="app-breadcrumb breadcrumb">
			<li class="breadcrumb-item">
			<i class="fa fa-home fa-lg"></i>
			</li>
			<li class="breadcrumb-item">
			<a href="#">예약이력</a>
			</li>
			<li class="breadcrumb-item">
			<a href="#">결제관리</a>
			</li>
		</ul>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="tile" style="width:100%;height:250px" id="costInfo">
				
			</div>
		</div>
		<div class="col-md-12">
			<div class="tile">
				<div class="tile-body">
					<div class="bs-component" style="margin-bottom: 15px;" id="listCondition">
						
					</div>
				     <div id="meetingList">
		
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<script src="/meeting/resources/js/datatables/jquery.dataTables.js"></script>
<script src="/meeting/resources/js/datatables/dataTables.bootstrap4.js"></script>
<script src="/meeting/resources/js/plugins/sb-admin-datatables.min.js"></script>