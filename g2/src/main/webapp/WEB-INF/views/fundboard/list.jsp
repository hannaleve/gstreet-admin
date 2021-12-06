<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../includes/header.jsp"%>

<style>
    .layout-fixed{
        height: auto;
        position: absolute;
        left: 50%;
        width: -webkit-fill-available;
        transform: translateX(-50%);
    }

    .nav{
        justify-content: center;
    }

    .form-group-sm{
        position: relative;
        left: 50%;
        transform: translateX(-50%);
    }

    .a{color: #f39c12;}

    .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th { vertical-align: inherit; }

    .table thead th { vertical-align: inherit; }

</style>

    <hr>

<div class="search" style="width: -moz-fit-content">
<!-- 검색 시작-->
    <div class="form-group-sm" style="padding:40px">
    <form action="/fundboard/list" method="get">
        <input type="hidden" name="page" value="1">
        <input type="hidden" name="size" value="${pageMaker.size}">
    <center style="padding:10px">
        <select name="type" class="custom-select" style="width: 40%; justify-content: center">
            <option value="">search option</option>
            <option value="T" ${pageRequestDTO.type=="T"?"selected":""}>title</option>
            <option value="TC" ${pageRequestDTO.type=="TC"?"selected":""}>title+content</option>
            <option value="C" ${pageRequestDTO.type=="C"?"selected":""}>content</option>
            <option value="H" ${pageRequestDTO.type=="H"?"selected":""}>hashtag</option>
            <option value="TCW" ${pageRequestDTO.type=="TCW"?"selected":""}>all</option>
        </select>
    </center>
        <div class="row">
            <div class="col-md-8 offset-md-2">
                    <div class="input-group" style="display: flex">
                        <input type="search" value="${pageRequestDTO.keyword}" name="keyword" class="form-control form-control-lg" placeholder="Type your keywords here" style="width: auto;">
                        <button type="submit" class="btn btn-lg btn-default"><i class="fa fa-search"></i></button>
                    </div>
                </div>
            </div>
       </form>
    </div>
</div>
<!--검색창 끝-->

<!--내비 시작-->

<div class="nav-tabs-navigation">
    <div class="nav-tabs-wrapper">
        <ul id="tabs" class="nav nav-tabs" role="tablist">
            <li class="nav-item" id="funding">
                <a class="nav-link active" data-toggle="tab" href="#home" role="tab">Funding</a>
            </li>
            <li class="nav-item" id="ended">
                <a class="nav-link" data-toggle="tab" href="#profile" role="tab">Ended</a>
            </li>
        </ul>
    </div>
</div>
<div id="my-tab-content" class="tab-content text-center">
    <div class="tab-pane active" id="home" role="tabpanel">
        <div class="card-body table-responsive p-0">
            <table class="table table-hover text-nowrap">
                <thead style="text-align-last: center;">
                <tr>
                    <th>No.</th>
                    <th>Title</th>
                    <th>Writer</th>
                    <th>Regdate</th>
                    <th>View</th>
                    <th>Price</th>
                    <th>GoalPrice</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${dtoList}" var="dto">
                    <tr>
                        <td><c:out value="${dto.fno}"></c:out></td>
                        <td><a href="/fundboard/read?fno=${dto.fno}"><c:out value="${dto.ftitle}"></c:out></a></td>
                        <td><c:out value="${dto.fwriter}"></c:out></td>
                        <td><c:out value="${dto.fregdate}"></c:out></td>
                        <td><c:out value="${dto.fcount}"></c:out></td>
                        <td><c:out value="${dto.fprice}"></c:out></td>
                        <td><c:out value="${dto.goalPrice}"></c:out></td>
                        <td>
                            <form action="/fundboard/remove?fno=${dto.fno}" method="post">
                                <button class="btn" type="submit" value="삭제" id="remove"><i class="fas fa-trash-alt"></i></button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="tab-pane" id="profile" role="tabpanel">
        <div class="card-body table-responsive p-0">
            <table class="table table-hover text-nowrap">
                <thead style="text-align-last: center;">
                <tr>
                    <th>No.</th>
                    <th>Title</th>
                    <th>Writer</th>
                    <th>Regdate</th>
                    <th>Enddate</th>
                    <th>View</th>
                    <th>Price</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="#{endList}" var="endList">
                    <tr>
                        <td><c:out value="${endList.fno}"></c:out></td>
                        <td><a href="/fundboard/read?fno=${endList.fno}"><c:out value="${endList.ftitle}"></c:out></a></td>
                        <td><c:out value="${endList.fwriter}"></c:out></td>
                        <td><c:out value="${endList.fregdate}"></c:out></td>
                        <td><c:out value="${endList.fenddate}"></c:out></td>
                        <td><c:out value="${endList.fcount}"></c:out></td>
                        <td><c:out value="${endList.fprice}"></c:out></td>
                        <td>
                            <form action="/fundboard/remove?fno=${endList.fno}" method="post">
                                <button class="btn" type="submit" value="삭제" id="remove1"><i class="fas fa-trash-alt"></i></button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>
<!--내비 끝-->
<div style="text-align: right; margin-right: 30px;">
    <button class="btn"><a href="/fundboard/register">새 글 쓰기</a></button>
</div>
<div class="page-align" id="dis" style="text-align: center;">
<!-- /.card-body -->
<div class="card-footer clearfix"  style="place-content: center;">
    <ul class="pagination pagination-sm">
        <c:if test="${pageMaker.prev}">
            <li class="page-item"><a class="page-link" href="javascript:movePage(${pageMaker.start -1})"> << </a></li>
        </c:if>

        <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="num">
            <li class="page-item ${pageMaker.page == num?'active':''}"><a class="page-link"
                                                                          href="javascript:movePage(${num})">${num}</a>
            </li>
        </c:forEach>

        <c:if test="${pageMaker.next}">
            <li class="page-item"><a class="page-link" href="javascript:movePage(${pageMaker.end +1})"> >> </a></li>
        </c:if>
    </ul>
</div>
</div>
</div>
<!-- /.card -->

<form id="actionForm" action="/fundboard/list" method="get">
    <input type="hidden" name="page" value="${pageMaker.page}">
    <input type="hidden" name="size" value="${pageMaker.size}">
    <c:if test="${pageRequestDTO.type != null}">
        <input type="hidden" name="type" value="${pageRequestDTO.type}">
        <input type="hidden" name="keyword" value="${pageRequestDTO.keyword}">
    </c:if>
</form>

<%@include file="../includes/footer.jsp"%>

<script> // 활성 탭에 따른 페이징 감추기/보이기
    document.querySelector("#funding").addEventListener("click", (e) => {
        $('#dis').css('display','block')
    })

    document.querySelector("#ended").addEventListener("click", (e) => {
        $('#dis').css('display','none')
    })
</script>
<script>
    const actionForm = document.querySelector("#actionForm")

    function movePage(pageNum) {
        actionForm.querySelector("input[name='page']").setAttribute("value", pageNum)
        actionForm.submit()
    }
</script>
</body>
</html>