<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>
<html>
<head>
    <title>G-Street Q&A</title>
</head>
<body>
<div class="card-header" style="border: none">
    <h2 class="card-title">자주묻는질문/공지사항</h2>
    <button id="regBtn" type="button" class="btn-sm btn-dark float-right" value="수정"
            onClick="location.href='/qnaboard/register2'">글쓰기</button>
</div>
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Q&A TABLE</h3>
            </div>
            <!-- ./card-header -->
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th hidden>글번호</th>
                        <th>자주묻는 질문</th>
                        <th>작성자</th>
                        <th>날짜</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tbody>

                    <c:forEach items="#{dtoList}" var="dto">
                        <tr data-widget="expandable-table" aria-expanded="false">
                            <td hidden><c:out value="${dto.qno}"></c:out></td>
                            <td><c:out value="${dto.qtitle}"></c:out></td>
                            <td><c:out value="${dto.qwriter}"></c:out></td>
                            <td><c:out value="${dto.regDate}"></c:out></td>
                        </tr>
                        <tr class="expandable-body">
                            <td colspan="5">
                                <pre><p><c:out value="${dto.qcontent}" escapeXml="false"></c:out></p></pre>
                                <button type="button" value="수정" id="modify"
                                        onClick="location.href='/qnaboard/modify2?qno=${dto.qno}'"
                                        class="btn-sm btn-warning float-right">수정
                                </button>
                                <form action="/qnaboard/remove?qno=${dto.qno}" method="post">
                                    <button type="submit" value="삭제" id="remove"
                                            class="btn-sm btn-warning float-right">삭제
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.card -->
    </div>
</div>


<%@include file="../includes/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</script>

</body>
</html>
