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
		var resShortList = '${resShortMain}';
		//console.log("확인: "+resList[0]);
	}) 
</script>
</head>
<body>
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
              <li class="nav-item"><a class="nav-link active" data-toggle="tab">지사 선택</a></li>
              <li class="nav-item"><a class="nav-link" href="#user-timeline" data-toggle="tab">본사</a></li>
              <li class="nav-item"><a class="nav-link" href="#user-timeline" data-toggle="tab">삼환 빌딩</a></li>
              <li class="nav-item"><a class="nav-link" href="#user-timeline" data-toggle="tab">GS 강서빌딩</a></li>
              <li class="nav-item"><a class="nav-link" href="#user-settings" data-toggle="tab">GS 강북빌딩</a></li>
            </ul>
          </div>
        </div>
        <div class="col-md-9">
          <div class="tab-content">
            <div class="tab-pane active" id="user-timeline">
            <c:forEach items="${resShortMain }" var="resShortList">
              <div class="timeline-post">
                <div class="post-media"><a href="#"><img src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/48.jpg"></a>
                  <div class="content">
                    <h5><a href="#">${resShortList.mrName }</a></h5>
                    <p class="text-muted"><small>${resShortList.brLocation } ${resShortList.mrLocation }</small></p>
                  </div>
                </div>
                <div class="post-content">
                	<table>
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
                	</table>
                </div>
                <ul class="post-utility">
                  <li class="likes"><i class="fa fa-fw fa-lg fa-wifi"></i>wifi</li>
                  <li class="shares"><i class="fa fa-fw fa-lg fa-laptop"></i>laptop</li>
                  <li class="likes"><i class="fa fa-fw fa-lg fa-chalkboard"></i>White Board</li>
                  <li class="shares"><i class="fa fa-fw fa-lg fa-laptop"></i>Beam project</li>
                  <li class="comments"><a class="nav-link" href="#user-settings" data-toggle="tab">장기 예약 신청</a></li>  
                </ul>
              </div>
              </c:forEach>
               </div>
              <div class="tab-pane fade" id="user-settings">
              <div class="tile user-settings">
                <h4 class="line-head">장기 예약 신청</h4>
                <form>
                  <div class="row mb-4">
                    <div class="col-md-4">
                      <label>신청자 명</label>
                      <input class="form-control" type="text">
                    </div>
                    <div class="col-md-4">
                      <button class="btn btn-primary" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i> 최근 이력 불러오기 </button>
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
                      <input class="form-control" type="text">
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-md-4">
                      <label>예약 종료 일정</label>
                      <input class="form-control" type="text">
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
                      <label>참석 명단</label>
                      <input class="form-control" type="text">
                    </div>
                     <div class="clearfix"></div>
                    <div class="col-md-4">
                      <label>간식</label>
                      <input type=checkbox name=snack value="간식 있음"><br> 
                    </div>
                  </div>
                   <div class="clearfix"></div>
                  <div class="row mb-10">
                    <div class="col-md-12">
                      <button class="btn btn-primary" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i> Save</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        </div>
	</main>
</body>
</html>