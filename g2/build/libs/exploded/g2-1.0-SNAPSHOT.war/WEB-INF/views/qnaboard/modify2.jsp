<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../includes/header.jsp" %>

<head>
    <meta charset="UTF-8">
    <title>Summernote</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <title>G-Street - Q&A수정</title>
</head>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>🌍G-Street Q&A</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">거래게시판</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <!-- left column -->
                <div class="col-md-12">
                    <!-- general form elements -->
                    <div class="card card-maroon ">
                        <div class="card-header">
                            <h2 class="card-title">Q&A 글 수정</h2>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form id="form">
                            <div class="card-body">
                                <div class="form-group">
                                    <label>글번호</label>
                                    <input name="qno" class="form-control"
                                           value="<c:out value="${qnaBoardDTO.qno}"></c:out>" readonly="readonly">
                                </div>
                                <div class="form-group">
                                    <label>제목</label>
                                    <input type="text" name="qtitle" class="form-control"
                                           value="<c:out value="${qnaBoardDTO.qtitle}"></c:out>">
                                </div>

                                <div class="form-group">
                                    <label>내용</label>
                                    <textarea id="summernote" name="qcontent" class="form-control" rows="10"><c:out value="${qnaBoardDTO.qcontent}"></c:out> </textarea>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail12">작성자</label>
                                    <input type="text" name="qwriter" class="form-control" id="exampleInputEmail12"
                                           readonly value="<sec:authentication property="principal.userID"/>">
                                </div>
                            </div>
                            <!— /.card-body —>
                            <div class="temp"></div>

                            <div class="card-footer float-right">
                                <button type="submit" class="btn btn-primary btnList">목록</button>
                                <button type="submit" class="btn btn-warning btnMod">수정</button>
                                <button type="submit" class="btn btn-warning btnDel">삭제</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<%@include file="../includes/footer.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script>
    $(document).ready(function () {
        $('#summernote').summernote({
            placeholder: '판매하고 싶은 상품과 배송 위치를 정확하게 입력해 주세요.',
            tabsize: 2,
            height: 300,
            toolbar: [
                ['fontname', ['fontname']],
                ['fontsize', ['fontsize']],
                ['style', ['bold', 'italic', 'underline', 'strikethrough']],
                ['color', ['forecolor', 'color']],
                ['height', ['height']],
                ['insert', ['picture']],
                ['view', ['fullscreen']]
            ],
            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
            fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72'],
        });
        $("#summernote").summernote('code', '${qnaBoardDTO.qcontent}')

        $('.summernote').summernote({
            height: 300,
            minHeight: null,
            maxHeight: null,
            focus: true,
            lang: 'ko-KR',
            toolbar: toolbar,
            //콜백 함수
            callbacks: {
                onImageUpload: function (files, editor, welEditable) {
                    // 파일 업로드(다중업로드를 위해 반복문 사용)
                    for (var i = files.length - 1; i++;) {
                        sendFile(files[i], this);
                    }
                }
            }

        })
    })
</script>


<script>
    const form = document.querySelector("#form")

    document.querySelector(".btnList").addEventListener("click", (e) => {
        e.preventDefault()
        e.stopPropagation()

        console.log("목록")
        form.setAttribute("action", "/qnaboard/list2")

        actionForm.submit()

    }, false);

    document.querySelector(".btnDel").addEventListener("click", (e) => {
        e.preventDefault()
        e.stopPropagation()

        console.log("삭제")
        form.setAttribute("action", "/qnaboard/remove2")
        form.setAttribute("method", "post")
        form.submit()

    }, false);

    document.querySelector(".btnMod").addEventListener("click", (e) => {
        e.preventDefault()
        e.stopPropagation()

        console.log("수정")
        form.setAttribute("action", "/qnaboard/modify2")
        form.setAttribute("method", "post")
        form.submit()

    }, false);

</script>
