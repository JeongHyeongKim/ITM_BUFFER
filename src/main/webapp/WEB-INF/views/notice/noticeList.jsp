<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

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

