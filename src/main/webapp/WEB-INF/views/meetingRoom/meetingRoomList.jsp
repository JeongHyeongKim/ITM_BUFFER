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
                document.getElementById("hiddenMrId").value = buffer;
                $('#deleteMeetingRoom').submit();
            });

            $('.mrNameArea').mouseover(function(e) {
                var brId = "#" + e.currentTarget.id;
                console.log(brId);
                $(brId).css('color', 'blue');
            });

            $('.mrNameArea').mouseout(function(e) {
                var brId = "#" + e.currentTarget.id;
                $(brId).css('color', 'black');
            });

        });

        function readMeetingRoom(mrId) {
            location.replace('/meeting/meetingRoom/read/' + mrId);
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
            <a class="btn btn-primary btn-sm" href="/meeting/meetingRoom/create">회의실 추가</a>
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
                                <!-- 아이콘과 함께 실행 후 에는 되둘릴 수 없습니다 메시지. + 트렌젝션 제어 -->
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

                <div class="row" style="border-top:10px solid #E5E5E5; border-bottom:10px solid #E5E5E5; padding-top:15px;padding-bottom:15px; background:white;">
                    <div class="col-md-4">

                        <div style="text-align:center; width: 100%; height: 100%;">
                            <img class="user-img" src="${meetingRoomList.mrImg}"  style="border-radius: 10px; width: 100%;border:1px solid; vertical-align:middle">
                        </div>
                    </div>


                    <div class="col-md-8" style="border-left: 3px solid #ddd; padding-left:50px ">
                        <div style="text-align:right;">
                            <a class="btn btn-primary" href="#confirm" data-toggle="modal" style="text-align:right;" onclick="modelOpen('${meetingRoomList.mrId}')"><i class="fa fa-lg fa-trash"></i></a>

                        </div>
                        <div>
                            <div class="tile-body">
                                <div class="form-horizontal">
                                    <!-- 회의실 이름 -->
                                    <div class="form-group row" style="padding-top:15px; ">
                                        <h2 onclick="readMeetingRoom('${meetingRoomList.mrId}')" class="mrNameArea" id="${meetingRoomList.mrId}">${meetingRoomList.mrName}</h2>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-md-8">
                                            <c:set var="doneLoop" value="false" />
                                            <img src="/meeting/resources/img/house.png" width="30px" height="30px">
                                            <c:forEach items='${branchLocationList}' var="branchLocationList">
                                                <c:if test="${not doneLoop}">
                                                    <c:if test="${branchLocationList.brId eq meetingRoomList.brId}">
                                                        ${branchLocationList.brLocation}&nbsp&nbsp
                                                        <c:set var="doneLoop" value="true" />
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
                                            <c:set var="doneLoop" value="false" />
                                            <c:forEach items='${branchLocationList}' var="branchLocationList">
                                                <c:if test="${not doneLoop}">
                                                    <c:if test="${branchLocationList.brId eq meetingRoomList.brId}">
                                                        ${branchLocationList.brTel}&nbsp&nbsp
                                                        <c:set var="doneLoop" value="true" />
                                                    </c:if>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <!-- 기자재 -->
                                    
                                    <!-- 수용인원 -->
                                    <div class="form-group row">
                                        <div class="col-md-8">
                                            <img src="/meeting/resources/img/phone.png" width="30px" height="30px">
											<!-- 수용인원을 나타낼 아이콘이 없다. -->
                                            &nbsp&nbsp&nbsp ${meetingRoomList.mrLimit} 명	
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
                                    
                                     
                                        <div class="col-md-8" style="text-align:right">
                                        
                                            <c:forEach items='${equipmentList}' var="equipmentList">
												<!-- 사용가능한 기자재 리스트라고 뭔가 명시가 되어있으면 좋을 것 같다. -->
                                                <c:if test="${equipmentList.mrId eq meetingRoomList.mrId}">
                                                    <c:choose>
                                                        <c:when test="${equipmentList.eqId == 'M'}">
                                                            <img src="/meeting/resources/img/mike.png" width="50px" height="50px">
                                                        </c:when>
                                                        <c:when test="${equipmentList.eqId == 'N'}">
                                                            <img src="/meeting/resources/img/laptop.png" width="50px" height="50px">
                                                        </c:when>
                                                        <c:when test="${equipmentList.eqId == 'V'}">
                                                            <img src="/meeting/resources/img/beamProject.png" width="50px" height="50px">
                                                        </c:when>
                                                        <c:when test="${equipmentList.eqId == 'W'}">
                                                            <img src="/meeting/resources/img/whiteBoard.png" width="50px" height="50px">
                                                        </c:when>
                                                    </c:choose>
                                                </c:if>
                                            </c:forEach>
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