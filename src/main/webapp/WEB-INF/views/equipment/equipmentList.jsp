<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<main class="app-content">
    <div class="app-title">
        <div>
            <h1>
                <i class="fa fa-calendar"></i>기자재관리</h1>
            <p>
               	 기자재 목록
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
        <a class="btn btn-primary btn-sm" data-toggle="modal" href="#createModal">기자재 추가</a>
    </div>

    <!--  modal start -->
    <div class="modal fade" id="createModal" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" style="text-align:center;">기자재 상세를 입력해주세요.</h4>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>
                <div class="modal-body">
                    <form action="/meeting/equipment/insert" method="POST" id="equipmentBranch">
                        <div class="col-lg-4" style="float:left">
                            <label for="exampleSelect1">지사</label>
                            <select class="form-control" id="branchSelect">
                                <option value="none" hidden>지사 선택</option>
                                <c:forEach items='${branchList}' var="branchList">
                                    <option value="${branchList.brId}">${branchList.brName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-lg-4" style="display:inline-block">
                            <label>회의실</label>
                            <select class="form-control" id="meetingRoomSelect">
                                <option value="none" hidden>지사를 먼저 선택해주세요.</option>

                            </select>
                        </div>
                        <div class="col-lg-4" style="float:right">
                            <label>기자재 유형</label>
                            <select class="form-control">
                                <option value="N">노트북</option>
                                <option value="WB">화이트 보드</option>
                                <option value="M">마이크</option>
                                <option value="V">빔 프로젝터</option>
                            </select>
                        </div>
                        <div class="modal-footer" style="margin-top:20px">
                            <div class="row mb-10">
                                <div class="col-md-12">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <button class="btn btn-success" id="finallyConfirm" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>확인</button>
                                    <button class="btn btn-success" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>취소</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>
    </div>
    <!-- modal end -->
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <table class="table table-hover table-bordered" id="sampleTable">
                        <thead>
                            <tr>
                                <th>기자재 유형</th>
                                <th>고유 번호</th>
                                <th>기자재 관리 회의실</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items='${equipmentList}' var='equipmentList'>
                                <tr>
                                    <c:if test="${fn:contains(equipmentList.eqId,'N')}">
                                        <td>N</td>
                                    </c:if>
                                    <c:if test="${fn:contains(equipmentList.eqId,'M')}">
                                        <td>M</td>
                                    </c:if>
                                    <c:if test="${fn:contains(equipmentList.eqId,'WB')}">
                                        <td>WB</td>
                                    </c:if>
                                    <c:if test="${fn:contains(equipmentList.eqId,'V')}">
                                        <td>V</td>
                                    </c:if>
                                    <td>${fn:split(equipmentList.eqId,'_')[1]}</td>
                                    <td>${equipmentList.brName} - ${equipmentList.mrName}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>
<script src="/meeting/resources/js/datatables/jquery.dataTables.js"></script>
<script src="/meeting/resources/js/datatables/dataTables.bootstrap4.js"></script>
<script src="/meeting/resources/js/plugins/sb-admin-datatables.min.js"></script>
<script type="text/javascript">
    $('#sampleTable').DataTable();
    
    
    $("#branchSelect").change(function(){
    	if($("#branchSelect option:selected").val()!="none"){
    		var buf = $("#branchSelect option:selected").val();
    		//console.log(buf);
    		$.ajax({
				url:"/meeting/equipment/roomListInBranch/"+buf,
				type:"get",
				success:function(resTxt){
					var meetingRoomList = resTxt.result;
					console.log(meetingRoomList)
					$("#meetingRoomSelect").empty();
					$("#meetingRoomSelect").append("<option value='none' hidden>회의실을 선택해주세요</option>")
		               $.each(meetingRoomList, function(index, item) {
		            	   $("#meetingRoomSelect").append("<option value='"+item.mrId+"'>"+item.mrName+"</option>")
		               });
				},
				error:function(){
					alert("실패");
				}
			});
    		
    	}
    });
    
    
</script>