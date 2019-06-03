<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
              <c:forEach items="${branchList}" var="branchList">
              	<li class="nav-item"><a class="nav-link" href="/meeting/reservation/resShortMain/${branchList.brId}" id="${branchList.brId}" >${branchList.brName}</a></li>
              </c:forEach>
            </ul>
          </div>
        </div>
        <div class="col-md-9">
          <div class="tab-content">
          
          <!-- ȸ�ǽ� ���� -->
            
            <c:forEach items='${resShortMain}' var="resShortList">
             <div class="tab-pane active" id="meeting-room" onclick="location.href ='/meeting/reservation/resShortDetail/${resShortList.brId}'">
              <div class="card">
                <h4 class="card-header">${resShortList.mrName }</h4>
                <div class="card-body">
                  <h5 class="card-title">${resShortList.brLocation } ${resShortList.mrLocation }</h5>
                  <h6 class="card-subtitle text-muted"><b>������</b> ${resShortList.empName}</h6>
                </div><img style="height: 200px; width: 100%; display: block;" src="${resShortList.mrImg }" alt="Card image">
                <div class="card-body">
                  <p class="card-text"><table>
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
                	</table></p>
	                  <i class="fa fa-fw fa-lg fa-wifi"></i>wifi
	                  <i class="fa fa-fw fa-lg fa-laptop"></i>laptop
	                  <i class="fa fa-fw fa-lg fa-edit"></i>White Board
	                  <i class="fa fa-fw fa-lg fa-video-camera"></i>Beam project
                </div>
                <div class="card-footer text-muted"></div>
              </div>
              </div>
               </c:forEach>
 		
 				<!-- Modal -->
				  <div class="modal fade" id="myModal" role="dialog">
				    <div class="modal-dialog ">
				    
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