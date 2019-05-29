<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		var result = JSON.parse('${result}');
		
		var noticeList = result.list;
		var pagination = result.pagination;
		console.log(pagination)
		// 공지사항 LIST
		$.each(noticeList, function(i, $list) {
			var $tr = $("<tr></tr>").appendTo($("#noticeTable"));
			var $link = $("<a>").attr("href", "/meeting/notice/read/" + $list.noticeId);
			
			$("<td></td>").text($list.noticeId).appendTo($tr);
			$("<td></td>").text($list.noticeTitle).wrapInner($link).appendTo($tr);
			$("<td></td>").text($list.noticeWriter).appendTo($tr);
			$("<td></td>").text($list.noticeDate).appendTo($tr);
		})
		
		// pagination
		var $pagination = $(".pagination");
		
		var $prevItem = $("<a></a>").attr("href","/meeting/notice/list/"+pagination.prev).attr("class","page-link").text("prev");
		$("<li></li>").attr("class","page-item").wrapInner($prevItem).appendTo($pagination);
		
		for(var i=pagination.startPageNo; i<=pagination.endPageNo; i++){
			var $pageItem = $("<a></a>").attr("href","/meeting/notice/list/"+i).attr("class","page-link").text(i);
			if(pagination.pageNo == i){
				$("<li></li>").attr("class","page-item active").wrapInner($pageItem).appendTo($pagination);
			} else{
				$("<li></li>").attr("class","page-item").wrapInner($pageItem).appendTo($pagination);	
			}
		}
		
		var $nextItem = $("<a></a>").attr("href","/meeting/notice/list/"+pagination.next).attr("class","page-link").text("next");
		$("<li></li>").attr("class","page-item").wrapInner($nextItem).appendTo($pagination);
	})
</script>
<style type="text/css">
	#paging{margin-left : 70%;}
</style>
<title>Insert title here</title>
</head>
<body class="app sidebar-mini rtl">
<main class="app-content">
	<div class="app-title">
		<h3>공지사항</h3>
	</div>
	
	<div class="col-md-12">
          <div class="tile">
            <table class="table table-striped-3" id="noticeTable">
              <thead>
                <tr>
                  <th>글번호</th>
                  <th>제목</th>
                  <th>내용</th>
                  <th>작성일</th>
                </tr>
              </thead>
            </table>
          </div>
		<div id="paging">
		<nav aria-label="Page navigation example">
			<ul class="pagination">
				
			</ul>
		</nav>
		</div>
	
	</div>
        
</main>
<!-- Essential javascripts for application to work-->
    <script src="/meeting/resources/js/jquery-3.2.1.min.js"></script>
    <script src="/meeting/resources/js/popper.min.js"></script>
    <script src="/meeting/resources/js/bootstrap.min.js"></script>
    <script src="/meeting/resources/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="/meeting/resources/js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <!-- Google analytics script-->
    <script type="text/javascript">
      if(document.location.hostname == 'pratikborsadiya.in') {
      	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
      	ga('create', 'UA-72504830-1', 'auto');
      	ga('send', 'pageview');
      }
    </script>
</body>
</html>