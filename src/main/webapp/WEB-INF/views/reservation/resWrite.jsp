<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <form class="row" id="resForm" method="POST" action="/meeting/reservation/writeReservation">
                        <input type="hidden" id="empId">
                        <input type="hidden" id="mrId">
                        <input type="hidden" id="resDate">
                        <input type="hidden" id="resState">
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
                            <label class="control-label">참석 인원 명단 <a data-target="#empList" data-toggle="modal">명단등록</a></label>
                            <input class="form-control" type="text">
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">외부인 참석 인원 수</label>
                            <input class="form-control" min="1" type="number">
                        </div>
                        <div class="form-group col-md-3">
                        </div>
                        <div class="form-group col-md-3"> 
                            <label class="control-label">기자재</label>
                            <c:forEach items="${equipList}" var="list">
                            		<div class="animated-checkbox">
		                                <label>
		                                	<c:if test="${list.eqId eq 'N'}">
		                                    	<input name="equip" type="checkbox" value="N"><span class="label-text">노트북</span>
		                                    </c:if>
		                                    <c:if test="${list.eqId eq 'V'}">
		                                    	<input name="equip" type="checkbox" value="V"><span class="label-text">빔 프로젝트</span>
		                                    </c:if>
		                                    <c:if test="${list.eqId eq 'W'}">
		                                    	<input name="equip" type="checkbox" value="W"><span class="label-text">화이트보드</span>
		                                    </c:if>
		                                    <c:if test="${list.eqId eq 'M'}">
		                                    	<input name="equip" type="checkbox" value="V"><span class="label-text">마이크</span>
		                                    </c:if>
		                                </label>
		                            </div>
                            </c:forEach>
                        </div>
                        <div class="form-group col-md-3">
                            <label class="control-label">간식 유무</label>
                            <div class="animated-checkbox">
                                <label>
                                    <input name="resSnack" type="checkbox"><span class="label-text">간식 있음</span>
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
                        <textarea class="form-control" placeholder="기타 전달 사항을 입력해 주십시오" rows="4"></textarea>
                        <div class="form-group col-md-3"></div>
                        <div class="form-group col-md-3"></div>
                        <div class="form-group col-md-3"></div>

					<div class="bs-component" style="margin-bottom: 15px;">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
						
						</div>
					</div>
					
					<div class="form-group col-md-3" style="padding-top:50px;text-align:right">
					<button class="btn btn-warning" type="button" disabled="disabled">Warning</button>
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
		
		 <!-- EmpModal -->
        <div class="modal fade" id="empList" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">참석 명단 작성</h4>
						<button type="button" class="close" data-dismiss="modal">×</button>
					</div>
					<div class="modal-body">
						<form action="/meeting/reservation/writeReservation" method="POST">
							<div class="row mb-4">
							</div>
							<c:forEach items="${empList}"  var="list">
								<div class="row">
									<div class="col-md-7">
										<div class="animated-checkbox">
			                                <label> 
			                                    <input name="empName" type="checkbox"><span class="label-text">${list.empId} / ${list.empName} - ${list.deptName}</span> 
			                                </label>
			                            </div>
			                         </div>
								</div>
							</c:forEach>
							<div class="modal-footer" style="margin-top:20px">
								<div class="row mb-10">
									<div class="col-md-12">
										<input type="submit" class="btn btn-success" data-dismiss="modal" value="작성">
										
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
        
        var now = new Date();

        var year= now.getFullYear();
        var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
        var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
        var hh = now.getHours()>9 ?''+now.getHours() : '0'+now.getHours();
        var min = now.getMinutes()>9 ?''+now.getMinutes() : '0'+now.getMinutes(); 
        var today = year + '/' + mon + '/' + day+" "+hh+":"+min;
		/////////////////////////////////////////////////////////////////////////////////
        var changeTime = "09:00";
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
        console.log(newTimes)
        // 시간뿌리기
        for(var i=0; i<19; i++){
        	
        	for(var j=0; j<newTimes.length; j++){
        		var $label ;
        		if(changeTime==newTimes[j]){ 
        			$label = $("<button></button>").attr("class","btn btn-warning").attr("id",changeTime).attr("disabled","").text(changeTime);
        			break;
        		} else{
        			$label = $("<button></button>").attr("class","btn btn-primary").attr("id",changeTime).text(changeTime);
        		}
        	}
      		var $secondLabel = $label.appendTo($(".btn-group"))
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
        // 예약된시간 disabled
        $(".btn-primary").on("click",function(e){
        	console.log(e.currentTarget.id);
        })
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
        	 
            var resStartDateArr = $('#resStartDate').val();
        	var startDateArr = resStartDateArr.split('/');
        	
            var resEndDateArr = $('#resEndDate').val();
            var endDateArr = resEndDateArr.split('/');
            
            var startDateCompare = new Date(startDateArr[0], parseInt(startDateArr[1])-1, startDateArr[2].substring(1,2),startDateArr[2].substring(3,5),startDateArr[2].substring(6,8));
            var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2].substring(1,2),endDateArr[2].substring(3,5),endDateArr[2].substring(6,8));

           
            if(startDateCompare > endDateCompare) {            
                alert("시작날짜와 종료날짜를 확인해 주세요.");  
                $('#resEndDate').val("");
            }else if(((endDateArr[2].substring(3,5))-(startDateArr[2].substring(3,5))) >= 8)
           		alert("장기예약");
        });
        
    });
</script>
<script type="text/javascript">
    /* $("#sendForm").on("click",function(){
    	 /* sessionStorage.removeAttribute("currentDate"); 
      }) */
    $('#resStartDate').datetimepicker({
    	'step': 30,
    	onSelectDate: function(data) {
    		var mrId = sessionStorage.getItem("mrId");
    		console.log(mrId);
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
    			}
    		})
    	}
    });
    
    $('#resEndDate').datetimepicker({
    	'step': 30,
    	allowTimes:[
    		  '12:00', '13:00', 
    		  '17:00', '17:05', '17:20', '19:00', '20:00'
    		 ]
    	
    	});
    
</script>