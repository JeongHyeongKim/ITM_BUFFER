<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<script type="text/javascript">
	 $(function(){
		var resList = '${list}';
		//console.log("확인: "+resList[0]);
	}) 
</script>
<script type="text/javascript" src="/meeting/resources/js/plugins/fullcalendar.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function() {
      
      	$('#external-events .fc-event').each(function() {
      
      		// store data so the calendar knows to render an event upon drop
      		$(this).data('event', {
      			title: $.trim($(this).text()), // use the element's text as the event title
      			stick: true // maintain when user navigates (see docs on the renderEvent method)
      		});
      
      		// make the event draggable using jQuery UI
      		$(this).draggable({
      			zIndex: 999,
      			revert: true,      // will cause the event to go back to its
      			revertDuration: 0  //  original position after the drag
      		});
      
      	});
      
      	$('#calendar').fullCalendar({
      		header: {
      			left: 'prev,next today',
      			center: 'title',
      			right: 'month,agendaWeek,agendaDay'
      		},
      		editable: true,
      		droppable: true, // this allows things to be dropped onto the calendar
      		drop: function() {
      			// is the "remove after drop" checkbox checked?
      			if ($('#drop-remove').is(':checked')) {
      				// if so, remove the element from the "Draggable Events" list
      				$(this).remove();
      			}
      		}
      	});
      
      
      });
    </script>
<title>Insert title here</title>
</head>
<body>
<main class="app-content">
	 <div class="app-title">
        <div>
          <h1><i class="fa fa-calendar"></i>회의실 예약 현황</h1>
          <p>지사를 선택한 뒤, 달력을 통해 예약 현황을 확인하세요 </p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
        </ul>
      </div>
      
       <div class="row user">
        <!-- <div class="col-md-12">
          <div class="tile row"> -->
            <div class="col-md-3">
	          <div class="tile p-0">
	            <ul class="nav flex-column nav-tabs user-tabs">
	              <li class="nav-item"><a class="nav-link">지사 선택</a></li>
	              <li class="nav-item"><a class="nav-link active" href="#main-building" data-toggle="tab">본사</a></li>
	              <li class="nav-item"><a class="nav-link" href="#samhwan-building" data-toggle="tab">삼환빌딩</a></li>
	              <li class="nav-item"><a class="nav-link" href="#gangseo-building" data-toggle="tab">GS강서타워</a></li>
	              <li class="nav-item"><a class="nav-link" href="#gangbuk-building" data-toggle="tab">데이터센터</a></li>
	            </ul>
	          </div>
	        </div>
            <div class="col-md-9">
              <div id="calendar"></div>
            </div>
          <!-- </div>
        </div> -->
      </div>
      
	<div>
		<%-- <table id="resList">
			<tbody>
				<c:forEach items="${list }" var="resList">
					<tr>
						<td><c:out value="${resList.empName}" /></td> 
						<td><c:out value="${resList.resDate}" /></td>
					</tr>
				</c:forEach>
			</tbody> 
		</table> --%>
	</div> 
</main>
</body>
</html>