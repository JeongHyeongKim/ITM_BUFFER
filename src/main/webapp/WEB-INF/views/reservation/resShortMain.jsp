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
		var resShortList = '${resShortMain}'
		//console.log("Ȯ��: "+resList[0]);
		console.log(resShortList[1])
		var BrId = resShortList[1].brId;
		var recentURL = window.location.href;
		var splitURL = recentURL.split("/");
		var lastURL = splitURL[splitURL.length-1];
		$("#"+lastURL).attr("class","nav-link active");
		
	}) 
</script>
<script>
$(function() {
		/* $('.nav-link').click(function() {
			var buildingName = $(this).attr('value');
			console.log(buildingName);
			var data = {"brId" : buildingName};
			$.ajax({
	              url : "/meeting/reservation/resShortMain/" + buildingName,
	              type : "get",
	             
	              success : function(data) {
	                 console.log(data.brId)
	              }
	           })
		});
		 */     
	});
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
              <li class="nav-item"><a class="nav-link" >���� ����</a></li>
              <li class="nav-item"><a class="nav-link" href="/meeting/reservation/resShortMain/br_0001" id="br_0001" >����</a></li>
              <li class="nav-item"><a class="nav-link" href="/meeting/reservation/resShortMain/br_0002" id="br_0002" >��ȯ����</a></li>
              <li class="nav-item"><a class="nav-link" href="/meeting/reservation/resShortMain/br_0003" id="br_0003" >GS����Ÿ��</a></li>
              <li class="nav-item"><a class="nav-link" href="/meeting/reservation/resShortMain/br_0004" id="br_0004" >�����ͼ���</a></li>
            </ul>
          </div>
        </div>
        <div class="col-md-9">
          <div class="tab-content">
          
          <!-- ȸ�ǽ� ���� -->
            <div class="tab-pane active" id="meeting-room" onclick="location.href ='resShortDetail'">
            <c:forEach items='${resShortMain}' var="resShortList">
              <div class="timeline-post">
                <div class="post-media"><a href="#"><img src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/48.jpg"></a>
                  <div class="content">
                    <h4><a href="#"><label id="mrName">${resShortList.mrName }</label></a></h4>
                    <p class="text-muted"><small>${resShortList.brLocation } ${resShortList.mrLocation }</small></p>
                  </div>
                </div>
                <div class="post-content">
                	<table>
                		<tr>	
                			<td><b>��������</b></td>
                			<c:if test="${resShortList.mrType eq 'mr_type_0'}">
    							<td>ȸ�ǽ�</td>
							</c:if>
							<c:if test="${resShortList.mrType eq 'mr_type_1'}">
    							<td>��ȸ�ǽ�</td>
							</c:if>
							<c:if test="${resShortList.mrType eq 'mr_type_2'}">
    							<td>������</td>
							</c:if>
						</tr>
						<tr>
							<td><b>����ð�</b></td>
							<td>�ּ� 30�к���</td>
						</tr> 
						<tr>
							<td><b>�����ο�</b></td>
							<td>${resShortList.mrLimit }��</td>
						</tr>
						<tr>
							<td><b>������</b></td> 
							<td>${resShortList.empName }</td>
						</tr>
                	</table>
                </div>
                <ul class="post-utility">
                  <li class="likes"><i class="fa fa-fw fa-lg fa-wifi"></i>wifi</li>
                  <li class="shares"><i class="fa fa-fw fa-lg fa-laptop"></i>laptop</li>
                  <li class="likes"><i class="fa fa-fw fa-lg fa-edit"></i>White Board</li>
                  <li class="shares"><i class="fa fa-fw fa-lg fa-video"></i>Beam project</li>
                  <!-- <li class="comments"><a data-toggle="modal" href="#myModal"><span onclick="writeLongtermReservation();">��� ���� ��û</span></a></li> -->
                </ul>
              </div>
              </c:forEach>
              </div>
 		
 				<!-- Modal -->
				  <div class="modal fade" id="myModal" role="dialog">
				    <div class="modal-dialog">
				    
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				        	<h4 class="modal-title">��� ���� ��û</h4>
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
        </div>
	</main>
</body>
</html>