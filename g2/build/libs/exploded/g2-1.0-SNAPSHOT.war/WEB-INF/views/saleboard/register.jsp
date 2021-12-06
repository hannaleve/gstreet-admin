<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Summernote</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <title>G-Street - 판매글 작성</title>
</head>
<style>
    .note-editable{height: 500px;}
</style>

<body>
<h2 style="text-align: center;">판매글 작성</h2><br>

<div style="width: 60%; margin: auto;">
    <form id="form" action="/saleboard/register" method="post">

        <div class="form-group absolute">
            <label>작성자</label>
            <input type="text" class="form-control form-control-border" name="s_writer" readonly value="<sec:authentication property="principal.userID"/>">
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label>국가 카테고리</label>
                    <select class="form-control" name="s_category" required>
                        <option selected>국가선택</option>
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
            <input type="text" class="form-control" name="s_title" placeholder="제목을 입력하세요">
        </div>

        <br>
        <textarea id="summernote" name="s_content"></textarea>
        <div class="card-footer text-right">
            <input type="button" class="btn btn-default" value="취소" onclick="history.back()"/>
            <button type="submit" class="btn btn-default">확인</button>
        </div>
    </form>
</div>
<%@include file="../includes/footer.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script>
    $(document).ready(function () {

            $(function () {
            //Add text editor
            $('#compose-textarea').summernote()
        })

        $("#summernote").summernote('code', '${saleBoardDTO.s_content}')

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

