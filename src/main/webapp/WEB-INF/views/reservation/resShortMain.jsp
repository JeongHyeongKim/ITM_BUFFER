<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<main class="app-content">
    <div class="app-title">
        <div>
            <h1>
                <i class="fa fa-calendar"></i>ȸ�ǽ� ����</h1>
            <p>���縦 ������ ��, ȸ�ǽ��� Ȯ���ϼ���</p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item">
                <i class="fa fa-home fa-lg"></i>
            </li>
            <li class="breadcrumb-item">
                <a href="/meeting/reservation/resShortMain/br_0001">ȸ�ǽ� ����</a>
            </li>
        </ul>
    </div>
    <div class="row user">
        <div class="col-md-3">
            <div class="tile p-0">
                <ul class="nav flex-column nav-tabs user-tabs">
                    <li class="nav-item">
                        <a class="nav-link">���� ����</a>
                    </li>
                    <c:forEach items="${branchList}" var="branchList">
                        <li class="nav-item">
                            <a class="nav-link" href="/meeting/reservation/resShortMain/${branchList.brId}" id="${branchList.brId}">${branchList.brName}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="col-md-9">
            <div class="tab-content">
                <!-- ȸ�ǽ� ���� -->
                <c:forEach items='${resShortMain}' var="resShortList">
                    <input id="mrName${resShortList.mrName }" type="hidden" value="${resShortList.mrName }">
                    <input id="mrId" type="hidden" value="${resShortList.mrId }">
                    <input id="brName" type="hidden" value="${resShortList.brName }">
                        <div class="tab-pane active meeting-room" id="${resShortList.mrId}" data-mrName="${resShortList.mrName }">
                        <!-- href = location.href='/meeting/reservation/resShortDetail/${resShortList.mrId} -->
                        	
                            <div class="card">
                                <h4 class="card-header">${resShortList.mrName }</h4>
                                <div class="card-body">
                                    <h5 class="card-title">${resShortList.brLocation } ${resShortList.mrLocation }</h5>
                                    <h6 class="card-subtitle text-muted">
                                        <b>������</b>
                                        ${resShortList.empName}</h6>
                                </div>
                                <img alt="Card image" src="${resShortList.mrImg }" style="height: 200px; width: 100%; display: block;">
                                    <div class="card-body">
                                        <p class="card-text">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <b>��������</b>
                                                    </td>
                                                    <c:if test="${resShortList.mrType eq 'mr_type_0'}">
                                                        <td>ȸ�ǽ�</td>
                                                    </c:if>
                                                    <c:if test="${resShortList.mrType eq 'mr_type_1'}">
                                                        <td>��ȸ�ǽ�</td>
                                                    </c:if>
                                                    <c:if test="${resShortList.mrType eq 'mr_type_2'}">
                                                        <td>������</td>
                                                    </c:if>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <b>����ð�</b>
                                                    </td>
                                                    <td>�ּ� 30�к���</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <b>�����ο�</b>
                                                    </td>
                                                    <td>${resShortList.mrLimit }��</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <b>������</b>
                                                    </td>
                                                    <td>${resShortList.empName }</td>
                                                </tr>
                                            </table>
                                        </p>
                                        <c:set value="${resShortList.eqId}" var="eqId"/>
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
        <script>
            
            $(document).ready(function() { 
            	
            	var btnClassClick = function(e){
            	    
            	    var mrName = "#"+e.currentTarget.id;
            	    console.log($("#mrNameī����").val());
            	   
            	    window.sessionStorage.setItem("mrName",$('#mrName').val());
            		window.sessionStorage.setItem("brName",$('#brName').val());
            		window.sessionStorage.setItem("mrId",e.currentTarget.id);
            		
            	}

            	$('.meeting-room').on('click', btnClassClick);
            	
            	$.ajax({
                    url:"/meeting/users/getCurrentId",
                    method :"post",
                    data : "_csrf=${_csrf.token}",
                    success : function(data){
                       var emp = data
                       console.log(emp);
                       window.sessionStorage.setItem("empName",emp.empName);

                    }
                 });
            });
            
        </script>