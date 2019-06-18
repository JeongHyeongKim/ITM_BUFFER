<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
    var buffer;
    $(function () {
        $('#finallyConfirm').click(function () {
            console.log(buffer);
            document.getElementById("hiddenMrId").value = buffer;
            $('#deleteMeetingRoom').submit();
        });
        $('.mrNameArea').mouseover(function (e) {
            var brId = "#" + e.currentTarget.id;
            console.log(brId);
            $(brId).css('color', 'blue');
        });
        $('.mrNameArea').mouseout(function (e) {
            var brId = "#" + e.currentTarget.id;
            $(brId).css('color', 'black');
        });
    });
    function readMeetingRoom(mrId) {
        location.replace('/meeting/meetingRoom/read/' + mrId);
    }
    function modelOpen(mrId) {
        buffer = mrId;
        console.log(buffer);
    }
    $(document).on('click', '.deleteAlert', function (e) {
        swal({
            title: "삭제하시겠습니까?",
            text: "삭제 시,해당 지사 정보 복원 불가",
            type: "warning",
            showCancelButton: true,
            confirmButtonText: "네, 삭제하겠습니다",
            cancelButtonText: "아뇨, 취소하겠습니다",
            closeOnConfirm: false,
            closeOnCancel: false
        }, function (isConfirm) {
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
                <i class="fa fa-calendar"></i>회의실관리</h1>
            <p>
                전체 회의실 목록입니다.
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
                <a href="#">회의실관리</a>
            </li>
        </ul>
    </div>
    <div style="text-align:right">
        <a class="btn btn-primary btn-sm" href="/meeting/meetingRoom/create">회의실 추가</a>
    </div>
    <div class="row">
        <c:forEach items='${meetingRoomList}' var="meetingRoomList">
            <div class="col-lg-4" style="padding-top:20px">
                <div class="bs-component">
                    <div class="card">
                        <h4 class="card-header">
                        <span onclick="readMeetingRoom('${meetingRoomList.mrId}')">${meetingRoomList.mrName}</span>
                            <span style="float:right">
                                <a class="deleteAlert" id="demoSwal" style="cursor:pointer;">
                                    X
                                </a>
                            </span>
                        </h4>
                        <div class="card-body">
                            <h5 class="card-title">${meetingRoomList.brLocation} ${meetingRoomList.mrLocation}</h5>
                            <h6 class="card-subtitle text-muted">
                                <b>관리자</b>
                                ${meetingRoomList.empName}</h6>
                        </div>
                        <img alt="Card image" src="${meetingRoomList.mrImg}" style="height: 200px; width: 100%; display: block;">
                            <div class="card-body">
                                <p class="card-text">
                                    <table>
                                        <tr>
                                            <td>
                                                <b>공간유형</b>
                                            </td>
                                            <c:if test="${meetingRoomList.mrType eq 'mr_type_0'}">
                                                <td>회의실</td>
                                            </c:if>
                                            <c:if test="${meetingRoomList.mrType eq 'mr_type_1'}">
                                                <td>대회의실</td>
                                            </c:if>
                                            <c:if test="${meetingRoomList.mrType eq 'mr_type_2'}">
                                                <td>교육실</td>
                                            </c:if>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b>예약시간</b>
                                            </td>
                                            <td>최소 30분부터</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <b>수용인원</b>
                                            </td>
                                            <td>${meetingRoomList.mrLimit }인</td>
                                        </tr>
                                    </table>
                                </p>
                                <c:set value="${meetingRoomList.eqId}" var="eqId"/>
                                <c:if test="${fn:contains(eqId,'M')}">
                                    <i class="fa fa-fw fa-lg fa-wifi"></i>wifi<br></c:if>
                                    <c:if test="${fn:contains(eqId,'N')}">
                                        <i class="fa fa-fw fa-lg fa-laptop"></i>laptop<br></c:if>
                                        <c:if test="${fn:contains(eqId,'WB')}">
                                            <i class="fa fa-fw fa-lg fa-edit"></i>White Board<br></c:if>
                                            <c:if test="${fn:contains(eqId,'V')}">
                                                <i class="fa fa-fw fa-lg fa-video-camera"></i>Beam project<br></c:if>
                                                <a class="card-link" href="#"></a>
                            </div>
                          <div class="card-footer text-muted"></div>
                       </div>
					</div>
				</div>
			</c:forEach>
		</div>
</main>
<script src="/meeting/resources/js/plugins/bootstrap-notify.min.js" type="text/javascript"></script>
<script src="/meeting/resources/js/plugins/sweetalert.min.js" type="text/javascript"></script>