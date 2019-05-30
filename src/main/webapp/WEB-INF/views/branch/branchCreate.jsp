<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>지사 수정</title>
	<script type="text/javascript">
	
	$(function(){
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
                <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i>회의실 교육실 관리 / 지사관리</li>
            </ul>
        </div>

		<form action="/meeting/branch/write" method="POST">
        <div class="row">
        	<input type="hidden" name="brId" value="0">
        	<input type="hidden" name="_csrf" value="${_csrf.token}">
            <div class="col-md-4">
                <div class="tile" style="text-align:center">
                    <img class="user-img" src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/128.jpg" height=235px >
                    <input class="form-control" type="file" name="brImg">
                </div>
            </div>
            <div class="col-md-8">
                <div class="tile">
                    <div class="tile-body">
                        <div class="form-horizontal">
                            <div class="form-group row">
                                <label class="control-label">지사 이름 :</label>
                                <div class="col-md-8">
                                    <input class="form-control" type="text" placeholder="지사를 입력해주세요" name="brName" >
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label">지사 주소 : </label>
                                <div class="col-md-8">
                                    <input class="form-control"  placeholder="주소를 입력해주세요" name="brLocation " >
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label">대표 번호 : </label>
                                <div class="col-md-8">
                                    <input class="form-control" type="text" placeholder="대표번호를 입력해주세요" name="brTel">
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="tile-footer">
                        <div class="row">
                            <div class="col-md-8 col-md-offset-3">
                                <button class="btn btn-primary" type="submit" id="write"><i class="fa fa-fw fa-lg fa-check-circle"></i>확인</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="/meeting/branch/list"><i class="fa fa-fw fa-lg fa-times-circle"></i>취소</a>
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