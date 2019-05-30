<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          	<div class="tile row">
            	<div class="col-md-3">
                	<h4 class="mb-4">지사 선택</h4>
                	<div class="fc-event">본사</div>
                	<div class="fc-event">삼환빌딩</div>
                	<div class="fc-event">GS강서타워</div>
                	<div class="fc-event">데이터센터</div> 
                	<p class="animated-checkbox mt-20">
	                  <label>
	                    <span class="label-text">회의실 바로 예약하기</span>
	                  </label>
	                </p>
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
    <script src="/meeting/resources/js/plugins/jquery-ui.custom.min.js"></script>
    <script src="/meeting/resources/js/plugins/moment.min.js"></script>
    <script src="/meeting/resources/js/plugins/fullcalendar.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function() {
      	$('#calendar').fullCalendar({
      		header: {
      			left: 'prev,next today',
      			center: 'title',
      			right: 'month,agendaWeek,agendaDay'
      		},
      		editable: true,
      		droppable: true, // this allows things to be dropped onto the calendar 
      	});
      });
    </script>
