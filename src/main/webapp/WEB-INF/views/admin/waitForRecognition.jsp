<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(function(){
		
		var resId;
		var myInfo = JSON.parse('${resList}');
		var branchList = JSON.parse('${branchList}');
		var equipList = JSON.parse('${equipList}');
		var searchtype ;
		var brId ;
		var email;
		var resDate;
		var resStartDate;
		var resEndDate;
		var deptId;
		var resCost;
		var headEmail;
		var empName;
		
		function drawListBranch(branchList){
			$("#listCondition").empty(); 
			$("#listBranch").empty(); 
			var $listCondition = $("#listCondition");
			var $divDataToggle = $("<div data-toggle='buttons'></div>").attr("class","btn-group btn-group-toggle").appendTo($listCondition);
			
			var $allOfList = $("<label id='allOfList'></label>").attr("class","btn btn-primary prBtn active").text("전체").appendTo($divDataToggle);
			$("<input id='al' class='listPeriod' type='radio'   autocomplete='off' checked=''>").appendTo($allOfList);

			var $weekLabel = $("<label id='oneWeek'></label>").attr("class","btn btn-primary prBtn").text("일주일").appendTo($divDataToggle);
			$("<input id='ow'  class='listPeriod'type='radio'   autocomplete='off'>").appendTo($weekLabel);
			
			var $onemonthLabel = $("<label id='oneMonth'></label>").attr("class","btn btn-primary prBtn").text("1개월").appendTo($divDataToggle);
			$("<input  class='listPeriod' type='radio'  autocomplete='off'>").appendTo($onemonthLabel);
			
			var $sixmonthLabel = $("<label id='sixMonth'></label>").attr("class","btn btn-primary prBtn").text("6개월").appendTo($divDataToggle);
			$("<input  class='listPeriod' type='radio'  autocomplete='off'>").appendTo($sixmonthLabel);
			
			var $yearList = $("<label id='yearList'></label>").attr("class","btn btn-primary prBtn").text("1년").appendTo($divDataToggle);
			$("<input  class='listPeriod' type='radio'   autocomplete='off'>").appendTo($yearList);
			/* listCondition  */
			var $listBranch = $("#listBranch");
			var $divDataToggle = $("<div data-toggle='buttons'></div>").attr("class","btn-group btn-group-toggle").appendTo($listBranch);
			
			var $allOfList =$("<label id='allBrId'></label>").attr("class","btn btn-primary brIdBtn active").text("전체").appendTo($divDataToggle);
			$("<input type='radio' name='listPeriod' value='all' autocomplete='off' >").appendTo($allOfList);
			$.each(branchList, function(i, $list) {
				$allOfList = $("<label id='"+$list.brId+"'></label>").attr("class","btn btn-primary brIdBtn").text($list.brName).appendTo($divDataToggle);
				$("<input  type='radio' name='listPeriod' value='all' autocomplete='off' >").appendTo($allOfList);
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
			$("<th></th>").text("신청자(부서명)").appendTo($headTrTag);
			$("<th></th>").text("장소").appendTo($headTrTag);
			$("<th></th>").text("상태").appendTo($headTrTag);
			$("<th></th>").text("변경").appendTo($headTrTag);
			
			var $bodyTag = $("<tbody></tbody>").appendTo($tableTag);
			$.each(myInfo, function(i, $list) {
				resCost = $list.resCost;
				headEmail = $list.headEmail;
				empName = $list.empName;
				resEndDate = $list.resEndDate;
				deptId= $list.deptId;
				var $bodyTrTag= $("<tr></tr>").appendTo($bodyTag);
				
				$("<td id='"+$list.resId+"' class='showAllInfo'></td>").attr("value",$list.resDate).text($list.resDate.substr(2,14)).appendTo($bodyTrTag);
				$("<td id='"+$list.resId+"' class='showAllInfo'></td>").attr("value",$list.resStartDate).text($list.resStartDate.substr(2,14)+" ~ "+$list.resEndDate.substr(2,14)).appendTo($bodyTrTag);
				$("<td id='"+$list.resId+"'></td>").attr("class","showAllInfo deptId").text($list.empName + "("+$list.deptName+")").appendTo($bodyTrTag);
				$("<td></td>").attr("class","showAllInfo").text(($list.brName) + " - " + ($list.mrName)).appendTo($bodyTrTag);
				
				var $currentState = $("<td data-toggle='modal' data-target='#detail'></td>").text(mappingState($list.resState)).appendTo($bodyTrTag);
				var $changeState = $("<td></td>").appendTo($bodyTrTag);
				
				/* var $divModalStart = $("<div id='detail' style='position: relative; top: auto; right: auto; left: auto; bottom: auto; z-index: 1; display: block;'></div>").attr("class","modal");
				var $divModalDialog = $("<div role='document'></div>").attr("class","modal-dialog").appendTo($divModalStart);
				var $divModalContent = $("<div></div>").attr("class","modal-content").appendTo($divModalDialog);
				var $divModalHeader = $("<div></div>").attr("class","modal-header").appendTo($divModalContent);
				$("<h5></h5>").attr("class","modal-title").text("Modal title").appendTo($divModalHeader);
				var $closeBtn =$("<button type='button' data-dismiss='modal' aria-label='Close'></button>").attr("class","modal-title").text("Modal title").appendTo($divModalHeader);
				$("<span aria-hidden='true'></span>").text("X").appendTo($closeBtn);
				
				var $divModalBody = $("<div></div>").attr("class","modal-body").appendTo($divModalContent);
				$("<p></p>").text("").appendTo($divModalBody);  */
				
				if($list.resState=="res_1"){
					var $divChange = $("<div></div>").attr("class","bs-component").appendTo($changeState);
					var $urChange = $("<ul></ul>").attr("class","nav nav-pills").appendTo($divChange);
					var $liChange = $("<li></li>").attr("class","nav-item dropdown").appendTo($urChange);
					$("<a id='"+$list.empEmail+"' data-toggle='dropdown' href='#' role='button' aria-haspopup='true' aria-expanded='false'></a>").attr("class","nav-link dropdown-toggle").appendTo($liChange);
					var $divDropdown = $("<div></div>").attr("class","dropdown-menu showAllInfo").appendTo($liChange);
					
					$("<a id='approval' value='"+$list.resId+"'></a>").attr("class","dropdown-item").text("승인").appendTo($divDropdown);
					$("<a id='back' value='"+$list.resId+"'></a>").attr("class","dropdown-item").text("반려").appendTo($divDropdown);
					
				}
				
			});

			/* 카드푸터  */
			var $divFooter = $("<div class='card-footer small text-muted'></div>").appendTo($divCol12);	
		}
		 
		/* drawListPeriod(myInfo); */
		drawListBranch(branchList);
		drawPage(myInfo);
		console.log(equipList)
		console.log(myInfo)
		//Modal
		$('.showAllInfo').on("click",function(e){
			var resId = e.currentTarget.id
			
			for(var i=0; i<myInfo.length; i++){ 
				var note;
				var beam;
				var white;
				var mic;
				
				if(equipList[myInfo[i].resId] == null){
					
					note = 0;
					beam = 0;
					white = 0;
					mic = 0;
				} else{
					
					note = equipList[myInfo[i].resId]['N'];
					beam = equipList[myInfo[i].resId]['V'];
					white = equipList[myInfo[i].resId]['W'];
					mic = equipList[myInfo[i].resId]['M'];
				}
				
				if(myInfo[i].resId == resId){
					swal({
		 	      		title: "상세 예약 정보 확인",
		 	      		text: "\n 회의목적 : "+myInfo[i].resPurpose+"\n 회의실명 : "+ myInfo[i].mrName +
		 	      				"\n 참석인원수 : "+myInfo[i].resAttendCnt + 
		 	      				"\n 기자재 : "+"노트북 : " + note +"마이크 : " + mic +"화이트보드 : " + white +"빔프로젝터 : " + beam
					 })		
				}	
			}
			
		}); 
		
		
		$(document).on('click', '.nav-link', function(e){
			email=e.currentTarget.id;
			resDate=$('#resDate').attr("value");
			resStartDate=$('#resStartDate').attr("value"); 
			
		})
		
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
		$('#approval').on("click",function(e){
			
		    console.log("deptId: "+deptId); 
			console.log("resCost: "+resCost);  
			console.log("headEmail: "+headEmail);
			swal({
	      		title: "승인하시겠습니까?",
	      		type: "warning",
	      		showCancelButton: true,
	      		confirmButtonText: "네, 승인하겠습니다",
	      		cancelButtonText: "아뇨, 취소하겠습니다",
	      		closeOnConfirm: false,
	      		closeOnCancel: false
	      	}, function(isConfirm) {
	      		if (isConfirm) {
	      		  resId =  $("#approval").attr("value");
	      		   var str="[회의실 예약 승인 알림]\n"+resDate+"에 "+empName+"님이 예약 신청하신 회의실 예약이 승인되었습니다.\n 사용 일정)\n"+resStartDate+" ~ "+resEndDate+"\n 비용)\n"+resCost+"(원)";
	      			$.ajax({
						  url : "/meeting/recognition/approval/"+resId,
						  type : "post",
						  data:"_csrf=${_csrf.token}"+"&str="+str+"&email="+email+"&deptId="+deptId+"&resCost="+resCost+"&headEmail="+headEmail,
						  success:function(){
							  location.href= "/meeting/recognition/waitForRecognition"
						  }, error:function(){
			                	console.log("error");
			              }
					});
	      			swal("승인 완료!", "해당 예약 정보가 승인되었습니다.", "success");
	      		} else {
	      			swal("승인 취소!", "해당 예약 정보가 승인 되지 않았습니다.", "error");
	      		}
	      	});
		});
		$('#back').on("click",function(e){
			swal({
				  title: "반려하시겠습니까?",
				  text: "반려 사유를 입력해주십시오(메일 발송):",
				  type: "input",
				  showCancelButton: true,
				  closeOnConfirm: false,
				  animation: "slide-from-top",
				  inputPlaceholder: "반려 사유를 입력해주십시오"
				},
				function(inputValue){
				  if (inputValue === false) return false;
					
				  if (inputValue === "") {
				    swal.showInputError("반려 사유가 입력되지 않았습니다!");
				    return false
				  }
				  var str="[회의실 예약 반려 알림]\n"+resDate+"에 예약 신청하신 회의실 예약이 해당 사유로 인해 반려되었습니다.\n반려사유)\n";
				  str+=inputValue;
				  resId =  $("#back").attr("value");	   
	      			$.ajax({
						  url : "/meeting/recognition/back/"+resId,
						  type : "post",
						  data:"_csrf=${_csrf.token}"+"&str="+str+"&email="+email,
						  success:function(){
							  location.href= "/meeting/recognition/waitForRecognition"
						  }, error:function(){
			                	console.log("error");
			              }
					});
				  swal("반려 및 메일 전송 완료!", "You wrote: " + inputValue, "success");
				});
		});	
		
		$(document).on('click', '.prBtn', function(e){
			 searchtype=e.currentTarget.id;
			 console.log(searchtype);
		})
		$(document).on('click', '.brIdBtn', function(e){
			brId=e.currentTarget.id;
			console.log(brId);
			btnClassClick();
		})
		
		
        var btnClassClick = function(e){
		
        	$.ajax({
        	    url:"/meeting/recognition/searchByPeriod/searchtype="+searchtype+"&searchtypeByBranch="+brId,
        	    type:"post",
        	    data:"_csrf=${_csrf.token}",
        	    success:function(data){	
        	    	var pageInfo = JSON.parse(data);
					  drawPage(pageInfo);
        	    }
        	   })
			   
        }
	});
	
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
					
					 <!-- <div class="modal fade" id="detail" role="dialog">
					    <div class="modal-dialog">
					      Modal content
					      <div class="modal-content">
					        <div class="modal-header">
					        	<h4 class="modal-title">예약 상세 정보</h4>
					        	<button type="button" class="close" data-dismiss="modal">×</button>
					        </div>
					        <div class="modal-body">
					         
					        </div>
					      </div>
				   	   </div>
         	        </div>  -->
				</div>
			</div>
		</div>
	</div>
</main>
<script src="/meeting/resources/js/datatables/jquery.dataTables.js"></script>
<script src="/meeting/resources/js/datatables/dataTables.bootstrap4.js"></script>
<script src="/meeting/resources/js/plugins/sb-admin-datatables.min.js"></script>
<script src="/meeting/resources/js/plugins/sweetalert.min.js"></script>
<script type="text/javascript" src="/meeting/resources/js/plugins/bootstrap-notify.min.js"></script>
<script type="text/javascript" src="/meeting/resources/js/plugins/sweetalert.min.js"></script>