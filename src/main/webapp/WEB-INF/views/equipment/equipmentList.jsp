<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<main class="app-content">
    <div class="app-title">
        <div>
            <h1>
                <i class="fa fa-calendar"></i>기자재관리</h1>
            <p>
                기자재 목록
            </p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item">
                <i class="fa fa-home fa-lg"></i>
            </li>
            <li class="breadcrumb-item">
                <a href="#">회의실관리</a>
            </li>
            <li class="breadcrumb-item">
                <a href="#">지사관리</a>
            </li>
        </ul>
    </div>
    <div style="text-align:right;">
        <a class="btn btn-primary btn-sm" href="/meeting/meetingRoom/create">기자재 추가</a>
    </div>

    <!--  modal start -->
                <div class="modal fade" id="confirm" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" style="text-align:center;">정말로 삭제하시겠습니까?</h4>
                                <button type="button" class="close" data-dismiss="modal">×</button>
                            </div>
                            <div class="modal-body">
                                <div class="modal-footer" style="margin-top:20px">
                                    <div class="row mb-10">
                                        <div class="col-md-12">

                                            <form action="/meeting/equipment/delete" method="POST" id="equipmentBranch">
 
                                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                                <input type="hidden" name="brId" id="hiddenBrId">
                                                <button class="btn btn-success" id="finallyConfirm" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>확인</button>
                                                <button class="btn btn-success" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>취소</button>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- modal end -->
<div class="row">
    <div class="col-md-12">
          <div class="tile">
            <div class="tile-body">
              <table class="table table-hover table-bordered" id="sampleTable">
                <thead>
                  <tr>
                    <th>Name</th>
                    <th>Position</th>
                    <th>Office</th>
                    <th>Age</th>
                    <th>Start date</th>
                    <th>Salary</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>Tiger Nixon</td>
                    <td>System Architect</td>
                    <td>Edinburgh</td>
                    <td>61</td>
                    <td>2011/04/25</td>
                    <td>$320,800</td>
                  </tr>


                </tbody>
              </table>
            </div>
          </div>
        </div>
        </div>
</main>
<script src="/meeting/resources/js/datatables/jquery.dataTables.js"></script>
<script src="/meeting/resources/js/datatables/dataTables.bootstrap4.js"></script>
<script src="/meeting/resources/js/plugins/sb-admin-datatables.min.js"></script>
    <script type="text/javascript">$('#sampleTable').DataTable();</script>