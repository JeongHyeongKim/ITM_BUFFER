<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                                                <form id="form" action="#" class="wizard-big">
                                                    <select class="form-control dual_select" multiple>
															<option value="United States">United States</option>
															<option value="United Kingdom">United Kingdom</option>
															<option value="Australia">Australia</option>
															<option selected value="Austria">Austria</option>
															<option selected value="Bahamas">Bahamas</option>
															<option value="Barbados">Barbados</option>
															<option value="Belgium">Belgium</option>
															<option value="Bermuda">Bermuda</option>
															<option value="Brazil">Brazil</option>
															<option value="Bulgaria">Bulgaria</option>
															<option value="Cameroon">Cameroon</option>
															<option value="Canada">Canada</option>
														</select>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tile-footer" >
			            	<div>
			              		<button class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>확인</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#"><i class="fa fa-fw fa-lg fa-times-circle"></i>취소</a>
			            	</div>
			            </div>
                 </div>
            </div>
	</div>
</main>
<script src="/meeting/resources/js/duallistbox/jquery.bootstrap-duallistbox.js"></script>
<script src="/meeting/resources/js/duallistbox/duallistbox.active.js"></script>