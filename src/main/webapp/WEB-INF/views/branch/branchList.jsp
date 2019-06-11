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
                document.getElementById("hiddenBrId").value = buffer;
                $('#deleteBranch').submit();
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
        
        function readBranch(brId){
        	location.replace('/meeting/branch/read/'+brId);
        }
        function modelOpen(brId) {
            buffer = brId;
            console.log(buffer);
        }
    </script>
    <title>지사조회</title>
</head>

<body class="app sidebar-mini rtl">
    <main class="app-content">
        <div class="app-title">
            <div>
                <h1>회의실 / 교육실 관리</h1>
                <p>지사관리</p>
            </div>
        </div>

        <div style="text-align:right">
            <a class="btn btn-primary btn-sm" href="/meeting/branch/create">회의실 추가</a>
        </div>
        <div>
            <c:forEach items='${branchList}' var="branchList">
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

                                            <form action="/meeting/branch/delete" method="POST" id="deleteBranch">

                                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                                <input type="hidden" name="brId" id="hiddenBrId">
                                                <button class="btn btn-success" id="finallyConfirm" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>확인</button>
                                                <button class="btn btn-success" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>취소</button>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- modal end -->
                <div class="row" style="border-top:10px solid #E5E5E5; border-bottom:10px solid #E5E5E5; padding-top:15px;padding-bottom:15px; background:white;" >
                    <div class="col-md-4">

                        <div style="text-align:center">
                            <%-- <img class="user-img" src="${branchList.brImg}" height=235px style="border-radius: 10px;"> --%>
                            <div> <img class="user-img" src="${branchList.brImg}" width=235px height=235px style="border-radius: 10px; border:1px solid"></div>
                        </div>
                    </div>


                    <div class="col-md-8" style="border-left: 3px solid #ddd; padding-left:50px ">
                        <div style="text-align:right;">
                            <a class="btn btn-primary" href="#confirm" data-toggle="modal" style="text-align:right;" onclick="modelOpen('${branchList.brId}')"><i class="fa fa-lg fa-trash"></i></a>

                        </div>
                        <div>
                            <div class="tile-body">
                                <div class="form-horizontal">
                                    <div class="form-group row" style="padding-top:15px; ">
                                        <h2 onclick="readBranch('${branchList.brId}')" class="brNameArea" id="${branchList.brId}">${branchList.brName}</h2>
                                    </div>
                                    <div class="form-group row">

                                        <div class="col-md-8">
                                            <img src="/meeting/resources/img/house.png" width="30px" height="30px">
                                            &nbsp&nbsp ${branchList.brLocation}
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-md-8">
                                            <img src="/meeting/resources/img/phone.png" width="30px" height="30px">

                                            &nbsp&nbsp ${branchList.brTel}
                                        </div>
                                    </div>


                                    <div class="form-group row">
                                        <div class="col-md-8" style="padding-top:10px">
                                            <div class="meetingRoomList">
                                                <img src="/meeting/resources/img/meetingroom.png" width="30px" height="30px">
                                                <c:forEach items='${meetingRoomListOrderByBranch}' var="meetingRoomList" varStatus="status">
                                                    <c:if test="${meetingRoomList.BRID eq branchList.brId}">
                                                        ${meetingRoomList.MRNAME} &nbsp / &nbsp
                                                    </c:if>
                                                </c:forEach>

                                            </div>
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