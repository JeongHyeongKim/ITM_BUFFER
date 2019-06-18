<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
              <button class="btn btn-primary" type="button" id="noticeUpdate"><i class="fa fa-fw fa-lg fa-check-circle"></i>글수정</button>&nbsp;&nbsp;&nbsp;
              <button class="btn btn-secondary" type="button" id="noticeDelete"><i class="fa fa-fw fa-lg fa-check-circle"></i>글삭제</button>
            </div>
          </div>
        </div>
        </div>
	
</main>
