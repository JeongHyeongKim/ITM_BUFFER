<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/meeting/resources/css/fullcalendar.min.css" rel="stylesheet" />
<link href="/meeting/resources/css/fullcalendar.print.min.css" rel="stylesheet" media="print" />
<main class="app-content">
	<div class="app-title">
        <div>
          <h1><i class="fa fa-calendar"></i> GS ITM 회의실 예약 관리 시스템</h1>
          <p>지사를 선택한 뒤, 회의실 예약 현황을 확인하세요</p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">
        	<div class="tile row">
        		<div class="row">
	        		<div class="col-md-4">
		        		<select name="job" class="form-control">
						    <option value="" selected>직업선택</option>
						    <option value="학생">학생</option>
						    <option value="회사원">회사원</option>
						    <option value="기타">기타</option>
						</select>
					</div>
				</div>
        	</div>	
          	<div class="tile row">
            	<div class="col-md-3">
                	<h4 class="mb-4">지사 선택</h4>
                	<c:forEach items="${branchList }" var="branchList">
                		<div class="fc-event">${branchList.brName }</div>
                	</c:forEach>
                	<p class="animated-checkbox mt-20">
	                  <label>
	                    <span class="label-text">회의실 바로 예약하기</span>
	                  </label>
	                </p>
                	<!-- <button class="btn btn-warning" type="button" data-toggle="modal" onclick="">회의실 바로 예약하기</button> -->
            	 </div>
            	 <div class="col-md-9">
	              <div id="calendar"></div>
	            </div>
          	</div>
        </div>
    </div>
</main>
<!-- Essential javascripts for application to work-->
<!-- Page specific javascripts-->
<script src="/meeting/resources/js/moment.min.js" type="text/javascript"></script>
<script src="/meeting/resources/js/fullcalendar.min.js" type="text/javascript"></script>
<script src="/meeting/resources/js/jquery-ui.min.js" type="text/javascript"></script>
<!-- PAGE LEVEL SCRIPTS-->
<script src="/meeting/resources/js/calendar-demo.js" type="text/javascript"></script>

