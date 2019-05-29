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
          <h1><i class="fa fa-calendar"></i>회의실 예약 현황</h1>
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
                <h4 class="mb-4">Draggable Events</h4>
                <div class="fc-event">My Event 1</div>
                <div class="fc-event">My Event 2</div>
                <div class="fc-event">My Event 3</div>
                <div class="fc-event">My Event 4</div>
                <div class="fc-event">My Event 5</div> 
            </div>
            <div class="col-md-9">
              <div id="calendar"></div>
            </div>
          </div>
        </div>
      </div>
</main>
<!-- Essential javascripts for application to work-->

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
</body>
</html>