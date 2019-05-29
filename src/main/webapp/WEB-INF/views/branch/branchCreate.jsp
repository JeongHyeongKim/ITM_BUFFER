<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>지사 수정</title>
	<script type="text/javascript">
	
	$(function(){
	
		var name = branch.brName;
		var address = branch.brLocation;
		var tel = branch.brTel;
		var img = branch.brImg
		//console.log(name);	
		
		document.getElementById("brName").value=name;
		document.getElementById("brAddress").value=address;
		document.getElementById("brTel").value=tel;
		//임시이기 때문에 이미지는 넣지 않았습니다.
		
		
		$("#write").on("click", function() {
	        
	        var formData = new FormData();
	        formData.append("${_csrf.parameterName}", "${_csrf.token}");
	        formData.append("brName", $("#brName").val());
	        formData.append("brAddress", $("#brAddress").val());
	        formData.append("brTel", $("#brTel").val());
	        formData.append("brImg", $("#brImg").val());
	       
			console.log(formData.get("brId"));
	        $.ajax({
	           url : "/meeting/branch/insert",
	           type : "post",
	           contentType: false,	
	           processData: false,
	           data : formData,
	           success : function() {
	        	   console.log("check")
	           },
	           error : function(){
	        	   console.log("false")
	           }
	        })
		})
	});
	</script>
</head>

<body>
    <main class="app-content">
        <div class="app-title">
            <div>
                <h1>회의실/교육실 관리</h1>
                <p>>지사관리</p>
            </div>
            <ul class="app-breadcrumb breadcrumb">
                <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i>회의실 교육실 관리 / 지사추가</li>
            </ul>
        </div>

			
        <div class="row">
        <!--form action="" method="">-->
            <div class="col-md-4">
                <div class="tile">
                    <img class="user-img" src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/128.jpg" height=235px >
                    <input class="form-control" type="file" id="brImg">
                </div>
            </div>
            <div class="col-md-8">
                <div class="tile">
                    <div class="tile-body">
                        <div class="form-horizontal">
                            <div class="form-group row">
                                <label class="control-label col-md-3">지사 이름 :</label>
                                <div class="col-md-8">
                                    <input class="form-control" type="text" placeholder="지사를 입력해주세요" id="brName" >
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">지사 주소 : </label>
                                <div class="col-md-8">
                                    <input class="form-control"  placeholder="주소를 입력해주세요" id="brAddress" >
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3">대표 번호 : </label>
                                <div class="col-md-8">
                                    <input class="form-control" type="text" placeholder="대표번호를 입력해주세요" id="brTel">
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="tile-footer">
                        <div class="row">
                            <div class="col-md-8 col-md-offset-3">
                                <button class="btn btn-primary" type="button" id="write"><i class="fa fa-fw fa-lg fa-check-circle"></i>확인</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="/meeting/branch/list"><i class="fa fa-fw fa-lg fa-times-circle"></i>취소</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>

</html>