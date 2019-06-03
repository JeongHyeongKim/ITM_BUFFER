<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		var notice = JSON.parse('${list}');
		
		$("#noticeTitle").val(notice.noticeTitle);
		$("#noticeContent").text(notice.noticeContent);
		$("#noticeId").val(notice.noticeId);
		
		$("#cancel").on("click", function(){

			 var noticeURL = window.location.href;
	         var splitId = noticeURL.split("/");
	         var noticeId = splitId[splitId.length-1];
	         
	         location.href = "/meeting/notice/read/"+ noticeId
		})
		
	})
</script>
<title>Insert title here</title>
</head>
<body class="app sidebar-mini rtl">
	<main class="app-content">
	<div class="row">
		<div class="col-md-12">
			<div class="tile">
				<h3 class="tile-title">공지사항</h3>
				<div class="tile-body">
					<form action="/meeting/notice/update" method="post">
						<div class="form-group">
							<label class="control-label">제목</label> 
							<input
								class="form-control" type="text"
								placeholder="Enter Notice Title" name="noticeTitle" id="noticeTitle">
						</div>

						<div class="form-group">
							<label class="control-label">내용</label>
							<textarea class="form-control" rows="4"
								placeholder="Enter Notice Content" name="noticeContent" id="noticeContent"></textarea>
						</div>
						<input type="hidden" name="noticeId" id="noticeId">
						<input type="hidden" name="_csrf" value="${_csrf.token }">
						<div class="tile-footer">
						<button class="btn btn-primary" type="subimt" id="update">
							<i class="fa fa-fw fa-lg fa-check-circle"></i>수정
						</button>
						&nbsp;&nbsp;&nbsp;
						<button class="btn btn-secondary" type="button" id="cancel">
							<i class="fa fa-fw fa-lg fa-check-circle"></i>취소
						</button>
				</div>
					</form>
				</div>
				
			</div>
		</div>
	</div>
	</main>
</body>
</html>