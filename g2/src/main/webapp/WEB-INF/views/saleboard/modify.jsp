<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../includes/header.jsp" %>

<head>
    <meta charset="UTF-8">
    <title>Summernote</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <title>G-Street - 글 수정</title>


</head>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>🌍G-Street 거래게시판</h1>
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
                            <h2 class="card-title">거래글 작성</h2>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form id="form">
                            <input type="hidden" name="page" value="${pageRequestDTO.page}">
                            <input type="hidden" name="size" value="${pageRequestDTO.size}">

                            <c:if test="${pageRequestDTO.type != null}">
                                <input type="hidden" name="type" value="${pageRequestDTO.type}">
                                <input type="hidden" name="keyword" value="${pageRequestDTO.keyword}">
                            </c:if>

                            <div class="card-body">
                                <div class="form-group">
                                    <label>글번호</label>
                                    <input name="sno" class="form-control"
                                           value='<c:out value="${saleBoardDTO.sno}"/>' readonly="readonly">
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <label>국가 카테고리</label>
                                            <select id=country class="form-control" name="s_category" required
                                                    value="<c:out value="${saleBoardDTO.s_category}"/>">
                                                <option disabled="ALL">국가선택</option>
                                                <option value="미국">미국</option>
                                                <option value="영국">영국</option>
                                                <option value="일본">일본</option>
                                                <option value="중국">중국</option>
                                                <option value="캐나다">캐나다</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>제목</label>
                                    <input type="text" name="s_title" class="form-control"
                                           value="<c:out value="${saleBoardDTO.s_title}"/>">
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <!— textarea —>
                                        <div class="form-group">
                                            <label>내용</label>
                                            <textarea id="summernote" name="s_content" class="form-control" rows="10"><c:out value="${saleBoardDTO.s_content}"></c:out>
                                        </textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail12">작성자</label>
                                    <input type="text" name="s_writer" class="form-control" id="exampleInputEmail12"
                                           value="<sec:authentication property="principal.userID"/>" readonly>
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

<form id="actionForm" action="/saleboard/list" method="get">
    <input type="hidden" name="page" value="${pageRequestDTO.page}">
    <input type="hidden" name="size" value="${pageRequestDTO.size}">

    <c:if test="${pageRequestDTO.type != null}">
        <input type="hidden" name="type" value="${pageRequestDTO.type}">
        <input type="hidden" name="keyword" value="${pageRequestDTO.keyword}">
    </c:if>
</form>

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
        $("#summernote").summernote('code', '${slaeBoardDTO.s_content}')

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
    const actionForm = document.querySelector("#actionForm")

    document.querySelector(".btnList").addEventListener("click", (e) => {
        e.preventDefault()
        e.stopPropagation()

        actionForm.submit()
    },false);

    document.querySelector(".btnDel").addEventListener("click", (e) => {
        e.preventDefault()
        e.stopPropagation()

        console.log("삭제")
        form.setAttribute("action", "/saleboard/remove")
        form.setAttribute("method", "post")
        form.submit()

    },false);

    document.querySelector(".btnMod").addEventListener("click", (e) => {
        e.preventDefault()
        e.stopPropagation()

        console.log("수정")
        form.setAttribute("action", "/saleboard/modify")
        form.setAttribute("method", "post")
        form.submit()

    },false);
</script>
