<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>지사 수정</title>
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
	
<div class="row">
        <div class="col-md-4">
			<div class="tile">
	          	<img class="user-img" src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/128.jpg">
	          	<input class="form-control" type="file">
			</div>
        </div>
        <div class="col-md-8">
          <div class="tile">
            <h3 class="tile-title">Register</h3>
            <div class="tile-body">
              <form class="form-horizontal">
                <div class="form-group row">
                  <label class="control-label col-md-3">지사 이름 : </label>
                  <div class="col-md-8">
                    <input class="form-control" type="text" placeholder="Enter full name">
                  </div>
                </div>
                <div class="form-group row">
                  <label class="control-label col-md-3">지사 주소 : </label>
                  <div class="col-md-8">
                    <input class="form-control col-md-8" type="email" placeholder="Enter email address">
                  </div>
                </div>
                <div class="form-group row">
                  <label class="control-label col-md-3">대표 번호 : </label>
                  <div class="col-md-8">
                    <textarea class="form-control" rows="4" placeholder="Enter your address"></textarea>
                  </div>
                </div>
                
              </form>
            </div>
            <div class="tile-footer">
              <div class="row">
                <div class="col-md-8 col-md-offset-3">
                  <button class="btn btn-primary" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>Register</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancel</a>
                </div>
              </div>
            </div>
          </div>
        </div>
        </div>
 

          

	</main>
</body>
</html>