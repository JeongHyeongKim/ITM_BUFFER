<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<main class="app-content">
<div class="app-title">
	<div>
		<h1><i class="fa fa-calendar"></i>예약이력</h1>
		<p>
			승인 대기 목록입니다.
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
		<a href="#">승인대기</a>
		</li>
	</ul>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="tile">
			<div class="tile-body">
				<div class="row" >
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
				</div>
				<div class="row">
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
				</div>
				<table class="table table-hover table-bordered" id="sampleTable">
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
				<tr>
					<td>
						Garrett Winters
					</td>
					<td>
						Accountant
					</td>
					<td>
						Tokyo
					</td>
					<td>
						63
					</td>
					<td>
						2011/07/25
					</td>
					<td>
						$170,750
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
				<tr>
					<td>
						Ashton Cox
					</td>
					<td>
						Junior Technical Author
					</td>
					<td>
						San Francisco
					</td>
					<td>
						66
					</td>
					<td>
						2009/01/12
					</td>
					<td>
						$86,000
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
				<tr>
					<td>
						Cedric Kelly
					</td>
					<td>
						Senior Javascript Developer
					</td>
					<td>
						Edinburgh
					</td>
					<td>
						22
					</td>
					<td>
						2012/03/29
					</td>
					<td>
						$433,060
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
				<tr>
					<td>
						Airi Satou
					</td>
					<td>
						Accountant
					</td>
					<td>
						Tokyo
					</td>
					<td>
						33
					</td>
					<td>
						2008/11/28
					</td>
					<td>
						$162,700
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
				<tr>
					<td>
						Brielle Williamson
					</td>
					<td>
						Integration Specialist
					</td>
					<td>
						New York
					</td>
					<td>
						61
					</td>
					<td>
						2012/12/02
					</td>
					<td>
						$372,000
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
				<tr>
					<td>
						Herrod Chandler
					</td>
					<td>
						Sales Assistant
					</td>
					<td>
						San Francisco
					</td>
					<td>
						59
					</td>
					<td>
						2012/08/06
					</td>
					<td>
						$137,500
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
				<tr>
					<td>
						Rhona Davidson
					</td>
					<td>
						Integration Specialist
					</td>
					<td>
						Tokyo
					</td>
					<td>
						55
					</td>
					<td>
						2010/10/14
					</td>
					<td>
						$327,900
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
				<tr>
					<td>
						Colleen Hurst
					</td>
					<td>
						Javascript Developer
					</td>
					<td>
						San Francisco
					</td>
					<td>
						39
					</td>
					<td>
						2009/09/15
					</td>
					<td>
						$205,500
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
				<tr>
					<td>
						Sonya Frost
					</td>
					<td>
						Software Engineer
					</td>
					<td>
						Edinburgh
					</td>
					<td>
						23
					</td>
					<td>
						2008/12/13
					</td>
					<td>
						$103,600
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
				<tr>
					<td>
						Jena Gaines
					</td>
					<td>
						Office Manager
					</td>
					<td>
						London
					</td>
					<td>
						30
					</td>
					<td>
						2008/12/19
					</td>
					<td>
						$90,560
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
				<tr>
					<td>
						Quinn Flynn
					</td>
					<td>
						Support Lead
					</td>
					<td>
						Edinburgh
					</td>
					<td>
						22
					</td>
					<td>
						2013/03/03
					</td>
					<td>
						$342,000
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
				<tr>
					<td>
						Charde Marshall
					</td>
					<td>
						Regional Director
					</td>
					<td>
						San Francisco
					</td>
					<td>
						36
					</td>
					<td>
						2008/10/16
					</td>
					<td>
						$470,600
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
				<tr>
					<td>
						Haley Kennedy
					</td>
					<td>
						Senior Marketing Designer
					</td>
					<td>
						London
					</td>
					<td>
						43
					</td>
					<td>
						2012/12/18
					</td>
					<td>
						$313,500
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
				<tr>
					<td>
						Tatyana Fitzpatrick
					</td>
					<td>
						Regional Director
					</td>
					<td>
						London
					</td>
					<td>
						19
					</td>
					<td>
						2010/03/17
					</td>
					<td>
						$385,750
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
				<tr>
					<td>
						Michael Silva
					</td>
					<td>
						Marketing Designer
					</td>
					<td>
						London
					</td>
					<td>
						66
					</td>
					<td>
						2012/11/27
					</td>
					<td>
						$198,500
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
				<tr>
					<td>
						Paul Byrd
					</td>
					<td>
						Chief Financial Officer (CFO)
					</td>
					<td>
						New York
					</td>
					<td>
						64
					</td>
					<td>
						2010/06/09
					</td>
					<td>
						$725,000
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
				<tr>
					<td>
						Gloria Little
					</td>
					<td>
						Systems Administrator
					</td>
					<td>
						New York
					</td>
					<td>
						59
					</td>
					<td>
						2009/04/10
					</td>
					<td>
						$237,500
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
				<tr>
					<td>
						Bradley Greer
					</td>
					<td>
						Software Engineer
					</td>
					<td>
						London
					</td>
					<td>
						41
					</td>
					<td>
						2012/10/13
					</td>
					<td>
						$132,000
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
				<tr>
					<td>
						Jenette Caldwell
					</td>
					<td>
						Development Lead
					</td>
					<td>
						New York
					</td>
					<td>
						30
					</td>
					<td>
						2011/09/03
					</td>
					<td>
						$345,000
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
	</div>
</div>
</main>
<script type="text/javascript" src="/meeting/resources/js/plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/meeting/resources/js/plugins/dataTables.bootstrap.min.js"></script>
 <script type="text/javascript">$('#sampleTable').DataTable();</script>