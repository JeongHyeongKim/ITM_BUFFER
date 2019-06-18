<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
/*         $(function() {
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
            
            if(document.getElementById('mrNetwork').checked==true) {
                document.getElementById('mrNetworkHidden').disabled = true;
            }else{
            	document.getElementById('mrNetworkHidden').checked = true;
            } */
</script>
<main class="app-content">
	<div class="app-title">
        <div>
            <h1>
                <i class="fa fa-calendar"></i>회의실관리</h1>
            <p>
                회의실를 추가합니다.
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
    <form action="/meeting/file/meetingRoomWrite" method="POST" enctype="multipart/form-data">
    <div class="row" ></div>
            <input type="hidden" name="mrId" value="0">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            	<div class="col-md-12" >      
	         	 <div class="tile" > 
	            	<h3 class="tile-title">회의실 정보를 입력하여 주십시오</h3>
		            <div class="tile-body">
		                <div class="form-group">
		                  <label class="control-label">지사선택</label>
		                  <select class="form-control" name="brId">
                             <option value="none" >지사 선택</option>
                                  <c:forEach items='${branchList}' var="branchList">
                                      <option value="${branchList.brId}">${branchList.brName}</option>
                                  </c:forEach>
                           </select>
		                </div>
		                <div class="form-group">
		                  <label class="control-label">회의실 유형 선택</label>
		                 	 <select class="form-control" name="mrType">
                              	<option value="" hidden>회의실 유형 선택</option>
                                <option value="mr_type_0">회의실</option>
                                <option value="mr_type_1">대회의실</option>
                                <option value="mr_type_2">교육실</option>
                             </select>
		                </div>
		                <div class="form-group">
		                  <label class="control-label">회의실 이름</label>
		                  <input class="form-control" name="mrName" type="text" ></input>
		                </div>
		                <div class="form-group">
		                  <label class="control-label">회의실 주소</label>
		                  <textarea class="form-control"  name="mrLocation" ></textarea>
		                </div>
		                <div class="form-group">
		                  <label class="control-label">회의실 사용 비용</label>
		                  <input class="form-control" type="text" name="mrPrice" placeholder="30분당 비용을 입력해주십시오">
		                </div>
		                <div class="form-group">
		                  <label class="control-label">수용인원</label>
		                  <input class="form-control" type="text"  name="mrLimit"></input>
		                </div>
		                <div class="form-group">
		                  <label class="control-label">면적(m²)</label>
		                  <input class="form-control" type="text"  name="mrArea"></input>
		                </div>
		                <div class="form-group">
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
	                              <input name="mrNetwork" type="checkbox" value="net_1" id="mrNetwork"><span class="label-text">네트워크 지원</span>
	                              <input type="hidden" name="mrNetwork" value="net_0" id="mrNetworkHidden" />
	                           </label>
                           </div>
						</div>
		            </div>
		            <div class="tile-footer" >
		            	<button class="btn btn-primary" type="submit" id="write"><i class="fa fa-fw fa-lg fa-check-circle"></i>확인</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="/meeting/meetingRoom/list"><i class="fa fa-fw fa-lg fa-times-circle"></i>취소</a>
	                </div>
		          </div>
		        </div>
		</div>
	</form>
</main>
