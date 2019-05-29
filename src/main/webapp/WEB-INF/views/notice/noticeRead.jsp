<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		var notice = JSON.parse('${notice}');
		console.log(notice);
		$("#noticeTitle").text(notice.noticeTitle);
		$("#noticeContent").text(notice.noticeContent);
		$("#noticeWriter").text(notice.noticeWriter);
		
		 var noticeURL = window.location.href;
         var splitId = noticeURL.split("/");
         var noticeId = splitId[splitId.length-1];
         
		$("#noticeDelete").on("click",function(){

            $.ajax({
                url:"/meeting/notice/delete/" + noticeId,
                data : "_csrf=${_csrf.token}",
                method:"post",
                success:function(data) {
                	location.href= "/meeting/notice/list/1"
                }, error:function(){
                	console.log("error")
                }
			})
		
		})
	
		$("#noticeUpdate").on("click", function(){
			location.href = "/meeting/notice/update/" + noticeId ;
			
		})
	})
</script>
<style type="text/css">
	#Writer{
		margin-left : 75%;
		
	}
</style>
<title>Insert title here</title>
</head>
<body class="app sidebar-mini rtl">
<main class="app-content">
	<div class="app-title">
		<h3>공지사항</h3>
	</div>
  <div class="row">
	<div class="col-md-12">
          <div class="tile">
            <h3 class="tile-title"></h3>
            <div class="tile-body">
              <form>
                <div class="form-group">
                  <label class="control-label" id="noticeTitle"></label>
                </div>
                <div class="form-group" id="Writer">
                  <label class="control-label" id="noticeWriter"></label>
                </div>
            
               <hr>
                <div class="form-group">
                  <label class="control-label" id="noticeContent"></label>
                </div>
               
              </form>
            </div>
            <div class="tile-footer">
              <button class="btn btn-primary" type="button" id="noticeUpdate"><i class="fa fa-fw fa-lg fa-check-circle"></i>글수정</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#"><i class="fa fa-fw fa-lg fa-times-circle"></i>글삭제</a>
            </div>
          </div>
        </div>
        </div>
	
</main>
</body>
</html>