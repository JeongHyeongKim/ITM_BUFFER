<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(function() {

            


        });
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
            <a class="btn btn-primary btn-sm" href="/meeting/branch/create">+</a>&nbsp;&nbsp;<a class="btn btn-primary btn-sm" href="/meeting/branch/delete">-</a>
        </div>
        <div>
            <c:forEach items='${branchList}' var="branchList">
                <div class="row" style="border-top:1px solid; border-bottom:1px solid; padding-top:15px;padding-bottom:15px">
                    <div class="col-md-4">

                        <div style="text-align:center">	
                            <%-- <img class="user-img" src="${branchList.brImg}" height=235px style="border-radius: 10px;"> --%>
                            <div> <img class="user-img" src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/128.jpg" height=235px style="border-radius: 10px;"></div>
                        </div>
                    </div> 


                    <div class="col-md-8" style="border-left: 1px solid; padding-left:50px">
                        <div>
                            <div class="tile-body">
                                <div class="form-horizontal">
                                    <div class="form-group row" style="padding-top:25px; ">
                                        <label class="control-label">지사 &nbsp이름</label>
                                        <div class="col-md-8">
                                            ${branchList.brName}
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="control-label">지사 &nbsp주소</label>
                                        <div class="col-md-8">
                                            ${branchList.brLocation}
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="control-label">대표 &nbsp번호</label>
                                        <div class="col-md-8">
                                            ${branchList.brTel}
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="control-label" style="padding-top:10px">회의실목록</label>
                                        <div class="col-md-8" style="padding-top:10px">
                                            <div class="meetingRoomList">
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