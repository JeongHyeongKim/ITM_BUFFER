<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    $(function() {

        var branch = JSON.parse('${branch}');


        var brId = null;
        var name = null;
        var address = null;
        var tel = null;
        var img = null;
        var imgChanged = false;
        console.log(branch.brImg);


        document.getElementById("brName").value = branch.brName;
        document.getElementById("brAddress").value = branch.brLocation;
        document.getElementById("brTel").value = branch.brTel;
        document.getElementById("imgArea").src = branch.brImg;
        document.getElementById("brId").value = branch.brId;

        
        $('#imgArea').attr('height', $("#rightCol").height() * 0.6);
        $('#imgArea').attr("width", $("#leftCol").width() * 0.8);
        $('#leftCol').css("height", $("#rightCol").height() * 0.9);

        $(window).resize(function() {
        	$('#imgArea').attr('height', $("#rightCol").height() * 0.6);
            $('#imgArea').attr("width", $("#leftCol").width() * 0.8);
            $('#leftCol').css("height", $("#rightCol").height() * 0.9);

        });


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
        $("#imgUpload").change(function() {
            if (this.files && this.files[0]) {
                var reader = new FileReader();

                reader.onload = function(e) {
                    $('#imgArea').attr('src', e.target.result);
                    $('#imgArea').attr('height', $("#rightCol").height() * 0.6);
                    $('#imgArea').attr("width", $("#leftCol").width() * 0.8);
                }
                reader.readAsDataURL(this.files[0]);
            }
        });

    });
</script>

<style>
    .form-group {
        padding-top: 10px;
        padding-bottom: 10px;
    }


    .upload-wrapper {
        position: relative;
        overflow: hidden;
        display: inline-block;
    }

    .upload-btn {

        color: white;
        background-color: #009688;
        padding: 8px 20px;
        border-radius: 8px;
        font-size: 15px;
        font-weight: bold;
    }

    .upload-wrapper input[type="file"] {

        font-size: 100px;
        position: absolute;
        left: 0;
        top: 0;
        opacity: 0;
    }
</style>
</head>

<body>
    <main class="app-content">
        <div class="app-title">
            <div>
                <h1>
                    <i class="fa fa-calendar"></i>지사관리</h1>
                <p>
                    지사를 수정합니다.
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
            <div class="row" id="mainArea">
                <input type="hidden" name="brId" id="brId">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <div class="col-md-4">
                    <div class="tile" id="leftCol">

                        <div class="tile-body" style="text-align:center;">
                            <img class="user-img" id="imgArea" src="/meeting/resources/img/imgVoid.JPG" style="border-radius: 10px; margin-bottom:20px">

                        </div>

                        <div class="tile-footer" style="text-align:right; vertical-align:bottom;">
                            <div class="upload-wrapper">
                                <button class="upload-btn" >업로드</button>
                                <input type="file" id="imgUpload" name="brImg">
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-md-8">
                    <div class="tile" id="rightCol">
                        <h3 class="tile-title" style="padding-bottom:10px; border-bottom:1px solid #ddd">지사 정보를 입력하여 주십시오</h3>
                        <div class="tile-body">
                            <div class="form-group">
                                <label class="control-label">
                                    <h5>지사 이름</h5>
                                </label>
                                <input class="form-control" type="text" placeholder="지사를 입력해주세요" id="brName" name="brName">
                            </div>
                            <div class="form-group">
                                <label class="control-label">
                                    <h5>지사 주소</h5>
                                </label>
                                <input class="form-control" type="text" placeholder="주소를 입력해주세요" id="brAddress" name="brLocation">
                            </div>
                            <div class="form-group">
                                <label class="control-label">
                                    <h5>대표 번호</h5>
                                </label>
                                <input class="form-control" placeholder="대표번호를 입력해주세요" id="brTel" name="brTel"></input>
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
                        <div class="tile-footer">
                            <div style="text-align:right">
                                <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#confirm" id="modalOpen"><i class="fa fa-fw fa-lg fa-check-circle"></i>확인</button>
                                <a class="btn btn-secondary" href="/meeting/branch/list"><i class="fa fa-fw fa-lg fa-times-circle"></i>취소</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>