<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
        $(function() {

            var branch = JSON.parse('${branch}');
            //var meetingRoomList = JSON.parse('${meetingRoomList}');
            //console.log(branch);
            //console.log(${branch});

            var brId = null;
            var name = null;
            var address = null;
            var tel = null;   
            var img = null;
            var imgChanged=false;
            //console.log(name);	

            /* document.getElementById("imgArea").src = branch.brImg; */
            document.getElementById("brName").value = branch.brName;
            document.getElementById("brAddress").value = branch.brLocation;
            document.getElementById("brTel").value = branch.brTel;
            document.getElementById("brId").value = branch.brId;


            $('#modalOpen').click(function() {
                name = document.getElementById("brName").value;
                address = document.getElementById("brAddress").value;
                tel = document.getElementById("brTel").value;

                document.getElementById("modalBranchName").innerHTML = name
                document.getElementById("modalBranchLocation").innerHTML = address
                document.getElementById("modalBranchTel").innerHTML = tel
            })

            $('#finallyConfirm').click(function() {
                $('#branchDataUpdate').submit();
            });
             $("#imgUpload").change(function(){
        		if(this.files && this.files[0]){
        			var reader = new FileReader();
        			
        			reader.onload = function(e){
        				$('#imgArea').attr('src', e.target.result);
        				$('#imgArea').attr('height', '235px');
        				$('#imgArea').attr('width', '235px');
        			}
        			reader.readAsDataURL(this.files[0]);
        		}
        	}); 

        });
        //파일이 바뀌지 않을 경우는 기존에 있던 것을 그대로 써야하고, 바뀌면 바뀐 것으로 돌아가야 한다. 이를 참고하여 코드를 짜보자.
        
        //1. 파일이 안바뀔 경우 -> fileuploader안거치고 올라갈 때 전부 스트링 값으로 전달한다. -> 
        //2. 파일이 바뀔 경우 -> fileuploader거치고 올라갈 때 
        //파일 안바뀌면 fileuploader를 안거치고 그대로 db에 들어가고, 바뀌면 거친다.
        //현재 input tag가 있는데 클릭해도 file input dialog가 안뜬다. 이유가 뭘까?
    </script>
</head>

<body>
<main class="app-content">
	<div class="app-title">
        <div>
            <h1>
                <i class="fa fa-calendar"></i>지사관리</h1>
            <p>
                지사 정보를 수정합니다.
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

        <form action="/meeting/file/branchUpdate" method="POST" id="branchDataUpdate" enctype="multipart/form-data">
            <div class="row">
                <input type="hidden" name="brId" id="brId">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                	<div class="col-md-12" >      
	          			<div class="tile" > 
			            <h3 class="tile-title">지사 정보를 수정하여 주십시오</h3>
			            <div class="tile-body">
			                <div class="form-group">
			                  <label class="control-label">지사 이름</label>
			                  <input class="form-control" type="text" placeholder="지사를 입력해주세요" id="brName" name="brName"> 
			                </div>
			                <div class="form-group">
			                  <label class="control-label">지사 주소</label>
			                  <input class="form-control" type="text" placeholder="주소를 입력해주세요" id="brAddress" name="brLocation">
			                </div>
			                <div class="form-group">
			                  <label class="control-label">대표 번호</label>
			                  <textarea class="form-control" placeholder="대표번호를 입력해주세요" id="brTel" name="brTel"></textarea>
			                </div>
			                <div class="form-group">
		                       <label class="control-label" >회의실목록</label>
		                    		<div class="meetingRoomList">
		                                <c:forEach items='${meetingRoomList}' var="meetingRoomList">
		                                    ${meetingRoomList.mrName} &nbsp / &nbsp
		                                 </c:forEach>
		                             </div>
							</div>
			                <div class="form-group">
			                  <label class="control-label">지사 사진</label>
			                  <input class="form-control" type="file" id="imgUpload" name="brImg">
			                </div>
			            </div>
			            
			            <!--  modal start -->
                            <div class="modal fade" id="confirm" role="dialog">
                                <div class="modal-dialog">
                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title" style="text-align:center;">아래 내용이 맞습니까?</h4>
                                            <button type="button" class="close" data-dismiss="modal">×</button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row mb-4">
                                                <div class="col-md-4">
                                                    <label>지사 이름</label>
                                                    <h5 id="modalBranchName"></h5>
                                                </div>
                                            </div>
                                            <div class="row mb-4">
                                                <div class="col-md-4">
                                                    <label>지사 주소</label>
                                                    <h5 id="modalBranchLocation"></h5>
                                                </div>
                                            </div>
                                            <div class="row mb-4">
                                                <div class="col-md-4">
                                                    <label>대표 번호</label>
                                                    <h5 id="modalBranchTel"></h5>
                                                </div>
                                            </div>
                                            <div class="modal-footer" style="margin-top:20px">
                                                <div class="row mb-10">
                                                    <div class="col-md-12">
                                                        <button class="btn btn-success" id="finallyConfirm" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>확인</button>
                                                        <button class="btn btn-success" type="button" data-dismiss="modal"><i class="fa fa-fw fa-lg fa-check-circle"></i>취소</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- modal end -->
			            <div class="tile-footer" >
			            	<div>
	            		<button class="btn btn-primary" type="button"data-toggle="modal" data-target="#confirm" id="modalOpen"><i class="fa fa-fw fa-lg fa-check-circle"></i>확인</button>
                        <a class="btn btn-secondary" href="/meeting/branch/list"><i class="fa fa-fw fa-lg fa-times-circle"></i>취소</a>
	              	</div>
	            </div>
	          </div> 
	        </div>
        </form>
    </main>