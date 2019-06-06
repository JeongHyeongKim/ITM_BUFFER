<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/meeting/resources/css/jquery.datetimepicker.css" rel="stylesheet" />
<main class="app-content">
	<div class="app-title">
		<div>
          <h1><i class="fa fa-calendar"></i>회의실 예약</h1>
          <p>회의실 예약 현황을 확인한 뒤, 예약을 신청하세요</p>
          
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="/meeting/reservation/resShortMain/br_0001">회의실 예약</a></li>
        </ul>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="tile row">
				<h3 class="tile-title">회의실 예약 신청 작성</h3>
			    <div class="tile-body" style="width:100%;">
	              <form class="row">
	                <div class="form-group col-md-3">
	                 	<label class="control-label">신청자 명</label>
                  		<input class="form-control" type="text" id="resName" >
				     </div>
				     <div class="form-group col-md-3">
	                 	<label class="control-label">회의실 명</label>
                  		<input class="form-control" type="text">
				     </div>
				     <div class="form-group col-md-3">
	                 	<label class="control-label">회의 구분</label>
                  		<input class="form-control" type="text" placeholder="내부회의, 고객미팅 등">
				     </div>
				     <div class="form-group col-md-3">
	                 	<label class="control-label">최근 회의 목록 불러오기</label>
                  		<input class="form-control" type="button" value="불러오기" />
				     </div>
				     <div class="form-group col-md-3">
	                 	<label class="control-label">예약 시작 일자</label>
                  		<input class="form-control" id="resStartDate" type="text" placeholder="예약 시작 일자" name="filter-date">
				     </div>
				     <div class="form-group col-md-3">
	                 	<label class="control-label">예약 종료 일자</label>
                  		<input class="form-control" id="resEndDate" type="text" placeholder="예약 종료 일자" name="filter-date">
				     </div>
				     <div class="form-group col-md-3"></div>
				     <div class="form-group col-md-3"></div>
				     <div class="form-group col-md-3">
	                 	<label class="control-label">사용 목적</label>
                  		<input class="form-control" type="text" placeholder="회의 목적을 작성해주십시오">
				     </div>
				     <div class="form-group col-md-3">
	                 	<label class="control-label">참석 인원 수</label>
                  		<input class="form-control" type="number" min="1">
				     </div>
				     <div class="form-group col-md-3">
	                 	<label class="control-label">기자재</label>&nbsp;&nbsp;<input class="btn btn-outline-primary" type="button" value="+" data-toggle="modal" data-target="#EquipList">
                  		<input class="form-control" type="text" placeholder="기자재를 선택하십시오">
				     </div>
				     <div class="form-group col-md-3">
	                 	<label class="control-label">간식 유무</label>
                  		<div class="animated-checkbox">
					       <label>
					          <input type="checkbox" name="resSnack"><span class="label-text">간식 있음</span>
					       </label>
					    </div>
				     </div>
				     <textarea class="form-control" rows="4" placeholder="기타 전달 사항을 입력해 주십시오"></textarea>
				     <div class="form-group col-md-3"></div><div class="form-group col-md-3"></div><div class="form-group col-md-3"></div>
				     <div class="form-group col-md-3" style="padding-top:50px;text-align:right">
				     	<input type="submit" class="btn btn-info" value="예약 신청" id="sendForm"/>
				     </div>
				  </form>
				</div>
			</div>
		</div>
	</div>
</main>
<script src="/meeting/resources/js/plugins/jquery.datetimepicker.full.js"></script> 
<script>
$(document).ready(function(){
	 var resStartDate = sessionStorage.getItem("currentDate"); 
	 resStartDate+="00:00";
	 $('#resStartDate').val(resStartDate);

 });
</script>
<script type="text/javascript">
      /* $("#sendForm").on("click",function(){
    	 /* sessionStorage.removeAttribute("currentDate"); 
      }) */
      $('#resStartDate').datetimepicker({
    	  'step': 30 
      });
      $('#resEndDate').datetimepicker({
    	  'step': 30 
      });
</script>
