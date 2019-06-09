<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

    <style>
        .filebox label {
            display: inline-block;
            padding: .5em .75em;
            color: #FFF;
            line-height: normal;
            vertical-align: middle;
            cursor: pointer;
            border: 1px solid #ebebeb;
            border-bottom-color: #e2e2e2;
            border-radius: .25em;

        }

        .filebox input[type="file"] {
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip: rect(0, 0, 0, 0);
            border: 0;
        }

        .meetingRoomList {
            display: block;
            width: 100%;
            padding: 0.375rem 0.75rem;
            font-size: 0.875rem;
            line-height: 1.5;
            color: #495057;
            background-color: #FFF;
            background-clip: padding-box;
            border: 2px solid #ced4da;
            border-radius: 4px;
            margin-left: -10px;
            margin-top: -10px;
        }
        
        h5{
            font-family: "Lato", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>지사 수정</title>
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
            //console.log(name);	

			document.getElementById("imgArea").src = branch.brImg;
            document.getElementById("brName").value = branch.brName;
            document.getElementById("brAddress").value = branch.brLocation;
            document.getElementById("brTel").value = branch.brTel;
            document.getElementById("brId").value = branch.brId;
            
            
            $('#modalOpen').click(function(){
            	name=document.getElementById("brName").value;
                address=document.getElementById("brAddress").value;
                tel=document.getElementById("brTel").value;
            	
            	document.getElementById("modalBranchName").innerHTML=name
            	document.getElementById("modalBranchLocation").innerHTML=address
            	document.getElementById("modalBranchTel").innerHTML=tel
            })
            
            $('#finallyConfirm').click(function(){
                $('#branchDataUpdate').submit();
            });
            /* $("#imgUpload").change(function(){
        		if(this.files && this.files[0]){
        			var reader = new FileReader();
        			
        			reader.onload = function(e){
        				$('#imgArea').attr('src', e.target.result);
        				$('#imgArea').attr('height', '235px');
        				$('#imgArea').attr('width', '235px');
        			}
        			reader.readAsDataURL(this.files[0]);
        		}
        	}); */

        });
        //파일이 바뀌지 않을 경우는 기존에 있던 것을 그대로 써야하고, 바뀌면 바뀐 것으로 돌아가야 한다. 이를 참고하여 코드를 짜보자.
        //파일 안바뀌면 fileuploader를 안거치고 그대로 db에 들어가고, 바뀌면 거친다.
        //현재 input tag가 있는데 클릭해도 file input dialog가 안뜬다. 이유가 뭘까?
        
        
    </script>
</head>

<body>
    <main class="app-content">
        <div class="app-title">
            <div>
                <h1>회의실/교육실 관리</h1>
                <p>>지사관리</p>
            </div>
            <ul class="app-breadcrumb breadcrumb">
                <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i>회의실 교육실 관리 / 지사관리</li>
            </ul>
        </div>

        <form action="/meeting/branch/update" method="POST" id="branchDataUpdate" enctype="multipart/form-data">
            <div class="row">
                <input type="hidden" name="brId" id="brId">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <div class="col-md-4">
                    <div></div>
                    <div style="text-align:center;">
                        <img class="user-img" id="imgArea" src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/128.jpg" height=235px style="border-radius: 10px;">
                        <div class="filebox" style="text-align:right"> <label style="background-color: #009688; color:#FFF;">업로드</label> <input type="file" id="imgUpload" name="brImg" /> </div>
                    </div>
                </div>


                <div class="col-md-8" style="border-left: 1px solid; padding-left:50px">
                    <div>
                        <div class="tile-body">
                            <div class="form-horizontal">
                                <div class="form-group row" style="padding-top:25px; ">
                                    <label class="control-label" style="padding-top:10px">지사 &nbsp이름</label>
                                    <div class="col-md-8">
                                        <input class="form-control" type="text" placeholder="지사를 입력해주세요" id="brName" name="brName">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label" style="padding-top:10px">지사 &nbsp주소</label>
                                    <div class="col-md-8">
                                        <input class="form-control" placeholder="주소를 입력해주세요" id="brAddress" name="brLocation">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label" style="padding-top:10px">대표 &nbsp번호</label>
                                    <div class="col-md-8">
                                        <input class="form-control" type="text" placeholder="대표번호를 입력해주세요" id="brTel" name="brTel">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="control-label" style="padding-top:10px">회의실목록</label>
                                    <div class="col-md-8" style="padding-top:10px">
                                        <div class="meetingRoomList">
                                            <c:forEach items='${meetingRoomList}' var="meetingRoomList">
                                                ${meetingRoomList.mrName} &nbsp / &nbsp
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="bs-component">
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
				                     <button class="btn btn-success" id="finallyConfirm" type="button"><i class="fa fa-fw fa-lg fa-check-circle" ></i>확인</button>
				                     <button class="btn btn-success"  type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>취소</button>
				                   </div>
				                </div>
					        </div> 
				      </div>
				      </div>
				   </div>
         	     </div>
              <!-- modal end -->
                        <div class="tile-footer">
                            <div class="row">
                                <div class="col-md-8 col-md-offset-3" style="text-align:right">
                                    <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#confirm" id="modalOpen"><i class="fa fa-fw fa-lg fa-check-circle"></i>확인</button>&nbsp;&nbsp;&nbsp;
                                    <a class="btn btn-secondary" href="/meeting/branch/list"><i class="fa fa-fw fa-lg fa-times-circle"></i>취소</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
        </form>
    </main>
</body>

</html>