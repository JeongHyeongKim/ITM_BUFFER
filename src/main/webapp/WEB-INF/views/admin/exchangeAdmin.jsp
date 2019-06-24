<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <link rel="stylesheet" href="/meeting/resources/css/duallistbox/bootstrap-duallistbox.min.css">
<main class="app-content">
	<div class="app-title">
		<div>
			<h1><i class="fa fa-calendar"></i>관리자 권한 관리</h1>
			<p>
				관리자 권한을 수정합니다.
			</p>
		</div>
		<ul class="app-breadcrumb breadcrumb">
			<li class="breadcrumb-item">
			<i class="fa fa-home fa-lg"></i>
			</li>
			<li class="breadcrumb-item">
			<a href="#">관리자 권한 관리</a>
			</li>
		</ul>
	</div>
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="tile" >
                        <div class="sparkline10-list">
                            <div class="sparkline10-hd">
                                <div class="main-sparkline10-hd">
                                    <h1>관리자 권한 관리</h1>
                                </div>
                            </div>
                            <div class="sparkline10-graph">
                                <div class="basic-login-form-ad">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="dual-list-box-inner">
                                                <form id="form" action="/meeting/recognition/changeAuth" method="post" class="wizard-big">
                                                    <select class="form-control dual_select" id="empList" name="empList" multiple >
														<c:forEach var="list" items="${empAuthority}">
															<c:choose>
																<c:when test="${list.authority eq 'ROLE_ADMIN'}">
																<option value=${list.empId } selected>${list.empName} - ${list.deptName}</option>
																</c:when>
																<c:otherwise>
																<option value=${list.empId } >${list.empName} - ${list.deptName}</option>	
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</select>
													<input type="hidden" name="_csrf" value="${_csrf.token }">
													<br>
													<button class="btn btn-primary">수정</button>
                                                </form>
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
</main>
<script src="/meeting/resources/js/duallistbox/jquery.bootstrap-duallistbox.js"></script>
<script src="/meeting/resources/js/duallistbox/duallistbox.active.js"></script>
<script>
	$(function(){
		
	})
</script>