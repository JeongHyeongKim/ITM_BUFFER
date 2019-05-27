<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<script type="text/javascript">
	 $(function(){
		var resList = '${list}';
		//console.log("확인: "+resList[0]);
	}) 
</script>
<title>Insert title here</title>
</head>
<body>
<main class="app-content">
	 <div class="app-title">
        <div>
          <h1><i class="fa fa-calendar"></i>회의실 예약 현황</h1>
          <p>지사를 선택한 뒤, 달력을 통해 예약 현황을 확인하세요 </p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
        </ul>
      </div>
      
       <div class="row">
        <div class="col-md-12">
          <div class="tile row">
            <div class="col-md-3">
              <div>
                <h4 class="mb-4">지사 선택</h4>
                <div class="fc-event">본사</div>
                <div class="fc-event">삼환 빌딩</div>
                <div class="fc-event">GS 강서빌딩</div>
                <div class="fc-event">GS 강북빌딩</div>
              </div>
            </div>
            <div class="col-md-9">
              <div id="calendar"></div>
            </div>
          </div>
        </div>
      </div>
      
	<div>
		<%-- <table id="resList">
			<tbody>
				<c:forEach items="${list }" var="resList">
					<tr>
						<td><c:out value="${resList.empName}" /></td> 
						<td><c:out value="${resList.resDate}" /></td>
					</tr>
				</c:forEach>
			</tbody> 
		</table> --%>
	</div> 
</main>
</body>
</html>