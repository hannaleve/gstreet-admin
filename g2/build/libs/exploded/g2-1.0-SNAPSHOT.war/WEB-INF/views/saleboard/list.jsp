<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>

<style>
    tr {
        text-align: center;
    }

    .table thead th, .card-title {
        vertical-align: middle;
    }

    .table td, .table th, .card-title {
        vertical-align: middle;
    }

    a:link {
        color: #2c4765;
        background-color: transparent;
        text-decoration: none;
    }

    a:visited {
        color: #8e44ad;
        background-color: transparent;
        text-decoration: none;
    }

    a:hover {
        color: pink;
        background-color: transparent;
    }

    a:active {
        color: yellow;
        background-color: transparent;
        text-decoration: underline;
    }
</style>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header" style="background-color: white">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">🔑G-Street</h1>

                </div><!-- /.col -->
                <div class="col-sm-12">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="/saleboard/list">관리자메인홈으로가기</a></li>
                        <li class="breadcrumb-item active">판매게시판관리자권한페이지</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content" style="background-color: white">
        <div class="container-fluid">
            <!-- Small boxes (Stat box) -->

            <!-- TO DO List -->

            <div class="card-header" style="border: none">
                <h2 class="card-title">개인거래 게시판</h2>
                <button id="regBtn" type="button" class="btn-sm btn-dark float-right">글쓰기</button>
            </div>


            <!-- /.card-header -->
            <div class="card-body">
                <table class="table" style="border-bottom-color: #c7b5e7">


                    <thead>
                    <tr>
                        <th><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll();"/></th>
                        <th>글 번호</th>
                        <th>카테고리</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                        <th>게시글 관리</th>
                    </tr>
                    </thead>
                    <tbody>
                    <form>
                        <c:forEach items="#{dtoList}" var="dto">

                    <tbody>
                    <tr>
                        <td class="center"><input type="checkbox" name="checkRow" value="${dto.sno}"/></td>
                        <td><c:out value="${dto.sno}"></c:out></td>
                        <td><c:out value="${dto.s_category}"></c:out></td>
                        <td><a href="javascript:moveRead(${dto.sno})"><c:out
                                value="${dto.s_title}"></c:out> <b>[ <c:out value="${dto.s_reCount}"/> ]</b></a></td>
                        <td><c:out value="${dto.s_writer}"></c:out></td>
                        <td><c:out value="${dto.s_viewCount}"></c:out></td>
                        <td><c:out value="${dto.s_regDate}"></c:out></td>
                        <td>
                            <button type="button" class="btn-sm btn-warning btnMod"><a
                                    href="javascript:moveMod(${dto.sno})">수정</a></button>
                            <button type="button" class="btn-sm btn-warning btnRmv"><a
                                    href="javascript:moveDel(${dto.sno})">삭제</a></button>
                        </td>
                    </tr>
                    </c:forEach>
                    </form>
                    </tbody>
                </table>
            </div>

            <!-- /.card-body -->
            <div class="card-footer clearfix" style="background-color: white">
                <ul class="pagination justify-content-center pagination-sm m-0">

                    <c:if test="${pageMaker.prev}">
                        <li class="page-item"><a class="page-link" href="javascript:movePage(${pageMaker.start -1})"> <
                            이전 </a></li>
                    </c:if>

                    <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="num">
                        <li class="page-item ${pageMaker.page == num?'active':''}"><a class="page-link"
                                                                                      href="javascript:movePage(${num})">${num}</a>
                        </li>
                    </c:forEach>

                    <c:if test="${pageMaker.next}">
                        <li class="page-item"><a class="page-link" href="javascript:movePage(${pageMaker.end +1})"> 다음
                            > </a></li>
                    </c:if>
                </ul>
            </div>

            <!-- /.card -->


            <form action="/saleboard/list" method="get">
                <input type="hidden" name="page" value="1">
                <input type="hidden" name="size" value="${pageMaker.size}">
                <div>

                    <label>게시글 검색</label>
                    <div class="col-md-12">
                        <div class="col-md-3">
                            <select name="type" class="custom-select">
                                <option value="">---</option>
                                <option value="S" ${pageRequestDTO.type=="S"?"selected":""}>카테고리</option>
                                <option value="T" ${pageRequestDTO.type=="T"?"selected":""}>제목</option>
                                <option value="C" ${pageRequestDTO.type=="C"?"selected":""}>내용</option>
                                <option value="TC" ${pageRequestDTO.type=="TC"?"selected":""}>제목 + 내용</option>
                                <option value="TCW" ${pageRequestDTO.type=="W"?"selected":""}>작성자</option>
                            </select>
                        </div>
                        <div class="col-md-9">
                            <div class="input-group input-group-sm">
                                <input type="text" class="form-control" name="keyword"
                                       value="${pageRequestDTO.keyword}">
                                <span class="input-group-append">
                            <button type="submit" class="btn btn-info">검색</button>
                        </span>
                            </div>
                        </div>
                    </div>
                </div>
            </form>


            <!--modal추가-->
            <div>
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content" style="border: transparent;">
                            <div class="modal-header" style="border: none">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body" style=" text-align: center">게시글이 삭제 되었습니다.</div>
                            <div class="modal-footer float-right" style="border: none">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
    <!-- /.content -->
</div>
<!-- / content-wrapper -->

<form id="actionForm" action="/saleboard/list" method="get">
    <input type="hidden" name="page" value="${pageMaker.page}">
    <input type="hidden" name="size" value="${pageMaker.size}">

    <c:if test="${pageRequestDTO.type != null}">
        <input type="hidden" name="type" value="${pageRequestDTO.type}">
        <input type="hidden" name="keyword" value="${pageRequestDTO.keyword}">
    </c:if>
</form>

<%@include file="../includes/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">

    const actionForm = document.querySelector("#actionForm")

    const result = '${result}'

    if (result && result !== '') {
        $('#modal-sm').modal('show')

        window.history.replaceState(null, '', '/saleboard/list');
    }

    $(document).ready(function () {

        var result = '<c:out value="${result}"/>';

        checkModal(result);

        history.replaceState({}, null, null);

        function checkModal(result) {
            if (result === '' || history.state) {
                return;
            }
            if (parseInt(result) > 0) {
                $(".modal-body").html("게시글 " + parseInt(result) + "번이 등록되었습니다.");
            }
            $("#myModal").modal("show");
        }

        $("#regBtn").on("click", function () {
            self.location = "/saleboard/register";
        });
    });

    function movePage(pageNum) {

        actionForm.querySelector("input[name='page']").setAttribute("value", pageNum)

        actionForm.submit()

    }

    function moveRead(sno) {

        actionForm.setAttribute("action", "/saleboard/read")
        actionForm.innerHTML += `<input type='hidden' name='sno' value='\${sno}'>`
        actionForm.submit()
    }

    function moveMod(sno) {
        actionForm.setAttribute("action", "/saleboard/modify")
        actionForm.innerHTML += `<input type='hidden' name='sno' value='\${sno}'>`
        actionForm.submit()
    }

    function moveDel(sno) {

        actionForm.setAttribute("action", "/saleboard/remove")
        actionForm.innerHTML += `<input type='hidden' name='sno' value='\${sno}'>`
        actionForm.setAttribute("method", "post")
        actionForm.submit()
    }

    function checkAll() {
        if ($("#th_checkAll").is(':checked')) {
            $("input[name=checkRow]").prop("checked", true);
        } else {
            $("input[name=checkRow]").prop("checked", false);
        }
    }
</script>


</body>
</html>