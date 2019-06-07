<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/meeting/resources/css/jquery.datetimepicker.css" rel="stylesheet"/>
<main class="app-content">
	<div class="app-title">
		<div>
          <h1><i class="fa fa-calendar"></i>회의실 예약</h1>
          <p>회의실 예약 현황을 확인한 뒤, 예약을 신청하세요</p>
          
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item">
                <i class="fa fa-home fa-lg"></i>
            </li>
            <li class="breadcrumb-item">
                <a href="/meeting/reservation/resShortMain/br_0001">회의실 예약</a>
            </li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile row">
                <h3 class="tile-title">회의실 예약 신청 작성</h3>
                <div class="tile-body" style="width:100%;">
                    <form class="row" id="resForm" method="POST" action="#">
                        <div class="form-group col-md-3">
                            <label class="control-label">신청자 명</label>
                            <input class="form-control" id="resName" type="text" readonly>
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">회의실 명</label>
                            <input class="form-control" id="resMrName" type="text" readonly>
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">회의 구분</label>
                            <input class="form-control" placeholder="내부회의, 고객미팅 등" type="text">
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">최근 회의 목록 불러오기</label>
                            <input class="form-control" type="button" value="불러오기" data-target="#MyReservationList" data-toggle="modal"/>
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">예약 시작 일자</label>
                            <input class="form-control" id="resStartDate" name="filter-date" placeholder="예약 시작 일자" type="text">
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">예약 종료 일자</label>
                            <input class="form-control" id="resEndDate" name="filter-date" placeholder="예약 종료 일자" type="text">
                        </div>
                        <div class="form-group col-md-3"></div>
                        <div class="form-group col-md-3"></div>
                        <div class="form-group col-md-3">
                            <label class="control-label">사용 목적</label>
                            <input class="form-control" placeholder="회의 목적을 작성해주십시오" type="text">
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">참석 인원 수</label>
                            <input class="form-control" min="1" type="number">
                        </div>
                        <div class="form-group col-md-3"> 
                            <label class="control-label">기자재</label>&nbsp;&nbsp;<button class="btn btn-outline-primary" data-target="#EquipList" data-toggle="modal" type="button" >+</button>
                            <input class="form-control" placeholder="기자재를 선택하십시오" type="text">
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">간식 유무</label>
                            <div class="animated-checkbox">
                                <label>
                                    <input name="resSnack" type="checkbox"><span class="label-text">간식 있음</span>
                                </label>
                            </div>
                        </div>
                        <textarea class="form-control" placeholder="기타 전달 사항을 입력해 주십시오" rows="4"></textarea>
                        <div class="form-group col-md-3"></div>
                        <div class="form-group col-md-3"></div>
                        <div class="form-group col-md-3"></div>
                        <div class="form-group col-md-3" style="padding-top:50px;text-align:right">
                            <input class="btn btn-info" id="sendForm" type="submit" value="예약 신청"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
         <!-- Modal -->
        <div class="modal fade" id="MyReservationList" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">최근 나의 회의예약신청 목록</h4>
						<button type="button" class="close" data-dismiss="modal">×</button>
					</div>
					<div class="modal-body">
						<form action="/meeting/reservation/writeReservation" method="POST">
							<div class="row mb-4">
							</div>
							<div class="row">
							</div>
							<div class="modal-footer" style="margin-top:20px">
								<div class="row mb-10">
									<div class="col-md-12">
										<input type="submit" class="btn btn-success" data-dismiss="modal" value="예약 작성">
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
        <!-- Modal -->
		<div class="modal fade" id="EquipList" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">기자재 목록</h4>
						<button type="button" class="close" data-dismiss="modal">×</button>
					</div>
					<div class="modal-body">
						<form action="/meeting/reservation/writeReservation" method="POST">
							<div class="row mb-4">
							</div>
							<div class="row">
							</div>
							<div class="modal-footer" style="margin-top:20px">
								<div class="row mb-10">
									<div class="col-md-12">
										<input type="submit" class="btn btn-success" data-dismiss="modal" value="기자재 작성">
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
    </div>
</main>
<script src="/meeting/resources/js/plugins/jquery.datetimepicker.full.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
<script>
    $(document).ready(function () {
        var resStartDate = sessionStorage.getItem("currentDate");
        resStartDate += "00:00";
        $('#resStartDate').val(resStartDate);
        $('#resMrName').val(sessionStorage.getItem("mrName"));
        $.ajax({
            url:"/meeting/users/getCurrentId",
            method :"post",
            data : "_csrf=${_csrf.token}",
            success : function(data){
               var emp = data;
               $('#resName').val(emp.empName);
            }
         });
        $.validator.addMethod("compareDate", function(value, element, params){
			 return this.optional(element) || (new Date(value) > new Date($(params).val()))
     	}, "종료 날짜가 시작 날짜보다 빠릅니다.");
		// END:
		
		// validate signup form on keyup and submit
		$("#resForm").validate({
			// TODO: 화면에 표시된 rule에 적합하도록 validation 체크 로직을 작성하시오.
			rules : {
		             resStartDate : {
		                required: true
		             },
		             resEndDate : {
		            	compareDate : "#resStartDate",
		                required: true
		             }
			},
			messages : {
					resStartDate : {
		            	required:"필수 항목입니다."
		            },
		            resEndDate : {
		            	required:"필수 항목입니다.",
		            	compareDate: '시작일은 종료일보다 반드시 빨라야 한다'

		            }
			},
			
			// validation에 실패했을 때 화면 처리
			highlight : function(element, errorClass) {
				$(element).next().find("." + errorClass).removeClass("checked");
				
			}
		});
    });
</script>
<script type="text/javascript">
    /* $("#sendForm").on("click",function(){
    	 /* sessionStorage.removeAttribute("currentDate"); 
      }) */
    $('#resStartDate').datetimepicker({'step': 30});
    $('#resEndDate').datetimepicker({'step': 30});
</script>