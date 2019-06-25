<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/meeting/resources/css/jquery.datetimepicker.css" rel="stylesheet"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
<style>

.swiper-slide {
	text-align:center;
	display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items:center; /* 위아래 기준 중앙정렬 */
	justify-content:center; /* 좌우 기준 중앙정렬 */
}
.swiper-slide btn {
	box-shadow:0 0 5px #555;
}
</style>
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
                    <form class="row" id="resForm">
                    	<input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="hidden" id="mrId" name="mrId" value="${mrId}">
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
                            <div style="width:100%;">
                            <input style="padding:0.275rem 0.60rem;font-size:0.875rem; ling-height:1.5; background-clip:padding-box;border:2px solid #ced4da;border-radius:4px;"id="resType" placeholder="직접입력" type="text" name="resType" >
                           
                            <button class="btn btn-info dropdown-toggle" style="display:inline;" id="btnGroupDrop3" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"></button>
                            <div class="dropdown-menu dropdown-menu-right" x-placement="bottom-end" style="position: absolute; transform: translate3d(-124px, 35px, 0px); top: 0px; left: 0px; will-change: transform;">
                            	<a class="dropdown-item" id="resType1">내부회의</a>
                            	<a class="dropdown-item" id="resType2">고객미팅</a>
                            	<a class="dropdown-item" id="resType3">정기회의</a>
                            	<a class="dropdown-item" id="resType4">긴급회의</a>
                            </div>
                            </div>
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">최근 회의 목록 불러오기</label>
                            <input class="form-control" type="button" value="불러오기" data-target="#MyReservationList" data-toggle="modal"/>
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">예약 시작 일자</label>
                            <input class="form-control" id="resStartDate" placeholder="예약 시작 일자" type="text">
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">예약 종료 일자</label>
                            <input class="form-control" id="resEndDate" placeholder="예약 종료 일자" type="text">
                        </div>
                        <div class="form-group col-md-3"></div>
                        <div class="form-group col-md-3"></div>
                        <div class="form-group col-md-3">
                            <label class="control-label">사용 목적</label>
                            <input class="form-control" placeholder="회의 목적을 작성해주십시오" type="text" name="resPurpose">
                        </div>
                         <div class="form-group col-md-3">
                            <label class="control-label">참석 인원 명단 <a data-target="#empList" data-toggle="modal">+</a></label>
                            <input class="form-control" type="text">
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">외부인 참석 인원 수</label>
                            <input class="form-control" min="1" type="number" name="resOutside">
                        </div>
                        <div class="form-group col-md-3">
                        </div>
                         <div class="form-group col-md-6">
                            <label class="control-label">기자재 <a data-target="#equipList" data-toggle="modal">추가</a></label>
                            <input class="form-control" type="text" id="equipElement" name="equipElement">
                        </div>
                         
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">간식 유무</label>
                            <div class="animated-checkbox">
                                <label>
                                    <input id="resSnack" name="resSnack" type="checkbox" value="1"><span class="label-text">간식 있음</span>
                                </label>
                            </div>
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">네트워크 사용 유무</label>
                            <div class="animated-checkbox">
                                <label>
                                    <input name="resNetwork" type="checkbox"><span class="label-text">네트워크 사용</span>
                                </label>
                            </div>
                        </div>
                        <textarea class="form-control" placeholder="기타 전달 사항을 입력해 주십시오" rows="4" name="resAddRequest"></textarea>
                        <div class="form-group col-md-3"></div>
                        <div class="form-group col-md-3"></div>
                        <div class="form-group col-md-3"></div>
	                        
	                    <div class="bs-component"  style="width:100%;height:100%">		
	                    	
							<div class="btn-group btn-group-toggle btn-group-time" style="width:100%;height:100%" data-toggle="buttons">
								
							</div>
							
						</div>

						<div class="form-group col-md-3" style="padding-top:50px;text-align:right">
                            <input class="btn btn-info" id="sendForm" type="button" value="예약 신청"/>
                        </div>
                  </form>
                </div>
            </div>
        </div>
        <!-- equipList -->
         <div class="modal fade" id="equipList" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">회의실 기자재수량</h4>
						<button type="button" class="close" data-dismiss="modal">×</button>
					</div>
					<div class="modal-body" id="equip-modal-body">
						<div class="input-group">
	                       
                    	</div>
					</div>
					<div class="modal-footer" style="margin-top:20px">
						<div class="row mb-10">
							<div class="col-md-12">
								<input type="button" class="btn btn-success" data-dismiss="modal" value="작성" id="equipSubmit">
							</div>
						</div>
					</div>
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
					<div class="modal-body" id="pastRes">
						
					</div>
				</div>
			</div>
		</div>
		
		 <!-- EmpModal -->
        <div class="modal fade" id="empList" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
			<div class="modal-dialog modal-lg" role="document">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">참석 명단 추가</h4>
						<button type="button" class="close" data-dismiss="modal">×</button>
					</div>
					<div class="modal-body" id="empList-modal-body">
						<!--  -->
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="tile" >
                        			<div class="sparkline10-list">
		                           	 <div class="sparkline10-hd">
		                                <div class="main-sparkline10-hd">
		                                    <h1>명단추가</h1>
		                                </div>
		                            </div>
                            <div class="sparkline10-graph">
                                <div class="basic-login-form-ad">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="dual-list-box-inner">
                                              
                                            <select class="form-control dual_select" id="empListOption" multiple >
												<c:forEach var="list" items="${empList }">
													<option value="${list.empId }">${list.empName } - ${list.deptName }</option>
												</c:forEach>
											</select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tile-footer" >
			            </div>
		                 </div>
		            </div>
			</div>
						
					</div>
					<div class="modal-footer" style="margin-top:20px">
						<div class="row mb-10">
							<div class="col-md-12">
								<input type="button" id="btnEmpList" class="btn btn-success" data-dismiss="modal" value="작성">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
    
</main>
<script src="/meeting/resources/js/plugins/jquery.datetimepicker.full.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
<script src="/meeting/resources/js/duallistbox/jquery.bootstrap-duallistbox.js"></script>
<script src="/meeting/resources/js/duallistbox/duallistbox.active.js"></script>
<script src="/meeting/resources/js/moment.js"></script>
<script src="/meeting/resources/js/moment.min.js"></script>
<script>
    $(document).ready(function () {
    	$("#btnEmpList").on("click",function(){
    		$("<input>").attr("type","hidden").attr("name","empList").attr("value",$("#empListOption").val()).appendTo($("#resForm"));
    	})
    	// Array contains method추가      
        Array.prototype.contains = function(element) {
			for (var i = 0; i < this.length; i++) {
				if (this[i] == element) {
					return true;
				}
			}
			return false;
		}
    	
    	////////////////////////////////////////////////////////////  pastReservation List
    	var pastRes = JSON.parse('${pastReservation}');
    	
    	for(var i=0; i<pastRes.length; i++){
    		$("<p></p>").text(i+ ") 회의목적 : " + pastRes[i].resPurpose+", 정보추가 ...").appendTo($("#pastRes"));
    	}
    	
    	////////////////////////////////////////////////////////////참석자명단 id : empList-modal-body
    	/* 
    	var empList = JSON.parse('${empList}');
    	
    	var deptList = [];
    	
    	// deptList 중복제거
    	for(var i=0; i<empList.length; i++){
    		if(deptList.contains(empList[i].deptName)){
    			const idx = deptList.indexOf(empList[i].deptName) 
    			if (idx > -1) deptList.splice(idx, 1)
    		} else{
    			deptList.push(empList[i].deptName);
    		}	
    	}
    	 */
    	// model 화면에 deptList출력
    	/* 
    	for(var i=0; i<deptList.length; i++){
    		
    		var $backDiv = $("<div></div>").attr("class","col-md-12").appendTo($("#empListOption"));
    		var $colsix = $("<div></div>").attr("class","col-md-6").appendTo($backDiv);
    		// div정렬중 ///////////////////////////////////
    		$("<p></p>").attr("id",deptList[i]).attr("class","col-md-6").attr("class","showDept").text("> "+deptList[i]).appendTo($colsix);
    		for(var j=0; j<empList.length; j++){
    			if(empList[j].deptName == deptList[i]){
    				var $deptDiv = $("<div></div>").attr("id","child"+deptList[i]).appendTo($backDiv);
    				$("<p></p>").text(empList[j].empName).appendTo($deptDiv);	
    			}
    		}
    		$("#child"+deptList[i]).hide();
    	}
    	$(".showDept").on("click",function(e){
    		$("#child"+e.currentTarget.id).toggle();
    	})
    	 */
    	///////////////////////////////////////////////////////////////회의구분 선택자
    	$("#resType1").on("click",function(){
    		$("#resType").attr("value",$("#resType1").text());
    	})
    	$("#resType2").on("click", function(){
    		$("#resType").val($("#resType2").text());
    	})
    	$("#resType3").on("click",function(){
    		$("#resType").val($("#resType3").text());
    	})
    	$("#resType4").on("click",function(){
    		$("#resType").val($("#resType4").text());
    	})

    	/////////////////////////기자재 modal // id : equip-modal-body
        var equipList = JSON.parse('${equipList}') ;
    	
    	$("#equipElement").val("빔프로젝터 ("+equipList['V']+"),화이트보드 ("+equipList['W']+"),마이크 ("+equipList['M']+"),노트북 ("+equipList['N']+")")
		var test = "빔프로젝터 (1),화이트보드 (1),마이크 (1),노트북 (3)";
    	
    	for(var i=0; i<Object.keys(equipList).length; i++){
    		var $inputDiv = $("<div></div>").attr("class","input-group");
    		
    		if(Object.keys(equipList)[i] == 'N'){
    			var $minusBtn = $("<div class='input-group-prepend'><button class='btn btn-secondary' type='button' id='NMinusBtn'>-</button></div>").appendTo($inputDiv);
    			$("<input class='form-control' id='N' name='N' type='text' value='노트북 대여 수량 : " + equipList['N'] + "'readonly>").appendTo($inputDiv);
    			var $plusBtn = $("<div class='input-group-append'><button class='btn btn-secondary' type='button' id='NPlusBtn'>+</button></div>").appendTo($inputDiv);
    		} else if(Object.keys(equipList)[i] == 'V'){
    			var $minusBtn = $("<div class='input-group-prepend'><button class='btn btn-secondary' type='button' id='VMinusBtn'>-</button></div>").appendTo($inputDiv);
    			$("<input class='form-control' id='V' type='text' value='빔프로젝터 대여 수량 : "+equipList['V']+ "'readonly>").appendTo($inputDiv);
    			var $plusBtn = $("<div class='input-group-append'><button class='btn btn-secondary' type='button' id='VPlusBtn'>+</button></div>").appendTo($inputDiv);
    		} else if(Object.keys(equipList)[i] == 'M'){
    			var $minusBtn = $("<div class='input-group-prepend'><button class='btn btn-secondary' type='button' id='MMinusBtn'>-</button></div>").appendTo($inputDiv);
    			$("<input class='form-control' id='M' type='text' value='마이크 대여 수량 : "+equipList['M']+ "'readonly>").appendTo($inputDiv);
    			var $plusBtn = $("<div class='input-group-append'><button class='btn btn-secondary' type='button' id='MPlusBtn'>+</button></div>").appendTo($inputDiv);
    		} else {
    			var $minusBtn = $("<div class='input-group-prepend'><button class='btn btn-secondary' type='button' id='WMinusBtn'>-</button></div>").appendTo($inputDiv);
    			$("<input class='form-control' id='W' type='text' value='화이트보드 대여 수량 : "+equipList['W']+ "'readonly>").appendTo($inputDiv);
    			var $plusBtn = $("<div class='input-group-append'><button class='btn btn-secondary' type='button' id='WPlusBtn'>+</button></div>").appendTo($inputDiv);
    		}
    		$inputDiv.appendTo($("#equip-modal-body"))
    	} 
    	$(document).on("click","#NMinusBtn",function(){
    		
    		if(($("#N").val().split(":")[1]) == 0){
    		
    		} else{
    			$("#N").val('노트북 대여 수량 : '+ ( ($("#N").val().split(":")[1]) -1))	
    		}
    	})
    	$(document).on("click","#NPlusBtn",function(){ 
    		
    		if(($("#N").val().split(":")[1]) == Number(equipList['N'])){
    		} else{
    			$("#N").val('노트북 대여 수량 : '+ ( Number(($("#N").val().split(":")[1])) +1))	
    		}
    	})
    	$(document).on("click","#VMinusBtn",function(){
    		 
    		if(($("#V").val().split(":")[1]) == 0){
    		} else{
    			$("#V").val('빔프로젝터 대여 수량 : '+ ( ($("#V").val().split(":")[1]) -1))	
    		}
    	})
    	$(document).on("click","#VPlusBtn",function(){ 
    		console.log(( ($("#V").val().split(":")[1]))) 
    		if(($("#V").val().split(":")[1]) == Number(equipList['V'])){
    		} else{
    			$("#V").val('빔프로젝터 대여 수량 : '+ ( Number(($("#V").val().split(":")[1])) +1))	
    		}
    	})
    	$(document).on("click","#WMinusBtn",function(){
    		console.log(( ($("#W").val().split(":")[1]))) 
    		if(($("#W").val().split(":")[1]) == 0){
    		} else{
    			$("#W").val('화이트보드 대여 수량 : '+ ( ($("#W").val().split(":")[1]) -1))	
    		}
    	})
    	$(document).on("click","#WPlusBtn",function(){ 
    		console.log(( ($("#W").val().split(":")[1]))) 
    		if(($("#W").val().split(":")[1]) == Number(equipList['W'])){
    		} else{
    			$("#W").val('화이트보드 대여 수량 : '+ ( Number(($("#W").val().split(":")[1])) +1))	
    		}
    	})
    	$(document).on("click","#MMinusBtn",function(){
    		console.log(( ($("#M").val().split(":")[1]))) 
    		if(($("#M").val().split(":")[1]) == 0){
    		} else{
    			$("#M").val('마이크 대여 수량 : '+ ( ($("#M").val().split(":")[1]) -1))	
    		}
    	})
    	$(document).on("click","#MPlusBtn",function(){ 
    		console.log(( ($("#M").val().split(":")[1]))) 
    		if(($("#M").val().split(":")[1]) == Number(equipList['M'])){
    		} else{
    			$("#M").val('마이크 대여 수량 : '+ ( Number(($("#M").val().split(":")[1])) +1))	
    		}
    	})
    	$("#equipSubmit").on("click",function(){
    		$("#equipElement").val("빔프로젝터 ("+Number(($("#V").val().split(":")[1]))+"),화이트보드 ("+Number(($("#W").val().split(":")[1]))+"),마이크 ("+Number(($("#M").val().split(":")[1]))+"),노트북 ("+Number(($("#N").val().split(":")[1]))+")")
    	})
    	//////////////////////////////////////////////////////////////////////////////////////////
        var resStartDate = sessionStorage.getItem("currentDate");
        resStartDate += " 09:00";
        
        var now = new Date();

        var year= now.getFullYear();
        var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
        var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
        var hh = now.getHours()>9 ?''+now.getHours() : '0'+now.getHours();
        var min = now.getMinutes()>9 ?''+now.getMinutes() : '0'+now.getMinutes(); 
        var today = year + '/' + mon + '/' + day+" "+hh+":"+min;
    	
        //////////////////////////////////////////////////////////////////////////////////
    	// 시간버튼클릭시 배열에 해당시간 입력후 중복제거 
        var selectTimes = [];
        var sendTimes = [];
    	$(document).on('click', '.btn-primary', function(e){
    		var choiceTime = e.currentTarget.id;
    		
    		if(selectTimes.length==0){
    			selectTimes.push(choiceTime);
    		} else {
    			if(selectTimes.contains(choiceTime)){
    				const idx = selectTimes.indexOf(choiceTime) 
    				if (idx > -1) selectTimes.splice(idx, 1)
    			} else{
    				selectTimes.push(choiceTime);
    			}
    		}
    	
    	$("#times").remove();
    	$("<input>").attr("type","hidden").attr("name","times").attr("id","times").attr("value",selectTimes).appendTo($("#resForm"));
    		
        })
       
        ////////////////////////////////////////////////////////////////////////////////// 
       
    	$("#sendForm").on("click",function(){
        	var form = $("#resForm").serialize();
        	
        	$.ajax({
        		url:"/meeting/reservation/writeReservation",
        		data:form,
        		method:"post",
        		success:function(){
        			location.href="/meeting/reservation/resShortMain/br_0001";
        		}
        	})
        })
        ///////////////////////////////////////////////////////////////////////////////// 
        function drawTime(){
        	 $(".btn-group").empty();
        	 var changeTime = "09:30";
             var splitMinTime = changeTime.substr(3,5);
             var splitHourTime = changeTime.substr(0,2);
             var aTime = new Array(); 
             var sessionTime = sessionStorage.getItem("availTime");
             aTime = sessionTime.split(",");
             
             // 허용날짜 중복제거
             var newTimes = [];
             $.each(aTime, function(i, el){
             	if($.inArray(el, newTimes) === -1) newTimes.push(el);
             });
             
             // 시간재구성
             for(var i=0; i<newTimes.length; i++){
             	var hour = newTimes[i].substr(1,1);
             	if(hour==":"){
             		newTimes[i] = "0"+newTimes[i] 
             	}
             	var min = newTimes[i].substr(3,1)
             	if(min=="0"){
             		newTimes[i] = newTimes[i]+"0"
             	}
             }
             
             // 시간뿌리기
             for(var i=0; i<18; i++){
             	
             	for(var j=0; j<newTimes.length; j++){ 
             		var $label ;
             		if(changeTime==newTimes[j]){ //style="height: 10px;"
             			$label = $("<button type='button'></button>").attr("class","btn btn-warning btn-sm").attr("id",changeTime).attr("style","width:100%;height:100%;border: 2px solid #ced4da;font-size:0.3rem;").attr("disabled","").text(changeTime);  
             			break;
             		} else{
             			$label = $("<button type='button'></button>").attr("class","btn btn-primary btn-sm").attr("id",changeTime).attr("style","width:100%;height:100%;border: 2px solid #ced4da;font-size:0.3rem;").text(changeTime);
             		}
             	} 
           		var $secondLabel = $label.appendTo($(".btn-group-time"))
                var $input = $("<input>").attr("type","checkbox").attr("autocomplete","off").appendTo($secondLabel);
     			
           		if(splitMinTime=="00"){
             		splitMinTime = "30";
             	} else if(splitMinTime=="30"){
             		splitHourTime = Number(splitHourTime) +1;
             		splitMinTime = "00";
             	} else{
             		console.log("error");
             	}
     			changeTime = splitHourTime+ ":"+splitMinTime;
              }
               
        }
        //변경
       //$("<div style='width:100%;height:100%'></div>").html("<p>9&emsp;&emsp;10&emsp;&emsp;11&emsp;&emsp;12&emsp;&emsp;13&emsp;&emsp;14&emsp;&emsp;15&emsp;&emsp;16&emsp;&emsp;17&emsp;&emsp;18</p>").appendTo($(".bs-component"))
        drawTime();
        new Swiper('.swiper-container', {

        	// 자동높이 사용여부 : 사용하지 않을시 기본값은 false
        	autoHeight : true,

        	loop : true, // 슬라이드 반복
        	
        });
        ///////////////////////////////////////////////////////////////////////
   
        $('#resStartDate').val(resStartDate);
        $('#resMrName').val(sessionStorage.getItem("mrName"));
        $('#mrId').val(sessionStorage.getItem("mrId"));
        $('#resDate').val(today);
        $.ajax({
            url:"/meeting/users/getCurrentId",
            method :"post",
            data : "_csrf=${_csrf.token}",
            success : function(data){
               var emp = data;
               $('#empId').val(emp.empId);
               $('#resName').val(emp.empName);
            }
         });
        $("#resEndDate").blur(function() {
        	/*  
            var resStartDateArr = $('#resStartDate').val();
        	var startDateArr = resStartDateArr.split('/');
        	
            var resEndDateArr = $('#resEndDate').val();
            var endDateArr = resEndDateArr.split('/');
            
            var startDateCompare = new Date(startDateArr[0], parseInt(startDateArr[1])-1, startDateArr[2].substring(1,2),startDateArr[2].substring(3,5),startDateArr[2].substring(6,8));
            var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2].substring(1,2),endDateArr[2].substring(3,5),endDateArr[2].substring(6,8));

            if(startDateCompare > endDateCompare) {            
                console.log("시작날짜와 종료날짜를 확인해 주세요.");  
                $('#resEndDate').val("");
            }else if(((endDateArr[2].substring(3,5))-(startDateArr[2].substring(3,5))) >= 8)
           		console.log("장기")
           	 */
           	var startTime = $("#resStartDate").val();
           	if(startTime.includes("/")){
           		var startMonth = Number( ($("#resStartDate").val().split("/")[1]));
                var endMonth = Number( ($("#resEndDate").val().split("/")[1]));
                var start = Number( ($("#resStartDate").val().split("/")[2]).split(" ")[0] );
                var end = Number( ($("#resEndDate").val().split("/")[2]).split(" ")[0] );
           	} else{
           		var startMonth = Number( ($("#resStartDate").val().split("-")[1]));
                var endMonth = Number( ($("#resEndDate").val().split("/")[1]));
                var start = Number( ($("#resStartDate").val().split("-")[2]).split(" ")[0] );
                var end = Number( ($("#resEndDate").val().split("/")[2]).split(" ")[0] );
                	
           	}
            var longtime = end - start;
            if( endMonth > startMonth ){
            	longtime =1;
            }
            
           	if(longtime >= 1){
           		alert("장기예약입니다. \n(장기예약은 상위관리자의 승인이 필요합니다.)")
           		$("<input>").attr("type","hidden").attr("value","res_0").attr("name","resState").appendTo($("#resForm"));
           	} else if(longtime >= 0 && longtime < 1 ){
           		$("<input>").attr("type","hidden").attr("value","res_1").attr("name","resState").appendTo($("#resForm"));
           	} else if(longtime < 0){
           		alert("시작시간보다 뒤의 날짜를 선택하세요")
           		$("#resEndDate").val("");
           	}
           	
           	/////////////////////////////////////////////cost계산
           	var t1 = $("#resStartDate").val();
           	var t2 = $("#resEndDate").val();
           	
           	
        });
        
        
        //////////////////////////////////////////////////////////////////////////////
  		$("<input>").attr("type","hidden").attr("id","startTime").attr("name","resStartDate").attr("value",sessionStorage.getItem("currentDate")).appendTo($("#resForm"));
        $('#resStartDate').datetimepicker({
        	onSelectDate: function(data) {
        		$("#startTime").val(JSON.stringify(data));
        		timeAJAX(data);
        	}
        });
        $('#resEndDate').datetimepicker({
        	onSelectDate: function(data) {
				$("<input>").attr("type","hidden").attr("name","resEndDate").attr("value",JSON.stringify(data)).appendTo($("#resForm"));
        		timeAJAX(data);
        	}
    	});
        
        function timeAJAX(data){
        	var mrId = sessionStorage.getItem("mrId");
    		
    		var availableDate = JSON.stringify(data);
    		$.ajax({
    			url:"/meeting/reservation/available/"+mrId+"/"+availableDate,
    			type:"post",
    			data : "_csrf=${_csrf.token}",
    			success:function(data){
    				
    				var resultDate = JSON.parse(data)
                    var wantDate = new Array() ;
                    var count = 0;
                    
                    for(var i=0; i<resultDate.length; i++){
                      var calcDate = resultDate[i];
                       
                      for(var j=0; j<calcDate.length; j++){
                          wantDate[count] = calcDate[j];
                          count++;
                      }
                    }
              
    				sessionStorage.setItem("availTime", wantDate);
    				drawTime();
    			}
    		})
        }
    });
</script>
