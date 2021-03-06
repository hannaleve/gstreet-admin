<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../includes/header.jsp" %>

<head>
    <meta charset="UTF-8">
    <title>Summernote</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <title>G-Street - Q&Aμμ </title>
</head>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>πG-Street Q&A</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">κ±°λκ²μν</li>
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
                            <h2 class="card-title">Q&A κΈ μμ </h2>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form id="form">
                            <div class="card-body">
                                <div class="form-group">
                                    <label>κΈλ²νΈ</label>
                                    <input name="qno" class="form-control"
                                           value="<c:out value="${qnaBoardDTO.qno}"></c:out>" readonly="readonly">
                                </div>
                                <div class="form-group">
                                    <label>μ λͺ©</label>
                                    <input type="text" name="qtitle" class="form-control"
                                           value="<c:out value="${qnaBoardDTO.qtitle}"></c:out>">
                                </div>

                                <div class="form-group">
                                    <label>λ΄μ©</label>
                                    <textarea id="summernote" name="qcontent" class="form-control" rows="10"><c:out value="${qnaBoardDTO.qcontent}"></c:out> </textarea>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail12">μμ±μ</label>
                                    <input type="text" name="qwriter" class="form-control" id="exampleInputEmail12"
                                           readonly value="<sec:authentication property="principal.userID"/>">
                                </div>
                            </div>
                            <!β /.card-body β>
                            <div class="temp"></div>

                            <div class="card-footer float-right">
                                <button type="submit" class="btn btn-primary btnList">λͺ©λ‘</button>
                                <button type="submit" class="btn btn-warning btnMod">μμ </button>
                                <button type="submit" class="btn btn-warning btnDel">μ­μ </button>
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
            placeholder: 'νλ§€νκ³  μΆμ μνκ³Ό λ°°μ‘ μμΉλ₯Ό μ ννκ² μλ ₯ν΄ μ£ΌμΈμ.',
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
            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'λ§μ κ³ λ', 'κΆμ', 'κ΅΄λ¦Όμ²΄', 'κ΅΄λ¦Ό', 'λμμ²΄', 'λ°νμ²΄'],
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
            //μ½λ°± ν¨μ
            callbacks: {
                onImageUpload: function (files, editor, welEditable) {
                    // νμΌ μλ‘λ(λ€μ€μλ‘λλ₯Ό μν΄ λ°λ³΅λ¬Έ μ¬μ©)
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

        console.log("λͺ©λ‘")
        form.setAttribute("action", "/qnaboard/list2")

        actionForm.submit()

    }, false);

    document.querySelector(".btnDel").addEventListener("click", (e) => {
        e.preventDefault()
        e.stopPropagation()

        console.log("μ­μ ")
        form.setAttribute("action", "/qnaboard/remove2")
        form.setAttribute("method", "post")
        form.submit()

    }, false);

    document.querySelector(".btnMod").addEventListener("click", (e) => {
        e.preventDefault()
        e.stopPropagation()

        console.log("μμ ")
        form.setAttribute("action", "/qnaboard/modify2")
        form.setAttribute("method", "post")
        form.submit()

    }, false);

</script>
