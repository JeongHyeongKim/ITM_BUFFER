<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<main class="app-content">
    <div class="app-title">
        <div>
            <h1>
                <i class="fa fa-calendar"></i>검색 결과</h1>
            <p>        	
            	<b>${fn:length(search) }</b>개의 검색 결과가 있습니다.<br>
            	검색 결과를 확인 후, 회의실을 예약하십시오.
            </p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item">
                <i class="fa fa-home fa-lg"></i>
            </li>
           
        </ul>
    </div>
    <div class="row user" style="width:100%;">
        
        <div class="col-md-9" style="display: table-cell;vertical-align: middle;margin: 0 auto;">
            <div class="tab-content">
                <!-- 회의실 정보 -->
                <c:forEach items='${search}' var="search">
                    <input id="mrName" type="hidden" value="${search.mrName }">
                    <input id="mrId" type="hidden" value="${search.mrId }">
                    <input id="brName" type="hidden" value="${search.brName }">
                        <div class="tab-pane active" id="meeting-room" onclick="location.href='/meeting/reservation/resShortDetail/${search.mrId}'">
                            <div class="card">
                                <h4 class="card-header">${search.mrName }</h4>
                                <div class="card-body">
                                    <h5 class="card-title">${search.brLocation } ${search.mrLocation }</h5>
                                    <h6 class="card-subtitle text-muted">
                                        <b>관리자</b>
                                        ${search.empName}</h6>
                                </div>
                                <img alt="Card image" src="${search.mrImg }" style="height: 200px; width: 100%; display: block;">
                                    <div class="card-body">
                                        <p class="card-text">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <b>공간유형</b>
                                                    </td>
                                                    <c:if test="${search.mrType eq 'mr_type_0'}">
                                                        <td>회의실</td>
                                                    </c:if>
                                                    <c:if test="${search.mrType eq 'mr_type_1'}">
                                                        <td>대회의실</td>
                                                    </c:if>
                                                    <c:if test="${search.mrType eq 'mr_type_2'}">
                                                        <td>교육실</td>
                                                    </c:if>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <b>예약시간</b>
                                                    </td>
                                                    <td>최소 30분부터</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <b>수용인원</b>
                                                    </td>
                                                    <td>${search.mrLimit }인</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <b>관리자</b>
                                                    </td>
                                                    <td>${search.empName }</td>
                                                </tr>
                                            </table>
                                        </p>
                                        <c:set value="${search.eqId}" var="eqId"/>
                                        <c:if test="${fn:contains(eqId,'M')}">
                                            <i class="fa fa-fw fa-lg fa-wifi"></i>wifi
                                        </c:if>
                                        <c:if test="${fn:contains(eqId,'N')}">
                                            <i class="fa fa-fw fa-lg fa-laptop"></i>laptop
                                        </c:if>
                                        <c:if test="${fn:contains(eqId,'WB')}">
                                            <i class="fa fa-fw fa-lg fa-edit"></i>White Board
                                        </c:if>
                                        <c:if test="${fn:contains(eqId,'V')}">
                                            <i class="fa fa-fw fa-lg fa-video-camera"></i>Beam project
                                        </c:if>
                                    </div>
                                    <div class="card-footer text-muted"></div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
    </div>
</main>
