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
			var $tr = $("<tr></tr>").appendTo($("#noticeList"));
			var $link = $("<a>").attr("href", "/meeting/notice/read/" + $list.noticeId);
			var $deleteBtn = $("<button></button>").attr("class", "noticeDelete").data("noticeId", $list.noticeId);
			
			$("<td></td>").text($list.noticeId).appendTo($tr);
			$("<td></td>").text($list.noticeTitle).wrapInner($link).appendTo($tr);
			$("<td></td>").text($list.noticeWriter).appendTo($tr);
			$("<td></td>").text($list.noticeDate).appendTo($tr);
			$("<td></td>").text(" - ").wrapInner($deleteBtn).appendTo($tr);
		})
		
		$(".noticeDelete").on("click",function(){
			console.log($(".noticeDelete").data("noticeId"));
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
	<div>
		<button id="noticeInsert">글쓰기</button>
	</div>
	<div>
		<table id="noticeList">
			<tr>
				<td>글번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
			</tr>
		</table>
	</div>
</main>
</body>
</html>