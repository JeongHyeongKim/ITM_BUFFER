<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<main class="app-content">
<div class="app-title">
	<div>
		<h1><i class="fa fa-calendar"></i>예약이력</h1>
		<p>
			회의실 예약 전체 현황 목록입니다.
		</p>
	</div>
	<ul class="app-breadcrumb breadcrumb">
		<li class="breadcrumb-item">
		<i class="fa fa-home fa-lg"></i>
		</li>
		<li class="breadcrumb-item">
		<a href="#">예약이력</a>
		</li>
		<li class="breadcrumb-item">
		<a href="#">예약현황</a>
		</li>
	</ul>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="tile">
			<div class="tile-body">
				<div class="bs-component" style="margin-bottom: 15px;">
					<div class="btn-group btn-group-toggle" data-toggle="buttons">
						<label class="btn btn-primary active">
						<input id="weekList" type="radio" name="listPeriod" autocomplete="off" checked="">일주일 </label>
						<label class="btn btn-primary">
						<input id="monthList" type="radio" name="listPeriod" autocomplete="off"> 1개월 </label>
						<label class="btn btn-primary">
						<input id="6monthList" type="radio" name="listPeriod" autocomplete="off"> 6개월 </label>
						<label class="btn btn-primary">
						<input id="yearList" type="radio" name="listPeriod" autocomplete="off"> 1년 </label>
						<label class="btn btn-primary">
						<input id="allOfList" type="radio" name="listPeriod" autocomplete="off"> 전체 </label>
					</div>
				</div>
				<div class="bs-component" style="margin-bottom: 15px;">
					<div class="btn-group btn-group-toggle" data-toggle="buttons">
						<c:forEach items="${branchList}" var="branchList" varStatus="status">
							<c:if test="${status.first }">
								<label class="btn btn-primary active" >
								<input id=" ${branchList.brId}" type="radio" name="branch" autocomplete="off" checked="checked"> ${branchList.brName}
							</label>
							</c:if>
							<c:if test="${!status.first }">
								<label class="btn btn-primary" >
								<input id=" ${branchList.brId}" type="radio" name="branch" autocomplete="off"> ${branchList.brName}
							</label>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<!-- Example DataTables Card-->
			      <div class="card mb-3">
			        <div class="card-header">
			          <i class="fa fa-table"></i>회의실 예약 현황</div>
			        <div class="card-body">
			          <div class="table-responsive">
			            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			              <thead>
							<tr>
								<th>
									예약일
								</th>
								<th>
									사용시작일
								</th>
								<th>
									사용종료일
								</th>
								<th>
									신청자명
								</th>
								<th>
									장소
								</th>
								<th>
									회의목적
								</th>
								<th>
									회의구분
								</th>
								<th>
									참석인원
								</th>
								<th>
									기자재
								</th>
								<th>
									간식
								</th>
								<th>
									전달사항
								</th>
								<th>
									상태
								</th>
								<th>
									관리
								</th>
			
							</tr>
							</thead>
							<tbody>
							
							<tr>
								<td>
									Dai Rios
								</td>
								<td>
									Personnel Lead
								</td>
								<td>
									Edinburgh
								</td>
								<td>
									35
								</td>
								<td>
									2012/09/26
								</td>
								<td>
									$217,500
								</td>
								<td>
									Tiger Nixon
								</td>
								<td>
									System Architect
								</td>
								<td>
									Edinburgh
								</td>
								<td>
									61
								</td>
								<td>
									2011/04/25
								</td>
								<td>
									$320,800
								</td>
								<td>
									$320,800
								</td>
							</tr>
							</tbody>
			            </table>
			          </div>
			        </div>
			        <div class="card-footer small text-muted"></div>
			      </div>
			</div>
		</div>
	</div>
</div>
</main>
<script src="/meeting/resources/js/datatables/jquery.dataTables.js"></script>
<script src="/meeting/resources/js/datatables/dataTables.bootstrap4.js"></script>
<script src="/meeting/resources/js/plugins/sb-admin-datatables.min.js"></script>