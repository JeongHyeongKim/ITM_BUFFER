<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    var buffer;
    $(function () {
        $('#finallyConfirm').click(function () {
            console.log(buffer);
            document.getElementById("hiddenBrId").value = buffer;
            $('#deleteBranch').submit();
        });
        $('.brNameArea').mouseover(function (e) {
            var brId = "#" + e.currentTarget.id;
            console.log(brId);
            $(brId).css('color', 'blue');
        });
        $('.brNameArea').mouseout(function (e) {
            var brId = "#" + e.currentTarget.id;
            $(brId).css('color', 'black');
        });
    });
    function readBranch(brId) {
        location.replace('/meeting/branch/read/' + brId);
    }
    $(document).on('click', '.deleteAlert', function(e){
    		 swal({
    	      		title: "삭제하시겠습니까?",
    	      		text: "삭제 시,해당 지사 정보 복원 불가",
    	      		type: "warning",
    	      		showCancelButton: true,
    	      		confirmButtonText: "네, 삭제하겠습니다",
    	      		cancelButtonText: "아뇨, 취소하겠습니다",
    	      		closeOnConfirm: false,
    	      		closeOnCancel: false
    	      	}, function(isConfirm) {
    	      		if (isConfirm) {
    	      			
    	      			swal("삭제 완료!", "해당 정보가 삭제되었습니다.", "success");
    	      		} else {
    	      			swal("삭제 취소!", "해당 정보가 삭제 되지 않았습니다.", "error");
    	      		}
    	      	});
    });
    
</script>
<main class="app-content">
    <div class="app-title">
        <div>
            <h1>
                <i class="fa fa-calendar"></i>지사관리</h1>
            <p>
                전체 지사 목록입니다.
            </p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item">
                <i class="fa fa-home fa-lg"></i>
            </li>
            <li class="breadcrumb-item">
                <a href="#">회의실관리</a>
            </li>
            <li class="breadcrumb-item">
                <a href="#">지사관리</a>
            </li>
        </ul>
    </div>
    <div style="text-align:right;">
        <a class="btn-primary btn-sm" href="/meeting/branch/create">회의실 추가</a>
    </div>
    <div class="row">
        <c:forEach items='${branchList}' var="branchList">
        	<div class="col-lg-4" id="${branchList.brId}"  style="padding-top:20px">
	            <div class="bs-component">
	              <div class="card" width="100%">
	                <h4 class="card-header">
	                	<span onclick="readBranch('${branchList.brId}')">${branchList.brName }</span>
	                	<span style="float:right">
			                <a class="deleteAlert" id="demoSwal" style="cursor:pointer">
		                       X
		                    </a>
	                    </span>
	                </h4>
	                <div class="card-body">
	                  <h5 class="card-title">${branchList.brLocation }</h5>
	                  <h6 class="card-subtitle text-muted">${branchList.brTel }</h6>
	                </div><img style="height: 200px; width: 100%; display: block;" src="${branchList.brImg}" alt="Card image">
	                <div class="card-body">
	                  <p class="card-text">
	                  <b>[회의실]</b><br>
							<c:forEach items='${meetingRoomListOrderByBranch}' var="meetingRoomList" varStatus="status">
                                <c:if test="${meetingRoomList.BRID eq branchList.brId}">
                                      ${meetingRoomList.MRNAME} <br>
                                </c:if>
                            </c:forEach>	                  
	                  </p>
	                </div>
	                <div class="card-footer text-muted"></div>
	              </div>
	            </div>
	          </div>
        </c:forEach>
     </div>
</main>
<script type="text/javascript" src="/meeting/resources/js/plugins/bootstrap-notify.min.js"></script>
<script type="text/javascript" src="/meeting/resources/js/plugins/sweetalert.min.js"></script>