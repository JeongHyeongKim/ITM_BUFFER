<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<main class="app-content">
	<div class="app-title">
        <div>
            <h1>
                <i class="fa fa-calendar"></i>지사관리</h1>
            <p>
                지사를 추가합니다.
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

		<form action="/meeting/file/branchWrite" method="POST" enctype="multipart/form-data">
        <div class="row" >
        	<input type="hidden" name="brId" value="0">
        	<input type="hidden" name="_csrf" value="${_csrf.token}">
        	<div class="col-md-12" >      
	          <div class="tile" > 
	            <h3 class="tile-title">지사 정보를 입력하여 주십시오</h3>
	            <div class="tile-body">
	                <div class="form-group">
	                  <label class="control-label">지사 이름</label>
	                  <input class="form-control" type="text" name="brName"> 
	                </div>
	                <div class="form-group">
	                  <label class="control-label">지사 주소</label>
	                  <input class="form-control" type="text"   name="brLocation">
	                </div>
	                <div class="form-group">
	                  <label class="control-label">대표 번호</label>
	                  <textarea class="form-control"  name="brTel"></textarea>
	                </div>
	                <div class="form-group">
	                  <label class="control-label">지사 사진</label>
	                  <input class="form-control" type="file" id="imgUpload" name="brImg">
	                </div>
	            </div>
	            <div class="tile-footer" >
	            	<div>
	              		<button class="btn btn-primary" type="submit" id="write"><i class="fa fa-fw fa-lg fa-check-circle"></i>확인</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="/meeting/branch/list"><i class="fa fa-fw fa-lg fa-times-circle"></i>취소</a>
	            	</div>
	            </div>
	          </div> 
	        </div>
        </div>
     </form>
</main>
