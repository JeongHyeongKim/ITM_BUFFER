<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function(){
		
		var resId;
		var myInfo = JSON.parse('${resList}');
		var branchList = JSON.parse('${branchList}');
		
		function drawListPeriod(myInfo){
			$("#listCondition").empty(); 
			/* listCondition  */
			var $listCondition = $("#listCondition");
			var $divDataToggle = $("<div data-toggle='buttons'></div>").attr("class","btn-group btn-group-toggle").appendTo($listCondition);
			
			var $allOfList = $("<label id='allOfList'></label>").attr("class","btn btn-primary active").appendTo($divDataToggle);
			$("<input id='allOfList' type='radio' name='listPeriod' value='all' autocomplete='off' checked=''>").text("전체").appendTo($allOfList);
			
			
			var $weekLabel = $("<label id='oneWeek'></label>").attr("class","btn btn-primary").appendTo($divDataToggle);
			$("<input id='oneWeek' type='radio' name='listPeriod'  autocomplete='off'>").text("일주일").appendTo($weekLabel);
			
			var $onemonthLabel = $("<label id='oneMonth'></label>").attr("class","btn btn-primary").appendTo($divDataToggle);
			$("<input id='oneMonth' type='radio' name='listPeriod' autocomplete='off'>").text("1개월").appendTo($onemonthLabel);
			
			var $sixmonthLabel = $("<label id='sixMonth'></label>").attr("class","btn btn-primary").appendTo($divDataToggle);
			$("<input id='sixMonth' type='radio' name='listPeriod'  autocomplete='off'>").text("6개월").appendTo($sixmonthLabel);
			
			var $yearList = $("<label id='yearList'></label>").attr("class","btn btn-primary").appendTo($divDataToggle);
			$("<input id='yearList' type='radio' name='listPeriod'  autocomplete='off'>").text("1년").appendTo($yearList);
		}
		function drawListBranch(branchList){
			$("#listBranch").empty(); 
			/* listCondition  */
			var $listBranch = $("#listBranch");
			var $divDataToggle = $("<div data-toggle='buttons'></div>").attr("class","btn-group btn-group-toggle").appendTo($listBranch);
			$.each(branchList, function(i, $list) {
				if(i==0){
					var $allOfList = $("<label></label>").attr("class","btn btn-primary active").appendTo($divDataToggle);
					$("<input id='allOfList' type='radio' name='listPeriod' value='all' autocomplete='off' checked=''>").text($list.brName).appendTo($allOfList);
				}else{
					var $allOfList = $("<label></label>").attr("class","btn btn-primary").appendTo($divDataToggle);
					$("<input id='allOfList' type='radio' name='listPeriod' value='all' autocomplete='off' >").text($list.brName).appendTo($allOfList);
				
				}
			});
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
			$("<th></th>").text("신청자").appendTo($headTrTag);
			$("<th></th>").text("장소").appendTo($headTrTag);
			$("<th></th>").text("회의목적").appendTo($headTrTag);
			$("<th></th>").text("상태").appendTo($headTrTag);
			$("<th></th>").text("변경").appendTo($headTrTag);
			
			var $bodyTag = $("<tbody></tbody>").appendTo($tableTag);
			$.each(myInfo, function(i, $list) {
				
				var $bodyTrTag= $("<tr></tr>").appendTo($bodyTag);
				$("<td></td>").text($list.resDate).appendTo($bodyTrTag);
				$("<td></td>").text($list.resStartDate).appendTo($bodyTrTag);
				$("<td></td>").text($list.empName).appendTo($bodyTrTag);
				$("<td></td>").text(($list.brName) + " - " + ($list.mrName)).appendTo($bodyTrTag);
				$("<td></td>").text($list.resPurpose).appendTo($bodyTrTag);
				var $currentState = $("<td></td>").text(mappingState($list.resState)).appendTo($bodyTrTag);
				var $changeState = $("<td></td>").appendTo($bodyTrTag);
				
				if(($list.resState=="res_0")||($list.resState=="res_1")){
					var $divChange = $("<div></div>").attr("class","bs-component").appendTo($changeState);
					var $urChange = $("<ul></ul>").attr("class","nav nav-pills").appendTo($divChange);
					var $liChange = $("<li></li>").attr("class","nav-item dropdown").appendTo($urChange);
					$("<a data-toggle='dropdown' href='#' role='button' aria-haspopup='true' aria-expanded='false'></a>").attr("class","nav-link dropdown-toggle").text("상태").appendTo($liChange);
					var $divDropdown = $("<div></div>").attr("class","dropdown-menu").appendTo($liChange);
					
					$("<a></a>").attr("class","dropdown-item").text("승인").appendTo($divDropdown);
					$("<a></a>").attr("class","dropdown-item").text("반려").appendTo($divDropdown);
				}
			});

			/* 카드푸터  */
			var $divFooter = $("<div class='card-footer small text-muted'></div>").appendTo($divCol12);	
		}
		drawListPeriod(myInfo);
		drawListBranch(branchList);
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
		
		/* $(document).on('click', '.btn-primary', function(e){
		  
			  var searchtype = e.currentTarget.id;
			  $.ajax({
				  url : "/meeting/users/search/"+searchtype,
				  type : "post",
				  data:"_csrf=${_csrf.token}",
				  success:function(data){
					  var pageInfo = JSON.parse(data);
					  drawPage(pageInfo);
					  
				  }
			});
		}); */
		
	})
</script>
<main class="app-content">
<div class="app-title">
	<div>
		<h1><i class="fa fa-calendar"></i>예약이력</h1>
		<p>
			회의실 예약 전체 현황 목록입니다.
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
		<a href="#">예약현황</a>
		</li>
	</ul>
</div>
	<div class="row">
		<div class="col-md-12">
			<div class="tile">
				<div class="tile-body">
					<div class="bs-component" style="margin-bottom: 15px;" id="listCondition">
						
					</div>
					<div class="bs-component" style="margin-bottom: 15px;" id="listBranch">
					
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
