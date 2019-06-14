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
    
    	$(function(){
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


1. 교육실 선택시 자동으로 관리자는 교육장관리자로 선택
2. 대회의실 선택시 자동을 관리자는 
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

		<form action="/meeting/file/meetingRoomWrite" method="POST" enctype="multipart/form-data">
        <div class="row">
        	<input type="hidden" name="brId" value="0">
        	<input type="hidden" name="_csrf" value="${_csrf.token}">
            <div class="col-md-4">
                <div class="tile" style="text-align:center">
                    <img class="user-img" id="imgArea" src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/128.jpg" height=235px >
                    <input class="form-control" type="file" id="imgUpload" name="brImg">
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
		                                  	<option value="${branchList.brId}">${branchList.brName}</option>
		                                  </c:forEach>
				                    </select>
			                    </div>
			                    <div class="col-md-4">
			                    	<select class="form-control" name="mrType">
			                    	<option value="" hidden>회의실 유형 선택</option>
				                      <option>회의실</option>
				                      <option>대회의실</option>
				                      <option>교육실</option>
				                    </select>
			                    </div >
			                    <div class="col-md-4">
			                    	<input class="form-control" type="text" placeholder="회의실 이름을 입력해주세요">
			                    </div>
                            </div>
                            <div class="form-group row" style="padding-bottom:10px">
                            	<div class="col-md-12"> 
                                    <input class="form-control"  type="text" placeholder="주소를 입력해주세요" name="mtLocation" >
                                    </div>
                          		</div>
                            <div class="form-group row"  style="padding-bottom:10px">
                                <div class="col-md-6">
                                    <input class="form-control" type="text" placeholder="30분당 비용을 입력헤주세요" name="mtTel">
                                </div>
                                <div class="col-md-6">
                                    <input class="form-control" type="text" placeholder="최대 수용인원을 입력해주세요" name="mtTel">
                                </div>
                            </div>
                            <div class="form-group row" style="padding-bottom:10px">
                                <div class="col-md-4">
                                    <input class="form-control" type="text" placeholder="면적(m²)를 입력해주세요" name="mtTel">
                                </div>
                                <div class="col-md-4">
                                	<select class="form-control" name="empId">
	                                  <option value="none" hidden>관리자 선택</option>
		                                  <c:forEach items='${administrator}' var="administrator">
		                                  	<option value="${administrator.empId}">${administrator.empName}</option>
		                                  </c:forEach>
				                    </select>
                                </div>
                                <div class="col-md-4">
                                    <div class="animated-checkbox">
		                                <label>
		                                    	<input name="equip" type="checkbox" value="W"><span class="label-text">화이트보드</span>
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