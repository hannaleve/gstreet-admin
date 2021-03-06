<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../includes/header.jsp" %>

<head>
    <meta charset="UTF-8">
    <title>Summernote</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <title>G-Street - κΈ μμ </title>


</head>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>πG-Street κ±°λκ²μν</h1>
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
                            <h2 class="card-title">κ±°λκΈ μμ±</h2>
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
                                    <label>κΈλ²νΈ</label>
                                    <input name="sno" class="form-control"
                                           value='<c:out value="${saleBoardDTO.sno}"/>' readonly="readonly">
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <label>κ΅­κ° μΉ΄νκ³ λ¦¬</label>
                                            <select id=country class="form-control" name="s_category" required
                                                    value="<c:out value="${saleBoardDTO.s_category}"/>">
                                                <option disabled="ALL">κ΅­κ°μ ν</option>
                                                <option value="λ―Έκ΅­">λ―Έκ΅­</option>
                                                <option value="μκ΅­">μκ΅­</option>
                                                <option value="μΌλ³Έ">μΌλ³Έ</option>
                                                <option value="μ€κ΅­">μ€κ΅­</option>
                                                <option value="μΊλλ€">μΊλλ€</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>μ λͺ©</label>
                                    <input type="text" name="s_title" class="form-control"
                                           value="<c:out value="${saleBoardDTO.s_title}"/>">
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <!β textarea β>
                                        <div class="form-group">
                                            <label>λ΄μ©</label>
                                            <textarea id="summernote" name="s_content" class="form-control" rows="10"><c:out value="${saleBoardDTO.s_content}"></c:out>
                                        </textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail12">μμ±μ</label>
                                    <input type="text" name="s_writer" class="form-control" id="exampleInputEmail12"
                                           value="<sec:authentication property="principal.userID"/>" readonly>
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
        $("#summernote").summernote('code', '${slaeBoardDTO.s_content}')

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
    const actionForm = document.querySelector("#actionForm")

    document.querySelector(".btnList").addEventListener("click", (e) => {
        e.preventDefault()
        e.stopPropagation()

        actionForm.submit()
    },false);

    document.querySelector(".btnDel").addEventListener("click", (e) => {
        e.preventDefault()
        e.stopPropagation()

        console.log("μ­μ ")
        form.setAttribute("action", "/saleboard/remove")
        form.setAttribute("method", "post")
        form.submit()

    },false);

    document.querySelector(".btnMod").addEventListener("click", (e) => {
        e.preventDefault()
        e.stopPropagation()

        console.log("μμ ")
        form.setAttribute("action", "/saleboard/modify")
        form.setAttribute("method", "post")
        form.submit()

    },false);
</script>
