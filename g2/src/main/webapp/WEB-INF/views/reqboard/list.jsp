<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../includes/header.jsp"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style>

    thead,th,td {
        text-align-last: center;
        text-align: center;
    }
    .card-footer {
        background-color: white;
        align-self: center;
    }

    .pagination { display: flex; }

    <!--해시태그stlye-->
        * {
            margin: 0;
            padding: 0;
            list-style: none;
        }

    ul {
        padding: 16px 0;
    }

    ul li {
        display: inline-block;
        margin: 0 5px;
        font-size: 14px;
        letter-spacing: -.5px;
    }

    ul li.tag-item {
        padding: 4px 8px;
        background-color: #777;
        color: #000;
    }

    .tag-item:hover {
        background-color: #262626;
        color: #fff;
    }

    .del-btn {
        font-size: 12px;
        font-weight: bold;
        cursor: pointer;
        margin-left: 8px;
    }

    body{
        margin-top:20px;
    }
    .hehehe {
        float: right;
    }
    .table thead th, .card-title {
        vertical-align: middle;
    }

    .table td, .table th, .card-title {
        vertical-align: middle;
    }

    .btn, .btn-sm {
        padding: 2px 5px;
        font-size: 10px;
        line-height: initial;
        border-radius: px;
        display: inline-block;
    }

    a:hover {
        background-color: lightblue;
        text-decoration: underline;
    }
</style>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-6">
                <div class="col-sm-12">
                    <h1 class="m-0">💡요청게시판</h1>

                </div><!-- /.col -->

            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <!-- Small boxes (Stat box) -->

            <!-- TO DO List -->
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">REQUEST BOARD</h3>

                    <sec:authorize access="isAuthenticated()">
                        <button style="float: right; color:#262b30" class="btn btn-warning" ><a href="/reqboard/register" style="text-decoration-line: none; color: #262b30">글쓰기</a></button>
                    </sec:authorize>
                </div>

                <form action="/reqboard/list" method="get">
                    <input type="hidden" name="page" value="1">
                    <input type="hidden" name="size" value="${pageMaker.size}">

                    <nav class="hehehe">
                        <div  class="container">
                            <div class="row">
                                <div class="col-xs-8 col-xs-offset-2">
                                    <div class="input-group">
                                        <div class="input-group-btn search-panel">
                                            <select name="type" class="custom-select" style="width: 100%;">
                                                <option>선택하세요</option>
                                                <option value="T" ${pageRequestDTO.type=="T"?"selected":""}>제목</option>
                                                <option value="TC" ${pageRequestDTO.type=="TC"?"selected":""}>제목내용</option>
                                                <option value="C" ${pageRequestDTO.type=="C"?"selected":""}>내용</option>
                                                <option value="TCW" ${pageRequestDTO.type=="TCW"?"selected":""}>제목내용작성자</option>
                                                <option value="H" ${pageRequestDTO.type=="H"?"selected":""}>해시태그검색 #</option>
                                            </select>
                                        </div>
                                        <input type="text" class="form-control" id="searchInput" name="keyword" value="${pageRequestDTO.keyword}" placeholder="Search....">
                                        <span class="input-group-btn"><button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span>검색</button></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </nav>
                </form>

                <div class="card-body">
                    총 게시글수 : <b><strong>${pageMaker.total}</strong></b>
                    <table class="table table">
                        <thead>
                        <tr style="width:20px">
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>조회수</th>
                            <th>좋아요수</th>
                            <th>기능</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${dtoList}" var="dto">
                            <tr style="text-align: center; border: 1px solid #ddd">
                                <td><c:out value="${dto.bno}"></c:out></td>

                                <td><a href="javascript:moveRead(${dto.bno})"style="color: #262b30">
                                    <c:out value="${dto.title}"></c:out></a></td>
                                <td><c:out value="${dto.writer}"></c:out></td>
                                <td><c:out value="${dto.regDate}"></c:out></td>
                                <td><c:out value="${dto.reCount}"></c:out></td>
                                <td><c:out value="${dto.likeCount}"></c:out></td>
                                <td style="display: inline-flex;border: blueviolet">
                                    <button type="button" value="수정" id="modify"  onClick="location.href='/reqboard/modify?bno=${dto.bno}'" class="btn btn-secondary btn-sm">수정</button>
                                    <form action="/reqboard/remove?bno=${dto.bno}" method="post">
                                        <button type="submit" value="삭제" id="remove" class="btn btn-secondary btn-sm" style="margin-left: 5px">삭제</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="card-footer clearfix">
                    <nav aria-label="Contacts Page Navigation">
                        <ul class="pagination justify-content-center m-0">
                            <c:if test="${pageMaker.prev}">
                                <li class="page-item"><a class="page-link" href="javascript:movePage(${pageMaker.start -1})"> << </a>
                                </li>
                            </c:if>
                            <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="num">
                                <li class="page-item ${pageMaker.page == num?'active':''}"><a class="page-link" href="javascript:movePage(${num})">${num}</a>
                                </li>
                            </c:forEach>

                            <c:if test="${pageMaker.next}">
                                <li class="page-item"><a class="page-link" href="javascript:movePage(${pageMaker.end +1})"> >> </a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </section>
</div>

<div class="modal fade" id="modal-sm">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">관리자권한</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>처리완료되었습니다.</p>
            </div>
        </div>
    </div>
</div>


<form id="actionForm" action="/reqboard/list" method="get">
    <input type="hidden" name="page" value="${pageMaker.page}">
    <input type="hidden" name="size" value="${pageMaker.size}">

    <c:if test="${pageRequestDTO.type != null}">
        <input type="hidden" name="type" value="${pageRequestDTO.type}">
        <input type="hidden" name="keyword" value="${pageRequestDTO.keyword}">
    </c:if>
</form>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script>
    //전송처리
    const actionForm = document.querySelector("#actionForm")
    const result = '${result}'

    if (result && result !== '') {
        $('#modal-sm').modal('show')
        window.history.replaceState(null, '', '/reqboard/list');
    }

    function movePage(pageNum) {
        actionForm.querySelector("input[name='page']").setAttribute("value", pageNum)
        actionForm.submit()
    }

    function moveRead(bno) {
        actionForm.setAttribute("action", "/reqboard/read")
        actionForm.innerHTML += `<input type='hidden' name='bno' value='\${bno}'>`
        actionForm.submit()
    }

</script>

<%@include file="../includes/footer.jsp"%>