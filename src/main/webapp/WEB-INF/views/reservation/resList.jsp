<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
	        <!-- 검색창 -->
	        <div class="tile row">
	        	<form action="" method="">
	        		<div class="row">
		        		 <div class="col-md-4">
			        		<select name='fruits' class="form-control">
							  <option value='' selected>-지사-</option>
							  <option value='apple'>사과</option>
							  <option value='banana'>바나나</option>
							  <option value='lemon'>레몬</option>
							</select>
						 </div>
						<div class="col-md-4">
							<select name='fruits' class="form-control">
							  <option value='' selected>-회의실구분-</option>
							  <option value='apple'>사과</option>
							  <option value='banana'>바나나</option>
							  <option value='lemon'>레몬</option>
							</select>
						</div>
						<div class="col-md-4">
							<div class="tile-body">
							<input class="form-control" id="demoDate" type="text" placeholder="-날짜-">
							</div>
						</div>
						<div class="col-md-4">
			        		<select name='fruits' class="form-control">
							  <option value='' selected>-수용인원-</option>
							  <option value='apple'>사과</option>
							  <option value='banana'>바나나</option>
							  <option value='lemon'>레몬</option>
							</select>
						 </div>
						<div class="row mb-10">
				            <div class="col-md-12">
				               <input type="submit" value="검색" class="form-control">
				            </div>
				        </div>
					</div>
	        	</form>
	        </div>
        
          	<div class="tile row">
            	<div class="col-md-3">
                	<h4 class="mb-4">지사 선택</h4>
                	<div class="fc-event active">본사</div>
                	<div class="fc-event">삼환빌딩</div>
                	<div class="fc-event">GS강서타워</div>
                	<div class="fc-event">데이터센터</div> 
                	<button class="btn btn-warning" type="button" data-toggle="modal" onclick="">회의실 바로 예약하기</button>
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
    <script src="/meeting/resources/js/plugins/bootstrap-datepicker.min.js"></script>
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
      	 $('#demoDate').datepicker({
           	format: "dd/mm/yyyy",
           	autoclose: true,
           	todayHighlight: true
           });
      });
      
    </script>
</body>
</html>