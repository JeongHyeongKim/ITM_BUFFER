<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
			<div class="tile">
				<div class="tile-body" style="width:100%;text-align:right">
	              <form class="row">
	                <div class="form-group col-md-3">
	                  <select name='fruits' class="form-control">
						<option value='' selected>--회의실구분--</option>
						<option value='apple'>사과</option>
						<option value='banana'>바나나</option>
						<option value='lemon'>레몬</option>
					    </select>
				     </div>
				     <div class="form-group col-md-3">
	                  <select name='fruits' class="form-control">
						<option value='' selected>--회의실구분--</option>
						<option value='apple'>사과</option>
						<option value='banana'>바나나</option>
						<option value='lemon'>레몬</option>
					    </select>
				     </div>
					  <div class="form-group col-md-3">
				       <select name='fruits' class="form-control">
						<option value='' selected>--회의실구분--</option>
						<option value='apple'>사과</option>
						<option value='banana'>바나나</option>
						<option value='lemon'>레몬</option>
					    </select>
	                </div>
	                <div class="form-group col-md-3"> 
	                  <div class="tile-body">
						 <input class="form-control" id="searchDate" type="text" placeholder="예약일">
					  </div>
	                </div>
	                <div class="form-group col-md-3"></div>
	                <div class="form-group col-md-3"></div>
	                <div class="form-group col-md-3"></div>
	                <div class="form-group col-md-3" style="display:inline-block;">
	                	<button class="btn btn-info" type="button" data-toggle="modal" data-target="#reservation"><i class="fa fa-fw fa-lg fa-check-circle"></i>바로 예약</button>
	                  	<button class="btn btn-primary" type="button"><i class="fa fa-fw fa-lg fa-search"></i>검색</button>
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
				          <form>
			                  <div class="row mb-4">
			                    <div class="col-md-4">
			                      <label>신청자 명</label>
			                      <input class="form-control" type="text">
			                    </div>
			                    <div class="col-md-4">
			                      <label>간편 작성</label><br>
			                      <button class="btn btn-primary btn-sm" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>최근 이력 불러오기</button>
			                    </div>
			                  </div>
			                  <div class="row">
			                    <div class="col-md-4">
			                      <label>회의실 명</label>
			                      <input class="form-control" type="text">
			                    </div>
			                    <div class="clearfix"></div>
			                    <div class="col-md-4">
			                      <label>사용 시작 일정</label>
			                      <div class="tile-body">
						              <input class="form-control" id="resStartTime" type="text" placeholder="시작">
						           </div>
			                    </div>
			                    <div class="clearfix"></div>
			                    <div class="col-md-4">
			                      <label>사용 종료 일정</label>
			                      <div class="tile-body">
						              <input class="form-control" id="resEndTime" type="text" placeholder="종료">
						           </div>
			                    </div>
			                    <div class="col-md-4">
			                      <label>사용 목적</label>
			                      <input class="form-control" type="text">
			                    </div>
			                    <div class="clearfix"></div>
			                    <div class="col-md-4">
			                      <label>회의 구분</label>
			                      <input class="form-control" type="text">
			                    </div>
			                    <div class="clearfix"></div>
			                    <div class="col-md-4">
			                      <label>기자재</label>&nbsp;&nbsp;<button class="btn btn-primary btn-sm" type="button" data-toggle="modal" data-target="#meetingPeople">+</button>
			                      <input class="form-control" type="text">
			                    </div>
			                    <div class="clearfix"></div>
			                    <div class="col-md-4">
			                      <label>참석 명단</label>&nbsp;&nbsp;<button class="btn btn-primary btn-sm" type="button" data-toggle="modal" data-target="#meetingPeople">+</button>
			                      <input class="form-control" type="text">
			                    </div>
			                     <div class="clearfix"></div>
			                    <div class="col-md-4">
			                      <label>간식</label><br>
			                      <div class="animated-checkbox">
					              <label>
					                <input type="checkbox"><span class="label-text">간식 있음</span>
					              </label>
					            </div>
			                    </div>
			                  </div>
					        <div class="modal-footer" style="margin-top:20px">
					        	<div class="row mb-10">
				                   <div class="col-md-12">
				                     <button class="btn btn-success" data-dismiss="modal" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>예약신청</button>
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
					        <label class="btn btn-primary" style="width:100%;">
					           <input id="${branchList.brId}" type="radio" name="options" style="display:none;margin:10px"> ${branchList.brName}
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
        </div>
</main>
<!-- Essential javascripts for application to work-->
<!-- Page specific javascripts-->
<script src="/meeting/resources/js/moment.min.js" type="text/javascript"></script>
<script src="/meeting/resources/js/fullcalendar.min.js" type="text/javascript"></script>
<script src="/meeting/resources/js/jquery-ui.min.js" type="text/javascript"></script>
<!-- PAGE LEVEL SCRIPTS-->
<script src="/meeting/resources/js/calendar-demo.js" type="text/javascript"></script>

<script src="/meeting/resources/js/plugins/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript">
      $('#sl').click(function(){
      	$('#tl').loadingBtn();
      	$('#tb').loadingBtn({ text : "Signing In"});
      });
      
      $('#el').click(function(){
      	$('#tl').loadingBtnComplete();
      	$('#tb').loadingBtnComplete({ html : "Sign In"});
      });
      
      $('#resStartTime').datepicker({
      	format: "yy/mm/dd",
      	autoclose: true,
      	todayHighlight: true
      });
      $('#resEndTime').datepicker({
        	format: "yy/mm/dd",
        	autoclose: true,
        	todayHighlight: true
        });
      $('#searchDate').datepicker({
      	format: "yy/mm/dd",
      	autoclose: true,
      	todayHighlight: true
      });
      $('#demoSelect').select2();
    </script>