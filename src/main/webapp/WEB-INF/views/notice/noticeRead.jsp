<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#noticeDelete").on("click",function(){
			var $formData = new FormData();
            $formData.append("noticeId", 30);
            console.log($formData.get("noticeId"))
            $.ajax({
                url:"/meeting/notice/delete",
                data: $formData,
                method:"post",
                processData: false,
                contentType: false,
                success:function(data) {
                	console.log("success");
                }
		})
	})
	
})
</script>
<title>Insert title here</title>
</head>
<body class="app sidebar-mini rtl">
<main class="app-content">
	${notice}
	<br>
	<button id="noticeDelete">글삭제</button>
	<button id="noticeUpdate">글수정</button>
</main>
</body>
</html>