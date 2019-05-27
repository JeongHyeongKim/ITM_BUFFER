<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		var branchList = JSON.parse('${branchList}')
		console.log(branchList);
		
		$.each(branchList, function(i, $List) {
			var $tr = $("<tr></tr>").appendTo($("#branchList"));
			var $link = $("<a>").attr("href", "/meeting/branch/read/" + $List.brId);
			var $deleteBtn = $("<button></button>").attr("class", "branchDelete").data("brId", $List.brId);
			
			$("<td></td>").text($List.brId).appendTo($tr);
			$("<td></td>").text($List.brName).wrapInner($link).appendTo($tr);
			$("<td></td>").text($List.brLocation).appendTo($tr);
			$("<td></td>").text($List.brTel).appendTo($tr);
			$("<td></td>").text($List.brImg).appendTo($tr);
			$("<td></td>").text("삭제").wrapInner($deleteBtn).appendTo($tr);
		})
		
		$(".branchDelete").on("click",function(){
			console.log($(".branchDelete").data("brId"));
		})
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
		
		<div>
			<button id="branchInsert">글쓰기</button>
		</div>
		<div>
			<table id="branchList">
				<tr>
					<td>지사번호</td>
					<td>지사이름</td>
					<td>지사위치</td>
					<td>전화번호</td>
					<td>지사사진</td>
				</tr>
			</table>
		</div>
	</main>

</body>
</html>