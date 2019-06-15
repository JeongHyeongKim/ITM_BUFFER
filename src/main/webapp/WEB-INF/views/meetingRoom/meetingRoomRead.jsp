<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회의실 관리</title>
    <style>
        .grid-mt {
            padding: 20px;
            display: grid;

        }
    </style>


    <script>
    $(function() {

        var meetingRoom = JSON.parse('${meetingRoom}');
        //var meetingRoomList = JSON.parse('${meetingRoomList}');
        //console.log(branch);
        //console.log(${branch});

        var mrId = null;
        var mrName = null;
        var brId = null;
        var mrLimit=null;
        var mrPrice=null;
        var mrArea=null; 
        var mrNetwork=null;
        var mrType=null; // 아직
        var empId=null; // 관리자, 아직
		var mrLocation=null;
        var mrImg=null;
		//잠시 저장하기 위한 임시 버퍼	
		
		document.getElementById("imgArea").src=meetingRoom.mrImg;
		document.getElementById(meetingRoom.brId).selected=true;
		document.getElementById("mrName").value=meetingRoom.mrName;
		document.getElementById("mrLimit").value=meetingRoom.mrLimit;
		document.getElementById("mrPrice").value=meetingRoom.mrPrice;
		document.getElementById("mrArea").value=meetingRoom.mrArea;
		document.getElementById("mrLocatoin").value=meetingRoom.mrLocation;
		if(meetingRoom.mrNetwork=="net_1") {
            document.getElementById('mrNetworkHidden').disabled = true;
            document.getElementById('mrNetwork').checked=true;
        }else{
        	document.getElementById('mrNetworkHidden').checked = true;
        	documet.getElementById('mrNetwork').disalbed=true;
        }
		
		document.getElementById(meetingRoom.mrType).selected=true;
		document.getElementById(meetingRoom.empId).selected=true;
		//페이지 오픈 시 기본 세팅 쿼리. 아직 테스트 안함.
		


        $('#modalOpen').click(function() {
            name = document.getElementById("brName").value;
            address = document.getElementById("brAddress").value;
            tel = document.getElementById("brTel").value;

            document.getElementById("modalBranchName").innerHTML = name
            document.getElementById("modalBranchLocation").innerHTML = address
            document.getElementById("modalBranchTel").innerHTML = tel
        })

        
        if(document.getElementById('mrNetwork').checked==true) {
                document.getElementById('mrNetworkHidden').disabled = true;
            }else{
            	document.getElementById('mrNetworkHidden').checked = true;
            }
        
        $('#finallyConfirm').click(function() {
            $('#branchDataUpdate').submit();
        });
         $("#imgUpload").change(function(){
    		if(this.files && this.files[0]){
    			var reader = new FileReader();
    			
    			reader.onload = function(e){
    				$('#imgArea').attr('src', e.target.result);
    				$('#imgArea').attr('height', '235px');
    				$('#imgArea').attr('width', '235px');
    			}
    			reader.readAsDataURL(this.files[0]);
    		}
    	}); 

    });
    </script>
</head>


<body>
    <main class="app-content">
        <div class="app-title">
            <div>
                <h1>회의실/교육실 관리</h1>
                <p>>회의실 관리</p>
            </div>
            <ul class="app-breadcrumb breadcrumb">
                <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i>회의실 교육실 관리 / 지사관리</li>
            </ul>
        </div>

        <form action="/meeting/file/meetingRoomUpdate" method="POST" enctype="multipart/form-data">
            <div class="row">
                <input type="hidden" name="mrId" value="0">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <div class="col-md-4">
                    <div class="tile" style="text-align:center">
                        <img class="user-img" id="imgArea" src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/128.jpg" height=235px>
                        <input class="form-control" type="file" id="imgUpload" name="mrImg">
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
                                            <option value="mr_type_0">회의실</option>
                                            <option value="mr_type_1">대회의실</option>
                                            <option value="mr_type_2">교육실</option>
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
                            <div class="row">
                                <div class="col-md-8 col-md-offset-3">
                                    <button class="btn btn-primary" type="submit" id="write"><i class="fa fa-fw fa-lg fa-check-circle"></i>확인</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="/meeting/meetingRoom/list"><i class="fa fa-fw fa-lg fa-times-circle"></i>취소</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </main>
</body>

</html>