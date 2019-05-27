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
		
		$.each(noticeList, function(i, $list) {
			var $tr = $("<tr></tr>").appendTo($("#branchList"));
			var $link = $("<a>").attr("href", "/meeting/branch/read/" + $list.noticeId);
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
	<title>������ȸ</title>
</head>
<body class="app sidebar-mini rtl">
	<main class="app-content">
		<div class="app-title">
			<h3>��������</h3>
		</div>
		<div>
			<button id="branchInsert">�۾���</button>
		</div>
		<div>
			<table id="branchList">
				<tr>
					<td>�����ȣ</td>
					<td>�����̸�</td>
					<td>������ġ</td>
					<td>��ȭ��ȣ</td>
					<td>�������</td>
				</tr>
			</table>
		</div>
	</main>

</body>
</html>