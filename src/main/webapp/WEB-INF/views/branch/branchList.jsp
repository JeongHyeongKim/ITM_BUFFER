<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		var branchList = JSON.parse('${branchList}')
		console.log(branchList);
		

	})
</script>
	<title>지사조회</title>
</head>
<body class="app sidebar-mini rtl">
	<main class="app-content">
		<div class="app-title">
			<div>
			<h1>회의실 /교육실 관리</h1>
			<p >지사관리</p>
			</div>
		</div>
		
		<div style="text-align:right">
			<a class="btn btn-primary btn-sm" href="/meeting/branch/create">+</a>&nbsp;&nbsp;<a class="btn btn-primary btn-sm" href="/meeting/branch/delete">-</a>
		</div>
		<div>
		<c:forEach items='${branchList}' var="branchList">
			<div class="row">
                <div class="col-md-4" style="text-align:center">
                    <img class="user-img" src=${branchList.brImg}  height=235px >
                </div>
                <div class="col-md-8">
                
                <div class="tile">
                    <div class="tile-body">
                        <div class="form-horizontal">
                            <div class="form-group row">
                                <label class="control-label">지사 이름 :</label>
                                <div class="col-md-8">
                                    ${branchList.brName} 
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label">지사 주소 : </label>
                                <div class="col-md-8">
                                    ${branchList.brLocation} 
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label">대표 번호 : </label>
                                <div class="col-md-8">
                                    ${branchList.brTel}
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label">대표 번호 : </label>
                                <div class="col-md-8">
                                    <c:forEach items='${meetingRoomList}' var="meetingRoomList">
                                    	${meetingRoomList.mrName}  &nbsp; <p>/</p> &nbsp;
                                    </c:forEach>
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