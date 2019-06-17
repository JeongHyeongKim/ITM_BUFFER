<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">
        var buffer;
        $(function() {


            $('#finallyConfirm').click(function() {
                console.log(buffer);
                document.getElementById("hiddenMtId").value = buffer;
                $('#deletemeetingRoom').submit();
            });
            
            $('.brNameArea').mouseover(function(e){
            	var brId = "#" + e.currentTarget.id;
            	console.log(brId);
            	$(brId).css('color', 'blue');
            });
            
            $('.brNameArea').mouseout(function(e){
            	var brId = "#" + e.currentTarget.id;
            	$(brId).css('color', 'black');
            });
            
        });
        
        function readBranch(mrId){
        	location.replace('/meeting/meetingRoom/read/'+mrId);
        }
        function modelOpen(mrId) {
            buffer = mrId;
            console.log(buffer);
        }
    </script>
    <title>회의실조회</title>
</head>

<body class="app sidebar-mini rtl">
    <main class="app-content">
        <div class="app-title">
            <div>
                <h1>회의실 / 교육실 관리</h1>
                <p>회의실관리</p>
            </div>
        </div>

        <div style="text-align:right">
            <a class="btn btn-primary btn-sm" href="/meeting/branch/create">회의실 추가</a>
        </div>
        <div>
            <c:forEach items='${meetingRoomList}' var="meetingRoomList">
                <!--  modal start -->
                <div class="modal fade" id="confirm" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" style="text-align:center;">정말로 삭제하시겠습니까?</h4>
                                <button type="button" class="close" data-dismiss="modal">×</button>
                            </div>
                            <div class="modal-body">
                                <div class="modal-footer" style="margin-top:20px">
                                    <div class="row mb-10">
                                        <div class="col-md-12">

                                            <form action="/meeting/meetingRoom/delete" method="POST" id="deleteMeetingRoom">

                                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                                <input type="hidden" name="mrId" id="hiddenMrId">
                                                <button class="btn btn-success" id="finallyConfirm" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>확인</button>
                                                <button class="btn btn-success" type="button" data-dismiss="modal"><i class="fa fa-fw fa-lg fa-check-circle"></i>취소</button>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- modal end -->
<!--                 private String mrId;
	private String mrName;
	private String brId; // 소속 지사
	private int mrLimit;
	private int mrPrice;
	private int mrArea;
	private String mrNetwork; // 네트워크유무에 따라 아이콘 다르게 출력
	private String mrType;
	private String empId; 관리자 이름 불러오는 쿼리 작성
	private String mrLocation;
	private String mrImg; -->
                <div class="row" style="border-top:10px solid #E5E5E5; border-bottom:10px solid #E5E5E5; padding-top:15px;padding-bottom:15px; background:white;" >
                    <div class="col-md-4">

                        <div style="text-align:center">
                            <div> <img class="user-img" src="${meetingRoomList.mrImg}" width=235px height=235px style="border-radius: 10px; border:1px solid"></div>
                        </div>
                    </div>


                    <div class="col-md-8" style="border-left: 3px solid #ddd; padding-left:50px ">
                        <div style="text-align:right;">
                            <a class="btn btn-primary" href="#confirm" data-toggle="modal" style="text-align:right;" onclick="modelOpen('${meetingRoomList.brId}')"><i class="fa fa-lg fa-trash"></i></a>

                        </div>
                        <div>
                            <div class="tile-body">
                                <div class="form-horizontal">
<!-- 회의실 이름 -->
                                    <div class="form-group row" style="padding-top:15px; ">
                                        <h2 onclick="readBranch('${meetingRoomList.mrId}')" class="brNameArea" id="${meetingRoomList.mrId}">${meetingRoomList.mrName}</h2>
                                    </div>
                                    <div class="form-group row">
<!-- M마이크N노트북V빔프W화이트보드 -->
                                        <div class="col-md-8">	
                                        <c:set var="doneLoop" value="false"/>
                                            <img src="/meeting/resources/img/house.png" width="30px" height="30px">
                                             <c:forEach items='${branchLocationList}' var="branchLocationList">
                                              <c:if test="${not doneLoop}">
                                             	<c:if test="${branchLocationList.brId eq meetingRoomList.brId}">
                                             		${branchLocationList.brLocation}&nbsp&nbsp
                                             		<c:set var="doneLoop" value="true"/>
                                             	</c:if>
                                             	</c:if>
                                             </c:forEach>
                                            &nbsp&nbsp ${meetingRoomList.mrLocation} 
                                        </div>
                                    </div>
                                    <!-- 전화번호 -->
                                    <div class="form-group row">
                                        <div class="col-md-8">
                                        
                                            <img src="/meeting/resources/img/phone.png" width="30px" height="30px">
                                            <c:set var="doneLoop" value="false"/>
											<c:forEach items='${branchLocationList}' var="branchLocationList">
                                              <c:if test="${not doneLoop}">
                                             	<c:if test="${branchLocationList.brId eq meetingRoomList.brId}">
                                             		${branchLocationList.brTel}&nbsp&nbsp
                                             		<c:set var="doneLoop" value="true"/>
                                             	</c:if>
                                             	</c:if>
                                             </c:forEach>
                                        </div>
                                    </div>
                                    <!-- 기자재 -->
                                     <div class="form-group row">
                                        <div class="col-md-8">
                                            <img src="/meeting/resources/img/phone.png" width="30px" height="30px">

											<c:forEach items='${equipmentList}' var="equipmentList">

                                             	<c:if test="${equipmentList.mrId eq meetingRoomList.mrId}">
                                             		<c:choose>
													       <c:when test="${equipmentList.eqId == 'M'}">
													           	마이크
													       </c:when>
													       <c:when test="${equipmentList.eqId == 'N'}">
													           	노트북
													       </c:when>
													       <c:when test="${equipmentList.eqId == 'V'}">
													           	빔프로젝터
													       </c:when>
													       <c:when test="${equipmentList.eqId == 'W'}">
													           	화이트보드
													       </c:when>
													   </c:choose>
                                             	</c:if>
                                             </c:forEach>
                                        </div>
                                    </div>
                                    <!-- 수용인원 -->
                                     <div class="form-group row">
                                        <div class="col-md-8">
                                            <img src="/meeting/resources/img/phone.png" width="30px" height="30px">

                                            &nbsp&nbsp ${meetingRoomList.mrLimit}
                                        </div>
                                    </div>
                                    <!-- 관리자 -->
                                     <div class="form-group row">
                                        <div class="col-md-8">
                                            <img src="/meeting/resources/img/phone.png" width="30px" height="30px">
											 
											<c:forEach items='${admin}' var="admin">
                                            <c:if test="${admin.empId eq meetingRoomList.empId}">
                                            	${admin.empName} 
                                            </c:if>
                                            </c:forEach>
                                        </div>
                                    </div>


                                    <div class="form-group row">
                                        <div class="col-md-8" style="padding-top:10px">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>


        </div>



    </main>

</body>

</html>