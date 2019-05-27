<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		var noticeList = JSON.parse('${list}')
		console.log(noticeList);
		
		$.each(noticeList, function(i, $list) {
			var $tr = $("<tr></tr>").appendTo($("#noticeTable"));
			var $link = $("<a>").attr("href", "/meeting/notice/read/" + $list.noticeId);
			
			$("<td></td>").text($list.noticeId).appendTo($tr);
			$("<td></td>").text($list.noticeTitle).wrapInner($link).appendTo($tr);
			$("<td></td>").text($list.noticeWriter).appendTo($tr);
			$("<td></td>").text($list.noticeDate).appendTo($tr);
			
		})
	
	})
</script>
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
        </div>
        <div class="clearfix"></div>
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