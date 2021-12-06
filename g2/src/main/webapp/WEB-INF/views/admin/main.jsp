<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../includes/header.jsp" %>

<script>
    jQuery(document).ready(function( $ ) {
        $('.counter').counterUp({
            delay: 10,
            time: 800
        });
    });
</script>

<style>
    .content { margin-top: 45px; }
    .media-body, .media-left, .media-right { padding: 10px; }
    .dropdown-item-title { font-size: xxx-large; }
    .top { display: flex; flex-direction: row; width: auto; position: sticky; margin: 15px}
    .card1 {order:1; width: -webkit-fill-available;}
    .card2 {order:2; width: -webkit-fill-available;}
    .mainRow { display: flex; flex-direction: col; display: table; }
    .menu1 {display: table-cell; order:1; width: -webkit-fill-available;}
    .menu2 {display: table-cell; order:2; width: -webkit-fill-available;}
    .menu3 {display: table-cell; order:3; width: -webkit-fill-available;}
    .menu4 {display: table-cell; order:4; width: -webkit-fill-available;}

    .top-content{order:1;}
    .bottom-content{order:2;}

    .card-title {font-size: x-large;}

    .layout-fixed{
        width: 90%;
        height: auto;
        position: absolute;
        left: 50%;
        transform: translateX(-50%);
    }
</style>


<!--content Start-->
<div style="display: flex; flex-direction: row; place-content: center;">
    <div class="menu4 col-lg-3 col-6">
        <!-- small card -->
        <div class="small-box bg-success">
            <div class="inner">
                <h3 class="counter">${countList}</h3>

                <p>총 게시글</p>
            </div>
            <div class="icon">
                <i class="ion ion-stats-bars"></i>
            </div>
            <a href="#" class="small-box-footer">
                More info <i class="fas fa-arrow-circle-right"></i>
            </a>
        </div>
    </div>

    <div class="col-lg-3 col-6">
        <!-- small card -->
        <div class="small-box bg-warning">
            <div class="inner">
                <h3 class="counter">${stat2}</h3>

                <p>신규 회원</p>
            </div>
            <div class="icon">
                <i class="fas fa-user-plus"></i>
            </div>
            <a href="#" class="small-box-footer">
                More info <i class="fas fa-arrow-circle-right"></i>
            </a>
        </div>
    </div>
    <div class="col-lg-3 col-6">
        <!-- small card -->
        <div class="small-box bg-info">
            <div class="inner">
                <h3 class="counter">${stat}</h3>

                <p>전체회원수</p>
            </div>
            <div class="icon">
                <i class="fas fa-chart-pie"></i>
            </div>
            <a href="#" class="small-box-footer">
                More info <i class="fas fa-arrow-circle-right"></i>
            </a>
        </div>
    </div>
</div>

<div class="top">
<!-- TO DO List -->
<div class="card card1 col-md-6">
    <div class="card-header">
        <h3 class="card-title">
            <i class="ion ion-clipboard mr-1"></i>
            G-STREET shared calendar
        </h3>

    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <ul class="todo-list" data-widget="todo-list">
            <li>
                <!-- drag handle -->
                <span class="handle">
                      <i class="fas fa-ellipsis-v"></i>
                      <i class="fas fa-ellipsis-v"></i>
                    </span>
                <!-- checkbox -->
                <div  class="icheck-primary d-inline ml-2">
                    <input type="checkbox" value="" name="todo1" id="todoCheck1">
                    <label for="todoCheck1"></label>
                </div>
                <!-- todo text -->
                <span class="text">13시 직원회의</span>
                <!-- Emphasis label -->
                <small class="badge badge-danger"><i class="far fa-clock"></i> 2 mins</small>
                <!-- General tools such as edit or delete-->
                <div class="tools">
                    <i class="fas fa-edit"></i>
                    <i class="fas fa-trash-o"></i>
                </div>
            </li>
            <li>
                    <span class="handle">
                      <i class="fas fa-ellipsis-v"></i>
                      <i class="fas fa-ellipsis-v"></i>
                    </span>
                <div  class="icheck-primary d-inline ml-2">
                    <input type="checkbox" value="" name="todo2" id="todoCheck2" checked>
                    <label for="todoCheck2"></label>
                </div>
                <span class="text">고객사 미팅 15:30 1층 회의실</span>
                <small class="badge badge-info"><i class="far fa-clock"></i> 4 hours</small>
                <div class="tools">
                    <i class="fas fa-edit"></i>
                    <i class="fas fa-trash-o"></i>
                </div>
            </li>
            <li>
                    <span class="handle">
                      <i class="fas fa-ellipsis-v"></i>
                      <i class="fas fa-ellipsis-v"></i>
                    </span>
                <div  class="icheck-primary d-inline ml-2">
                    <input type="checkbox" value="" name="todo3" id="todoCheck3">
                    <label for="todoCheck3">이벤트 홍보전략 기획</label>
                </div>
                <span class="text"></span>
                <small class="badge badge-warning"><i class="far fa-clock"></i> 1 day</small>
                <div class="tools">
                    <i class="fas fa-edit"></i>
                    <i class="fas fa-trash-o"></i>
                </div>
            </li>
            <li>
                    <span class="handle">
                      <i class="fas fa-ellipsis-v"></i>
                      <i class="fas fa-ellipsis-v"></i>
                    </span>
                <div  class="icheck-primary d-inline ml-2">
                    <input type="checkbox" value="" name="todo4" id="todoCheck4">
                    <label for="todoCheck4"></label>
                </div>
                <span class="text">정기주간업무 및 시스템 테스트</span>
                <small class="badge badge-success"><i class="far fa-clock"></i> 3 days</small>
                <div class="tools">
                    <i class="fas fa-edit"></i>
                    <i class="fas fa-trash-o"></i>
                </div>
            </li>
            <li>
                    <span class="handle">
                      <i class="fas fa-ellipsis-v"></i>
                      <i class="fas fa-ellipsis-v"></i>
                    </span>
                <div  class="icheck-primary d-inline ml-2">
                    <input type="checkbox" value="" name="todo5" id="todoCheck5">
                    <label for="todoCheck5"></label>
                </div>
                <span class="text">일정 알림테스트 및 채팅홈 개선</span>
                <small class="badge badge-primary"><i class="far fa-clock"></i> 1 week</small>
                <div class="tools">
                    <i class="fas fa-edit"></i>
                    <i class="fas fa-trash-o"></i>
                </div>
            </li>
            <li>
                    <span class="handle">
                      <i class="fas fa-ellipsis-v"></i>
                      <i class="fas fa-ellipsis-v"></i>
                    </span>
                <div  class="icheck-primary d-inline ml-2">
                    <input type="checkbox" value="" name="todo6" id="todoCheck6">
                    <label for="todoCheck6"></label>
                </div>
                <span class="text">김소연팀장 출장범주 09:30</span>
                <small class="badge badge-secondary"><i class="far fa-clock"></i> 1 month</small>
                <div class="tools">
                    <i class="fas fa-edit"></i>
                    <i class="fas fa-trash-o"></i>
                </div>
            </li>
        </ul>
    </div>
    <!-- /.card-body -->
    <div class="card-footer clearfix">
        <button type="button" class="btn btn-primary float-right"><i class="fas fa-plus"></i> Add item</button>
    </div>
</div>
<!-- /.card -->

<!-- TO DO List -->
<div class="card card2 col-md-6">
    <div class="card-header">
        <h3 class="card-title">
            <i class="ion ion-clipboard mr-1"></i>
            #Hashtag #GSTREET #DROPSHIPPING
        </h3>

    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <h3 style="color: #1d6fa5">
            <c:forEach items="${hashList}" var="hash" >
                #<c:out value="${hash.tags}"></c:out>
            </c:forEach>
        </h3>
    </div>
    <!-- /.card-body -->
    <div class="card-footer clearfix">
        <button type="button" class="btn btn-primary float-right"><i class="fas fa-plus"></i> Add item</button>
    </div>
</div>
<!-- /.card -->
</div>



<!-- Main content -->
<div class="content">
    <div class="container-fluid">
        <div class="row mainRow">
            <div class="top-content">
            <div class="menu1 col-lg-6">
                <div class="card">
                    <div class="card-header border-0">
                        <div class="card-header">
                            <h2 class="card-title">
                                <i class="ion ion-clipboard mr-1"></i>
                                Drop-shipping
                            </h2>

                        </div>
                    </div>
                    <div class="card-body table-responsive p-0">
                        <table class="table table-striped table-valign-middle">
                            <thead>
                            <tr>
                                <th>글 번호</th>
                                <th>카테고리</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>조회수</th>
                                <th>작성일</th>
                            </tr>
                            </thead>
                            <tbody>
                            <form>
                                <c:forEach items="#{saleList}" var="dto">

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
                            </tr>
                            </c:forEach>
                            </form>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- /.card -->
            </div>
            <div class="menu2 col-lg-6">
            <div class="card">
                <div class="card-header border-0">
                    <div class="card-header">
                        <h2 class="card-title">
                            <i class="ion ion-clipboard mr-1"></i>
                            Request
                        </h2>

                    </div>
                </div>
                <div class="card-body table-responsive p-0">
                    <table class="table table-striped table-valign-middle">
                        <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>조회수</th>
                            <th>좋아요수</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${requestList}" var="dto">
                            <tr>

                                <td><c:out value="${dto.bno}"></c:out></td>

                                <td><c:out value="${dto.title}"></c:out></td>
                                <td><c:out value="${dto.writer}"></c:out></td>
                                <td><c:out value="${dto.regDate}"></c:out></td>
                                <td><c:out value="${dto.reCount}"></c:out></td>
                                <td><c:out value="${dto.likeCount}"></c:out></td>

                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
            <!-- /.card -->
        </div>
    </div>
            <div class="bottom-content">
            <div class="menu3 col-lg-6">
                <div class="card">
                    <div class="card-header border-0">
                        <div class="card-header">
                            <h2 class="card-title">
                                <i class="ion ion-clipboard mr-1"></i>
                                Funding
                            </h2>

                        </div>
                    </div>
                    <div class="card-body table-responsive p-0">
                        <table class="table table-striped table-valign-middle">
                            <thead>
                            <tr>
                                <th>No.</th>
                                <th>Title</th>
                                <th>Writer</th>
                                <th>Regdate</th>
                                <th>View</th>
                                <th>Price</th>
                                <th>GoalPrice</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${fundList}" var="dto">
                                <tr>
                                    <td><c:out value="${dto.fno}"></c:out></td>
                                    <td><c:out value="${dto.ftitle}"></c:out></td>
                                    <td><c:out value="${dto.fwriter}"></c:out></td>
                                    <td><c:out value="${dto.fregdate}"></c:out></td>
                                    <td><c:out value="${dto.fcount}"></c:out></td>
                                    <td><c:out value="${dto.fprice}"></c:out></td>
                                    <td><c:out value="${dto.goalPrice}"></c:out></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- /.card -->
            </div>
            <div class="menu4 col-lg-6">
                <div class="card">
                    <div class="card-header border-0">
                        <div class="card-header">
                            <h2 class="card-title">
                                <i class="ion ion-clipboard mr-1"></i>
                                Q&A
                            </h2>

                        </div>
                    </div>
                    <div class="card-body table-responsive p-0">
                        <table class="table table-striped table-valign-middle">
                            <thead>
                            <tr>
                                <th hidden>글번호</th>
                                <th>자주묻는 질문</th>
                                <th>작성자</th>
                                <th>날짜</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="#{qnaList}" var="dto">
                                <tr data-widget="expandable-table" aria-expanded="false">
                                    <td hidden><c:out value="${dto.qno}"></c:out></td>
                                    <td><c:out value="${dto.qtitle}"></c:out></td>
                                    <td><c:out value="${dto.qwriter}"></c:out></td>
                                    <td><c:out value="${dto.regDate}"></c:out></td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- /.card -->
            </div>
            <!-- /.card -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
<!--content End-->
<br><br>



<%@include file="../includes/footer.jsp"%>

</body>
</html>