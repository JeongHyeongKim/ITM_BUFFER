<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<main class="app-content">
	<div class="app-title">
        <div>
          <h1><i class="fa fa-building"></i>회의실 예약</h1>
          <p>지사를 선택한 뒤, 회의실을 확인하세요</p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="resShortMain.jsp">회의실 예약</a></li>
        </ul>
      </div>
      <div class="row user">
      <div class="col-md-3">
          <div class="tile p-0">
            <ul class="nav flex-column nav-tabs user-tabs">
              <li class="nav-item"><a class="nav-link" >지사 선택</a></li>
              <c:forEach items="${branchList}" var="branchList">
              	<li class="nav-item"><a class="nav-link" href="/meeting/reservation/resShortMain/${branchList.brId}" id="${branchList.brId}" >${branchList.brName}</a></li>
              </c:forEach>
            </ul>
          </div>
        </div>
        <div class="col-md-9">
          <div class="tab-content">
          
          <!-- 회의실 정보 -->
            
            <c:forEach items='${resShortMain}' var="resShortList">
             <div class="tab-pane active" id="meeting-room" onclick="location.href ='/meeting/reservation/resShortDetail/${resShortList.brId}'">
              <div class="card">
                <h4 class="card-header">${resShortList.mrName }</h4>
                <div class="card-body">
                  <h5 class="card-title">${resShortList.brLocation } ${resShortList.mrLocation }</h5>
                  <h6 class="card-subtitle text-muted"><b>관리자</b> ${resShortList.empName}</h6>
                </div><img style="height: 200px; width: 100%; display: block;" src="${resShortList.mrImg }" alt="Card image">
                <div class="card-body">
                  <p class="card-text"><table>
                		<tr>	
                			<td><b>공간유형</b></td>
                			<c:if test="${resShortList.mrType eq 'mr_type_0'}">
    							<td>회의실</td>
							</c:if>
							<c:if test="${resShortList.mrType eq 'mr_type_1'}">
    							<td>대회의실</td>
							</c:if>
							<c:if test="${resShortList.mrType eq 'mr_type_2'}">
    							<td>교육실</td>
							</c:if>
						</tr>
						<tr>
							<td><b>예약시간</b></td>
							<td>최소 30분부터</td>
						</tr> 
						<tr>
							<td><b>수용인원</b></td>
							<td>${resShortList.mrLimit }인</td>
						</tr>
						<tr>
							<td><b>관리자</b></td> 
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
				        	<h4 class="modal-title">장기 예약 신청</h4>
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
			                      <button class="btn btn-primary" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>최근 이력 불러오기</button>
			                    </div>
			                  </div>
			                  <div class="row">
			                    <div class="col-md-4">
			                      <label>회의실 명</label>
			                      <input class="form-control" type="text">
			                    </div>
			                    <div class="clearfix"></div>
			                    <div class="col-md-4">
			                      <label>예약 시작 일정</label>
			                      <input class="form-control" type="date">
			                    </div>
			                    <div class="clearfix"></div>
			                    <div class="col-md-4">
			                      <label>예약 종료 일정</label>
			                      <input class="form-control" type="date">
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
			                      <label>기자재</label>
			                      <input class="form-control" type="text">
			                    </div>
			                    <div class="clearfix"></div>
			                    <div class="col-md-4">
			                      <label>참석 명단<button class="btn btn-outline" type="button" data-toggle="modal" data-target="#meetingPeople">+</button></label>
			                      <input class="form-control" type="text">
			                    </div>
			                     <div class="clearfix"></div>
			                    <div class="col-md-4">
			                      <label>간식</label><br>
			                      <input type=checkbox name=snack value="있음">간식있음<br> 
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
				        	<h4 class="modal-title">참석자 선택</h4>
				        	<button type="button" class="close" data-dismiss="modal">×</button>
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
				                     <button class="btn btn-primary" data-dismiss="modal" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>선택</button>
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