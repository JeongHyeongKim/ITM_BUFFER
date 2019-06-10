<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<main class="app-content">
    <div class="app-title">
        <div>
            <h1>
                <i class="fa fa-calendar"></i>검색 결과</h1>
            <p>검색결과를 확인하세요</p>
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
    <div class="row user">
        <div class="col-md-3">
            <div class="tile p-0">
                <div class="tab-content">
	                <!-- 회의실 정보 -->
	                <c:forEach items='${search}' var="search">
	                    ${search.mrImg }
	                </c:forEach>
                </div>
            </div>
        </div>
    </div>
</main>
