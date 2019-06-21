<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    $(function() {

        var meetingRoom = JSON.parse('${meetingRoom}');

        var mrId = null;
        var mrName = null;
        var brId = null;
        var mrLimit = null;
        var mrPrice = null;
        var mrArea = null;
        var mrNetwork = null;
        var mrType = null;
        var empId = null;
        var mrLocation = null;
        var mrImg = null;
        //잠시 저장하기 위한 임시 버퍼	
        /* 
        document.getElementById("imgArea").src=meetingRoom.mrImg; */
        document.getElementById(meetingRoom.brId).selected = true;
        document.getElementById("mrName").value = meetingRoom.mrName;
        document.getElementById("mrLimit").value = meetingRoom.mrLimit;
        document.getElementById("mrPrice").value = meetingRoom.mrPrice;
        document.getElementById("mrArea").value = meetingRoom.mrArea;
        document.getElementById("mrLocation").value = meetingRoom.mrLocation;
        if (meetingRoom.mrNetwork == "net_1") {
            document.getElementById('mrNetworkHidden').disabled = true;
            document.getElementById('mrNetwork').checked = true;
        } else {
            document.getElementById('mrNetworkHidden').checked = true;
            documet.getElementById('mrNetwork').disalbed = true;
        }
        document.getElementById("mrIdHiddenArea").value = meetingRoom.mrId;
        document.getElementById(meetingRoom.mrType).selected = true;
        document.getElementById(meetingRoom.empId).selected = true;


        if (document.getElementById('mrNetwork').checked == true) {
            document.getElementById('mrNetworkHidden').disabled = true;
        } else {
            document.getElementById('mrNetworkHidden').checked = true;
        }

        $('#finallyConfirm').click(function() {
            $('#meetingRoomUpdate').submit();
        });
        $("#imgUpload").change(function() {
            if (this.files && this.files[0]) {
                var reader = new FileReader();

                reader.onload = function(e) {
                    $('#imgArea').attr('src', e.target.result);
                    $('#imgArea').attr('height', '235px');
                    $('#imgArea').attr('width', '235px');
                }
                reader.readAsDataURL(this.files[0]);
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
                회의실 정보를 수정합니다.
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

    <form action="/meeting/file/meetingRoomUpdate" id="meetingRoomUpdate" method="POST" enctype="multipart/form-data">
        <div class="row">
            <input type="hidden" name="mrId" id="mrIdHiddenArea"> <!-- 바로 세팅이 안된다. 따로 해줘야할듯 -->
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <%-- <div class="col-md-4">
                    <div class="tile" style="text-align:center">
                        <img class="user-img" id="imgArea" src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/128.jpg" height=235px>
                        <div style="vertical-align:bottom;text-align:right"> 
	                        <div class="upload-wrapper">
	                            <button class="upload-btn" id="imgUpload">업로드</button> 
	                            <input type="file" id="imgUpload" name="mrImg"> 
	                        </div>
                        </div>
<!--                         다이어로그가 안뜨고 submit 되어버리는 오류 -->
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="form-horizontal">
                                <div class="form-group row" style="padding-bottom:10px">
                                    <div class="col-md-4">
                                        <select class="form-control" name="brId">
                                            <!-- 보여지는거는 네임으로, 보내지는 파라미터는 지사이름으로 보내져야한다. -->
                                            <option value="none" hidden>지사 선택</option>
                                            <c:forEach items='${branchList}' var="branchList">
                                                <option value="${branchList.brId}" id="${branchList.brId}">${branchList.brName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <select class="form-control" name="mrType">
                                            <option value="" hidden>회의실 유형 선택</option>
                                            <option value="mr_type_0" id="mr_type_0">회의실</option>
                                            <option value="mr_type_1" id="mr_type_1">대회의실</option>
                                            <option value="mr_type_2" id="mr_type_2">교육실</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <input class="form-control" id="mrName" name="mrName" type="text" placeholder="회의실 이름을 입력해주세요">
                                    </div>
                                </div>
                                <div class="form-group row" style="padding-bottom:10px">
                                    <div class="col-md-12">
                                        <input class="form-control" id="mrLocation" type="text" placeholder="주소를 입력해주세요" name="mrLocation">
                                    </div>
                                </div>
                                <div class="form-group row" style="padding-bottom:10px">
                                    <div class="col-md-6">
                                        <input class="form-control" id="mrPrice" type="text" placeholder="30분당 비용을 입력헤주세요" name="mrPrice">
                                    </div>
                                    <div class="col-md-6">
                                        <input class="form-control" id="mrLimit" type="text" placeholder="최대 수용인원을 입력해주세요" name="mrLimit">
                                    </div>
                                </div>
                                <div class="form-group row" style="padding-bottom:10px">
                                    <div class="col-md-4">
                                        <input class="form-control" id="mrArea" type="text" placeholder="면적(m²)를 입력해주세요" name="mrArea">
                                    </div>
                                    <div class="col-md-4">
                                        <select class="form-control" name="empId">
                                            <option value="none" hidden>관리자 선택</option>
                                            <c:forEach items='${administrator}' var="administrator">
                                                <option value="${administrator.empId}" id="${administrator.empId}">${administrator.empName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="animated-checkbox">
                                            <label>
                                                <input name="mrNetwork" type="checkbox" value="net_1" id="mrNetwork"><span class="label-text">네트워크 지원</span>
                                                <input type="hidden" name="mrNetworkHidden" value="net_0" id="mrNetworkHidden" />
                                                <!-- 여기서 엠알 타입 둘다 들어가는 현상이 있는데 이를 해결하는 jsp가 필요하다. -->
                                            </label>
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="tile-footer">
                        <!--  modal start -->
                            <div class="modal fade" id="confirm" role="dialog">
                                <div class="modal-dialog">
                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title" style="text-align:center;">입력 확인</h4>
                                            <button type="button" class="close" data-dismiss="modal">×</button>
                                        </div>
                                        <div class="modal-body">
                                                    <h5 id="modalBranchName">작성하신 내용이 맞습니까?</h5>
                                               
                                            <div class="modal-footer" style="margin-top:20px">
                                                <div class="row mb-10">
                                                    <div class="col-md-12">
                                                        <button class="btn btn-success" id="finallyConfirm" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>확인</button>
                                                        <button class="btn btn-success" type="button" data-dismiss="modal"><i class="fa fa-fw fa-lg fa-check-circle"></i>취소</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-8 col-md-offset-3">
                                    <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#confirm" id="modalOpen"><i class="fa fa-fw fa-lg fa-check-circle"></i>확인</button>&nbsp;&nbsp;&nbsp;
                                    <a class="btn btn-secondary" href="/meeting/branch/list"><i class="fa fa-fw fa-lg fa-times-circle"></i>취소</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> --%>
            <div class="col-md-12">
                <div class="tile">
                    <h3 class="tile-title">회의실 정보를 입력하여 주십시오</h3>
                    <div class="tile-body">
                        <div class="form-group">
                            <label class="control-label">지사선택</label>
                            <select class="form-control" name="brId">
                                <option value="none">지사 선택</option>
                                <c:forEach items='${branchList}' var="branchList">
                                    <option value="${branchList.brId}" id="${branchList.brId}">${branchList.brName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="control-label">회의실 유형 선택</label>
                            <select class="form-control" name="mrType">
                                <option value="">회의실 유형 선택</option>
                                <option value="mr_type_0" id="mr_type_0">회의실</option>
                                <option value="mr_type_1" id="mr_type_1">대회의실</option>
                                <option value="mr_type_2" id="mr_type_2">교육실</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="control-label">회의실 이름</label>
                            <input class="form-control" name="mrName" type="text" id="mrName"></input>
                        </div>
                        <div class="form-group">
                            <label class="control-label">회의실 주소</label>
                            <input class="form-control" name="mrLocation" id="mrLocation"></input>
                        </div>
                        <div class="form-group">
                            <label class="control-label">회의실 사용 비용</label>
                            <input class="form-control" type="text" name="mrPrice" id="mrPrice" placeholder="30분당 비용을 입력해주십시오">
                        </div>
                        <div class="form-group">
                            <label class="control-label">수용인원</label>
                            <input class="form-control" type="text" name="mrLimit" id="mrLimit"></input>
                        </div>
                        <div class="form-group">
                            <label class="control-label">면적(m²)</label>
                            <input class="form-control" type="text" name="mrArea" id="mrArea"></input>
                        </div>
                        <div class="form-group">
                            <select class="form-control" name="empId" id="empId">
                                <option value="none" hidden>관리자 선택</option>
                                <c:forEach items='${administrator}' var="administrator">
                                    <option value="${administrator.empId}" id="${administrator.empId}">${administrator.empName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <div class="animated-checkbox">
                                <label>
                                    <input name="mrNetwork" type="checkbox" value="net_1" id="mrNetwork"><span class="label-text">네트워크 지원</span>
                                    <input type="hidden" name="mrNetworkHidden" value="net_0" id="mrNetworkHidden" />
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label">회의실 사진</label>
                            <input class="form-control" type="file" id="imgUpload" name="mrImg">
                        </div>
                    </div>

                    <!--  modal start -->
                    <div class="modal fade" id="confirm" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title" style="text-align:center;">아래 내용이 맞습니까?</h4>
                                    <button type="button" class="close" data-dismiss="modal">×</button>
                                </div>
                                <div class="modal-body">
                                    <div class="row mb-4">
                                        <div class="col-md-4">
                                            <label>지사 이름</label>
                                            <h5 id="modalBranchName"></h5>
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <div class="col-md-4">
                                            <label>지사 주소</label>
                                            <h5 id="modalBranchLocation"></h5>
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <div class="col-md-4">
                                            <label>대표 번호</label>
                                            <h5 id="modalBranchTel"></h5>
                                        </div>
                                    </div>
                                    <div class="modal-footer" style="margin-top:20px">
                                        <div class="row mb-10">
                                            <div class="col-md-12">
                                                <button class="btn btn-success" id="finallyConfirm" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>확인</button>
                                                <button class="btn btn-success" type="button" data-dismiss="modal"><i class="fa fa-fw fa-lg fa-check-circle"></i>취소</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- modal end -->
                    <div class="tile-footer">
                        <button class="btn btn-primary" type="submit" id="write"><i class="fa fa-fw fa-lg fa-check-circle"></i>확인</button>
                        &nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="/meeting/meetingRoom/list"><i class="fa fa-fw fa-lg fa-times-circle"></i>취소</a>
                    </div>
                </div>
            </div>
        </div>
    </form>
</main>