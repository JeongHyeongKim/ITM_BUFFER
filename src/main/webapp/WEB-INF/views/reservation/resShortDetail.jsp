<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	 $(function(){
		var resShortDetail = '${resShortDetail}';
		//console.log("Ȯ��: "+resList[0]);
	}) 
</script>
</head>
<body>
	<main class="app-content">
	<div class="app-title">
        <div>
          <h1><i class="fa fa-building"></i>ȸ�ǽ� ����</h1>
          <p>���縦 ������ ��, ȸ�ǽ��� Ȯ���ϼ���</p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="resShortMain.jsp">ȸ�ǽ� ����</a></li>
        </ul>
      </div>
      <div class="row user">
      <div class="col-md-3">
          <div class="tile p-0">
            <ul class="nav flex-column nav-tabs user-tabs">
              <li class="nav-item"><a class="nav-link">���� ����</a></li>
              <li class="nav-item"><a class="nav-link active" href="#meeting-room" data-toggle="tab">����</a></li>
              <li class="nav-item"><a class="nav-link" href="#meeting-room" data-toggle="tab">��ȯ����</a></li>
              <li class="nav-item"><a class="nav-link" href="#meeting-room" data-toggle="tab">GS����Ÿ��</a></li>
              <li class="nav-item"><a class="nav-link" href="#meeting-room" data-toggle="tab">�����ͼ���</a></li>
            </ul>
          </div>
        </div>
       </div>
        <div class="col-md-9">
          <div class="tab-content">
 			<!-- Modal -->
				<div class="modal fade" id="myModal" role="dialog">
				    <div class="modal-dialog">
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				        	<h4 class="modal-title">���� ��û</h4>
				        	<button type="button" class="close" data-dismiss="modal">��</button>
				        </div>
				        <div class="modal-body">
				          <form>
			                  <div class="row mb-4">
			                    <div class="col-md-4">
			                      <label>��û�� ��</label>
			                      <input class="form-control" type="text">
			                    </div>
			                    <div class="col-md-4">
			                      <label>���� �ۼ�</label><br>
			                      <button class="btn btn-primary" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>�ֱ� �̷� �ҷ�����</button>
			                    </div>
			                  </div>
			                  <div class="row">
			                    <div class="col-md-4">
			                      <label>ȸ�ǽ� ��</label>
			                      <input class="form-control" type="text">
			                    </div>
			                    <div class="clearfix"></div>
			                    <div class="col-md-4">
			                      <label>���� ���� ����</label>
			                      <input class="form-control" type="date">
			                    </div>
			                    <div class="clearfix"></div>
			                    <div class="col-md-4">
			                      <label>���� ���� ����</label>
			                      <input class="form-control" type="date">
			                    </div>
			                    <div class="col-md-4">
			                      <label>��� ����</label>
			                      <input class="form-control" type="text">
			                    </div>
			                    <div class="clearfix"></div>
			                    <div class="col-md-4">
			                      <label>ȸ�� ����</label>
			                      <input class="form-control" type="text">
			                    </div>
			                    <div class="clearfix"></div>
			                    <div class="col-md-4">
			                      <label>������</label>
			                      <input class="form-control" type="text">
			                    </div>
			                    <div class="clearfix"></div>
			                    <div class="col-md-4">
			                      <label>���� ���<button class="btn btn-outline" type="button" data-toggle="modal" data-target="#meetingPeople">+</button></label>
			                      <input class="form-control" type="text">
			                    </div>
			                     <div class="clearfix"></div>
			                    <div class="col-md-4">
			                      <label>����</label><br>
			                      <input type=checkbox name=snack value="����">��������<br> 
			                    </div>
			                  </div>
					        <div class="modal-footer">
					        	<div class="row mb-10">
				                   <div class="col-md-12">
				                     <button class="btn btn-primary" data-dismiss="modal" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i> Save</button>
				                   </div>
				                </div>
					        </div>
				        </form>
				      </div>
				    </div>
				  </div>
         	   </div>
          <!-- Modal -->
			<div class="modal fade" id="meetingPeople" role="dialog">
			  <div class="modal-dialog">
				<!-- Modal content-->
				  <div class="modal-content">
				    <div class="modal-header">
				       <h4 class="modal-title">������ ����</h4>
				        <button type="button" class="close" data-dismiss="modal">��</button>
				    </div>
				    <div class="modal-body">
				      <form>
				        <c:forEach items="${meetingPeopleList}" var="meetingPeopleList">
			               <div class="row mb-4">
			                  <div class="col-md-4">
			                    <input type=checkbox name=meetingPerson value="${meetingPeopleList.empName}">${meetingPeopleList.empName}<br> 
			                  </div>
			                </div>
			             </c:forEach>
			             <div class="modal-footer">
					       <div class="row mb-10">
				             <div class="col-md-12">
				                <button class="btn btn-primary" data-dismiss="modal" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>����</button>
				             </div>
				           </div>
					      </div>  
				      	</form>
				       </div>
				      </div>
				   </div>
         	     </div>
            </div>
        </div>
        <div class="row">
        <div class="col-md-12">
          <div class="tile row">
            <div class="col-md-9">
              <div id="calendar"></div>
            </div>
          </div>
        </div>
      </div>
	</main>
	<script type="text/javascript" src="/meeting/resources/js/plugins/fullcalendar.min.js"></script>
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
</body>
</html>