<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
	$(function(){

	    var today = new Date();
		var todayMonth = today.getMonth()+1;
		document.getElementById ( 'month' ).innerHTML=todayMonth;
		var deptCost = JSON.parse('${deptCost}');
	    $("#deptCost").text(comma(deptCost)+"(원)");
	    var mySchedule = JSON.parse('${mySchedule}');  
		document.getElementById ( 'cntSchedule' ).innerHTML=mySchedule.length;
		function drawMySchedule(mySchedule){
			$("#meetingInfo").empty(); 
			var $meetingInfo = $("#meetingInfo");
			if(mySchedule.length==0){
				$("<h3></h3>").attr("class","tile-title").text("예정된 회의실 예약 일정이 없습니다").appendTo($meetingInfo);
			}
			$.each(mySchedule, function(i, $list) {	
				if(i==0){
					$("<h3></h3>").attr("class","tile-title").text($list.resStartDate).appendTo($meetingInfo);
					$("<h3></h3>").attr("class","tile-title").text($list.brName+" - "+$list.mrName).appendTo($meetingInfo);
				}else{
					$("<h3></h3>").attr("class","tile-title").appendTo($meetingInfo);
					$("<h3></h3>").attr("class","tile-title").appendTo($meetingInfo);
				}			
			});
		}
		drawMySchedule(mySchedule);
		//금액에 콤마
		function comma(str) {
	        str = String(str);
	        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	    }
	});
</script>
<link href="/meeting/resources/css/jquery.datetimepicker.css" rel="stylesheet" /> 

<link href="/meeting/resources/css/fullcalendar.min.css" rel="stylesheet" />
<link href="/meeting/resources/css/fullcalendar.print.min.css" rel="stylesheet" media="print" />

<main class="app-content">
	<div class="app-title">
        <div>
          <h1><i class="fa fa-calendar"></i> GS ITM 회의실 예약 관리 시스템</h1>
          <p>지사를 선택한 뒤, 회의실 예약 현황을 확인하세요</p>
          
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
        </ul>
    </div>
    
    <div class="row">
	    <div class="col-md-12">	
	    	<div class="tile" style="width:100%;height:250px">
				<p><b id="month"></b>월달에 총 <b id="cntSchedule"></b>번의 회의일정이 있습니다.</p>
				<p>예정된 회의실 사용일정 : </p>
				<hr>
				<div id="meetingInfo" style="float:left;">
				</div>
				
				<div id="deptCostInfo" style="float:right;text-align:right">
					<h3 class="tile-title">팀별 회의실 사용 누적금액</h3>
					<h3 class="tile-title" id="deptCost"></h3>
				</div>
			</div>
	    </div>
		<div class="col-md-12">
			<div class="tile">
				<div class="tile-body" style="width:100%;text-align:right">
	              <form class="row" method="GET" action="/meeting/reservation/search">
	                <div class="form-group col-md-3">
	                  <select name='brId' class="form-control">
						<option value='' selected>--지사구분--</option>
						<c:forEach items="${branchList}" var="branchList">
							<option value='${branchList.brId}'>${branchList.brName}</option>
						</c:forEach>
					    </select>
				     </div>
				     <div class="form-group col-md-3">
	                  <select name='mrType' class="form-control">
						<option value='' selected>--회의실구분--</option>
						<c:forEach items="${mrTypeList}" var="mrTypeList">
							<c:if test="${mrTypeList.mrType eq 'mr_type_0'}">
								<option value='${mrTypeList.mrType}'>회의실</option>
							</c:if>
							<c:if test="${mrTypeList.mrType eq 'mr_type_1'}">
								<option value='${mrTypeList.mrType}'>대회의실</option>
							</c:if>
							<c:if test="${mrTypeList.mrType eq 'mr_type_2'}">
								<option value='${mrTypeList.mrType}'>교육실</option>
							</c:if>
						</c:forEach>
					    </select>
				     </div>
					  <div class="form-group col-md-3">
				       <select name='mrLimit' class="form-control">
						<option value='' selected>--수용인원--</option>
							<c:forEach items="${mrLimitList}" var="mrLimitList">
								<option value='${mrLimitList.mrLimit}'>${mrLimitList.mrLimit}</option>
							</c:forEach>
					    </select>
	                </div>
	                <div class="form-group col-md-3"> 
	                  <div class="tile-body">
						 <input class="form-control" type="text" placeholder="예약일" id="searchDate">
					  </div>
	                </div>
	                <input type="hidden" id="resStartDate" name="resStartDate"> 
	               <div class="form-group col-md-3"></div>
	                <div class="form-group col-md-3"></div>
	                <div class="form-group col-md-3"></div>
	                <div class="form-group col-md-3" style="display:inline-block;">
	                	<button class="btn btn-info" type="button" data-toggle="modal" data-target="#reservation"><i class="fa fa-fw fa-lg fa-check-circle"></i>바로 예약</button>
	                  	<input class="btn btn-primary" type="submit" value="검색"/>
	                </div> 
	              </form>
	            </div>
	          </div>
        		<!-- Modal -->
				  <div class="modal fade" id="reservation" role="dialog">
				    <div class="modal-dialog">
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				        	<h4 class="modal-title">회의실 바로 예약</h4>
				        	<button type="button" class="close" data-dismiss="modal">×</button>
				        </div>
				        <div class="modal-body">
				          <form action="/meeting/reservation/writeReservation" method="POST">
					          <input type="hidden" value="it0005" name="empId" /> 
					          <input type="hidden" value="res_0041" name="resId" /> 
					          <input type="hidden" value="mr_0001" name="mrId" />
					          <input type="hidden" value="sysdate" name="resDate">
					          <input type="hidden" value="res_1" name="resState" />
					          <input type="hidden" value="" name="resAddRequest" />
					          
					          <input type="hidden" value="" name="resCancle">
					          <input type="hidden" value="" name="resCost" />
					          <input type="hidden" value="" name="resOutside" />
			                  <div class="row mb-4">
			                    <div class="col-md-4">
			                      <label>신청자 명</label>
			                      <input class="form-control" type="text" id="name">
			                    </div>
			                    <div class="col-md-4">
			                      <label>간편 작성</label><br>
			                      <button class="btn btn-primary btn-sm" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>최근 이력 불러오기</button>
			                    </div>
			                  </div>
			                  <div class="row">
			                    <div class="col-md-4">
			                      <label>회의실 명</label>
			                      <input class="form-control" type="text" name="mrName">
			                    </div>
			                    <div class="clearfix"></div>
			                    <div class="col-md-4">
			                      <label>사용 시작 일정</label>
			                      <div class="tile-body">
						              <input class="form-control" id="resStartTime" type="text" placeholder="시작" name="resStartTime">
						           </div>
			                    </div>
			                    <div class="clearfix"></div>
			                    <div class="col-md-4">
			                      <label>사용 종료 일정</label>
			                      <div class="tile-body">
						              <input class="form-control" id="resEndTime" type="text" placeholder="종료" name="resEndTime">
						           </div>
			                    </div>
			                    <div class="col-md-4">
			                      <label>사용 목적</label>
			                      <input class="form-control" type="text" name="resPurpose">
			                    </div>
			                    <div class="clearfix"></div>
			                    <div class="col-md-4">
			                      <label>회의 구분</label>
			                      <input class="form-control" type="text" name="resType">
			                    </div>
			                    <div class="clearfix"></div>
			                    <div class="col-md-4">
			                      <label>기자재</label>&nbsp;&nbsp;<button class="btn btn-primary btn-sm" type="button" data-toggle="modal" data-target="#meetingPeople">+</button>
			                      <input class="form-control" type="text">
			                    </div>
			                    <div class="clearfix"></div>
			                    <div class="col-md-4">
			                      <label>참석 인원</label>
			                      <input class="form-control" type="text" name="resAttendCnt">
			                    </div>
			                     <div class="clearfix"></div>
			                    <div class="col-md-4">
			                      <label>간식</label><br>
			                      <div class="animated-checkbox">
						              <label>
						                <input type="checkbox" name="resSnack"><span class="label-text">간식 있음</span>
						              </label>
					              </div>
			                    </div>
			                  </div>
					        <div class="modal-footer" style="margin-top:20px">
					        	<div class="row mb-10">
				                   <div class="col-md-12">
				                     <input type="submit" class="btn btn-success" data-dismiss="modal" value="예약신청">
				                   </div>
				                </div>
					        </div>
				      	</form>
				      </div>
				      </div>
				   </div>
         	     </div>
          	<div class="tile row">
            	<div class="col-md-3">
            	<c:forEach items="${branchList}" var="branchList">
					<div class="fc-event">
					        <label class="btn btn-primary branchList" style="width:100%;">
					           <input id="${branchList.brId}" type="radio" name="options" style="display:none;margin:10px"onClick="location.href='/meeting/reservation/list/${branchList.brId}'"> ${branchList.brName}
					        </label>
					</div>
					</c:forEach>	
                	<!-- <button class="btn btn-warning" type="button" data-toggle="modal" onclick="">회의실 바로 예약하기</button> -->
            	 </div>
            	 <div class="col-md-9">
	              <div id="calendar"></div>
	            </div> 
          	</div>
          	</div>
		          	<div class="col-md-6">
		          <div class="tile">
		            <h3 class="tile-title">Line Chart</h3>
		            <div class="embed-responsive embed-responsive-16by9">
		              <canvas class="embed-responsive-item" id="lineChartDemo"></canvas>
		            </div>
		          </div>
		        </div>
		        
		        <div class="col-md-6">
          <div class="tile">
            <h3 class="tile-title">Bar Chart</h3>
            <div class="embed-responsive embed-responsive-16by9">
              <canvas class="embed-responsive-item" id="barChartDemo"></canvas>
            </div>
          </div>
        </div>
        </div>
</main>
<%-- Essential javascripts for application to work--%>
<%-- Page specific javascripts--%>
<script src="/meeting/resources/js/plugins/moment.min.js" type="text/javascript"></script>
<script src="/meeting/resources/js/plugins/fullcalendar.min.js" type="text/javascript"></script>
<script src="/meeting/resources/js/plugins/jquery-ui.min.js" type="text/javascript"></script>
<script src="/meeting/resources/js/plugins/jquery.datetimepicker.full.js"></script> 
<script type="text/javascript" src="/meeting/resources/js/plugins/chart.js"></script>
<script type="text/javascript">
      
      $('#resStartTime').datetimepicker({
    	  'step': 30 
      });
      $('#resEndTime').datetimepicker({
    	  'step': 30 
      });
      $('#searchDate').datetimepicker({
    	  'step': 30 
      });
</script>


<script>
 $(document).ready(function() { 
    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,basicWeek,basicDay'
        },
        defaultDate: new Date(),
        navLinks: true, // can click day/week names to navigate views
        editable: true,
        lang : "ko",
        droppable: true, // this allows things to be dropped onto the calendar
        eventLimit: true, // allow "more" link when too many events
        
        events : [
        	 <c:forEach items="${resList}" var="list" varStatus="status"> 
            { 
               id : '${list.resId}', 
               title : '${list.mrName}-${list.empName}',
               start : '${list.resStartDate}',
               end : '${list.resEndDate}',
               backgroundColor:'#ffc107'
            },
        	</c:forEach> 
            ]
    });
    
    
    
    $.ajax({
        url:"/meeting/users/getCurrentId",
        method :"post",
        data : "_csrf=${_csrf.token}",
        success : function(data){
           var emp = data
           console.log(emp.empName);
        }
     })
     $('#searchDate').blur(function() {
    	 var start =String($('#searchDate').val());
    	 console.log(start);
    	 
    	 $('#resStartDate').val(start);
     });
}); 

</script>