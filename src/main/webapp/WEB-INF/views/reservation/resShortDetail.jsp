<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/meeting/resources/css/jquery.datetimepicker.css" rel="stylesheet"/>
<link href="/meeting/resources/css/fullcalendar.min.css" rel="stylesheet"/>
<link href="/meeting/resources/css/fullcalendar.print.min.css" media="print" rel="stylesheet"/>
<main class="app-content">
    <div class="app-title">
        <div>
            <h1>
                <i class="fa fa-calendar"></i>회의실 예약</h1>
            <p>회의실 예약 현황을 확인한 뒤, 예약을 신청하세요</p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item">
                <i class="fa fa-home fa-lg"></i>
            </li>
            <li class="breadcrumb-item">
                <a href="/meeting/reservation/resShortMain/br_0001">회의실 예약</a>
            </li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12" style="width:100%;">
            <div class="tile row">
                <div id="calendar"></div>
            </div>
        </div>
    </div>
</main>
<%-- Page specific javascripts--%>
<script src="/meeting/resources/js/plugins/moment.min.js" type="text/javascript"></script>
<script src="/meeting/resources/js/plugins/fullcalendar.min.js" type="text/javascript"></script>
<script src="/meeting/resources/js/plugins/jquery-ui.min.js" type="text/javascript"></script>
<script src="/meeting/resources/js/plugins/jquery.datetimepicker.full.js"></script>
<script src="/meeting/resources/js/plugins/sweetalert.min.js"></script>
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
            	 <c:forEach items="${mrReservationList}" var="list" varStatus="status">  
                { 
                   id : '${list.resId}', 
                   title : '${list.mrName}-${list.empName}',
                   start : '${list.resStartDate}',
                   end : '${list.resEndDate}',
                   backgroundColor:'#ffc107'
                },
            	</c:forEach> 
                ],
            dayClick: function(date, allDay, jsEvent, view) {
            	var str="";
            	var yy=date.format("YYYY");
            	var mm=date.format("MM");
            	var dd=date.format("DD");
            	str = yy+"/"+mm+"/"+dd+" ";
            	swal({
              		title: "예약 신청",
              		text: str+"에 예약을 진행하시겠습니까?",
              		
              		showCancelButton: true,
              		confirmButtonText: "예약 신청",
              		cancelButtonText: "취소",
              		closeOnConfirm: false,
              		closeOnCancel: false
              	}, function(isConfirm) {
              		if (isConfirm) {
              			window.sessionStorage.setItem("currentDate",str);
              			document.location.href="/meeting/reservation/resWrite";
              		} else {
              			location.reload();
              		}
              	});
            }
        });
        
        
    }); 
    
    </script>