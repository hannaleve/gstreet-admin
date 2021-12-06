<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../includes/header.jsp" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Profile</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="/admin/main">Home</a></li>
                        <li class="breadcrumb-item active">User Profile</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <form id="actionForm" action="/memberboard/list" method="get">
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">

                        <!-- Profile Image -->
                        <div class="card card-primary card-outline">
                            <div class="card-body box-profile">
                                <div class="text-center">
                                    <c:forEach items="${memberBoardDTO.files}" var="attach">
                                        <c:if test="${attach.userImageCheck}">
                                            <img class="profile-user-img img-fluid img-circle"
                                                 onclick="javascript:showOrigin('${attach.getFileLink()}')"
                                                 src="/viewFile4?file=${attach.getThumbnail()}"
                                                 alt="User profile picture">
                                        </c:if>
                                    </c:forEach>
                                </div>

                                <h3 class="profile-username text-center"><c:out
                                        value="${memberBoardDTO.userID}"></c:out></h3>

                                <p class="text-muted text-center">
                                    <c:out
                                            value="${memberBoardDTO.userRole}"></c:out>
                                </p>

                                <ul class="list-group list-group-unbordered mb-3">
                                    <li class="list-group-item">
                                        <b>ID</b> <a class="float-right"><c:out
                                            value="${memberBoardDTO.userID}"></c:out></a>
                                    </li>
                                    <li class="list-group-item">
                                        <b>Name</b> <a class="float-right"><c:out
                                            value="${memberBoardDTO.userName}"></c:out></a>
                                    </li>
                                    <li class="list-group-item">
                                        <b>Nickname</b> <a class="float-right"><c:out
                                            value="${memberBoardDTO.userNickname}"></c:out></a>
                                    </li>
                                </ul>

                                <c:if test="${memberBoardDTO.userEnabled eq true}">
                                    <a href="javascript:banUser('${memberBoardDTO.userID}')" class="btn btn-danger btn-block"><b>Ban This User's Account</b></a>
                                </c:if>
                                <c:if test="${memberBoardDTO.userEnabled eq false}">
                                    <a href="javascript:unbanUser('${memberBoardDTO.userID}')" class="btn btn-success btn-block"><b>Unban This User's Account</b></a>
                                </c:if>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->

                        <!-- About Me Box -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">User Details</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <strong><i class="fas fa-phone-alt"></i> Phone</strong>

                                <p class="text-muted">
                                    <c:out value="${memberBoardDTO.userPhone}"></c:out>
                                </p>

                                <hr>

                                <strong><i class="fas fa-map-marker-alt mr-1"></i> Location</strong>

                                <p class="text-muted"><c:out value="${memberBoardDTO.userAddress}"></c:out></p>

                                <hr>

                                <strong><i class="fas fa-envelope"></i> Email</strong>

                                <p class="text-muted">
                                    <c:out value="${memberBoardDTO.userEmail}"></c:out>
                                </p>

                                <hr>

                                <strong><i class="fas fa-user-check"></i> Registered Date</strong>

                                <p class="text-muted"><fmt:formatDate value="${memberBoardDTO.userRegDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></p>

                                <hr>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->

                    <div class="col-md-9">
                        <div class="card">
                            <div class="card-header p-2">
                                <ul class="nav nav-pills">
                                    <li class="nav-item"><a class="nav-link active" href="#userdata" data-toggle="tab">User
                                        Data</a>
                                    </li>
                                    <li class="nav-item"><a class="nav-link" href="#activity" data-toggle="tab">User
                                        Activity</a>
                                    </li>
                                </ul>
                            </div><!-- /.card-header -->
                            <div class="card-body">
                                <div class="tab-content">
                                    <div class="tab-pane" id="activity">
                                        <!-- Post -->
                                        <div class="post">
                                            <div class="user-block">
                                                <img class="img-circle img-bordered-sm"
                                                     src=" " alt="user image">
                                                <span class="username">
                          <a href="#"> </a>
                          <a href="#" class="float-right btn-tool"><i class="fas fa-times"></i></a>
                        </span>
                                                <span class="description">Shared publicly - 7:30 PM today</span>
                                            </div>
                                            <!-- /.user-block -->
                                            <p>
                                                Lorem ipsum represents a long-held tradition for designers,
                                                typographers and the like. Some people hate it and argue for
                                                its demise, but others ignore the hate as they create awesome
                                                tools to help create filler text for everyone from bacon lovers
                                                to Charlie Sheen fans.
                                            </p>

                                            <p>
                                                <a href="#" class="link-black text-sm mr-2"><i
                                                        class="fas fa-share mr-1"></i> Share</a>
                                                <a href="#" class="link-black text-sm"><i class="far fa-thumbs-up mr-1"></i>
                                                    Like</a>
                                                <span class="float-right">
                          <a href="#" class="link-black text-sm">
                            <i class="far fa-comments mr-1"></i> Comments (5)
                          </a>
                        </span>
                                            </p>

                                            <input class="form-control form-control-sm" type="text"
                                                   placeholder="Type a comment">
                                        </div>
                                        <!-- /.post -->

                                    </div>
                                    <!-- /.tab-pane -->


                                    <div class="active tab-pane" id="userdata">
                                        <form class="form-horizontal">
                                            <div class="form-group row">
                                                <label for="showID" class="col-sm-2 col-form-label">USER'S ID</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="showID"
                                                           disabled
                                                           value="<c:out value="${memberBoardDTO.userID}"></c:out>">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="showName" class="col-sm-2 col-form-label">USER'S NAME</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="showName"
                                                           disabled
                                                           value="<c:out value="${memberBoardDTO.userName}"></c:out>">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="showNickName" class="col-sm-2 col-form-label">USER'S
                                                    NICKNAME</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="showNickName"
                                                           disabled
                                                           value="<c:out value="${memberBoardDTO.userNickname}"></c:out>">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="showRegDate" class="col-sm-2 col-form-label">Register
                                                    Date</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="showRegDate"
                                                           disabled
                                                           value="<fmt:formatDate value="${memberBoardDTO.userRegDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="showRegNum" class="col-sm-2 col-form-label">Register
                                                    Number</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="showRegNum"
                                                           disabled
                                                           value="<c:out value="${memberBoardDTO.userRegNum}"></c:out>">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="showPhone" class="col-sm-2 col-form-label">Phone Number</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="showPhone"
                                                           disabled
                                                           value="<c:out value="${memberBoardDTO.userPhone}"></c:out>">
                                                </div>
                                            </div>
                                        </form>

                                        <form class="form-horizontal">
                                            <div class="form-group row">
                                                <label class="col-sm-2 col-form-label">Current User Status</label>
                                                <div class="col-sm-10">
                                                    <c:out value="${memberBoardDTO.userEnabled?'ENABLE':'DISABLE'}"></c:out>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-2 col-form-label">User Level</label>
                                                <div class="col-sm-10">
                                                    <c:out value="${memberBoardDTO.userRole}"></c:out>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-2 col-form-label">Grant</label>
                                                <div class=" col-sm-10">
                                                    <div class="btn-group">
                                                        <button type="button" class="btn btn-default">Give authority</button>
                                                        <button type="button"
                                                                class="btn btn-default dropdown-toggle dropdown-icon"
                                                                data-toggle="dropdown">
                                                            <span class="sr-only">Toggle Dropdown</span>
                                                        </button>
                                                        <div class="dropdown-menu" role="menu">
                                                            <a class="dropdown-item" href="javascript:grantMember('${memberBoardDTO.userID}')">MEMBER</a>
                                                            <a class="dropdown-item" href="javascript:grantSeller('${memberBoardDTO.userID}')">SELLER</a>
                                                            <a class="dropdown-item" href="javascript:grantAdmin('${memberBoardDTO.userID}')">ADMIN</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a class="dropdown-item" href="javascript:banUser('${memberBoardDTO.userID}')">Ban This User</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- /.tab-pane -->
                                </div>
                                <!-- /.tab-content -->
                            </div><!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </form>
</div>
<!-- /.content-wrapper -->

<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
</aside>
<!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- /.modal -->
<div class="modal fade" id="modal-image">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-body">
                <img id="targetImage">
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<%@include file="../includes/footer.jsp" %>

<script>
    const modalImage = new bootstrap.Modal(document.querySelector('#modal-image'))

    function showOrigin(fileLink) {
        alert(fileLink)
        document.querySelector("#targetImage").src = `/viewFile4?file=\${fileLink}` // src를 사용하는게 반영속도가 더 빠름
        modalImage.show()
    }
</script>


<script>
    const form = document.querySelector("#form1")
    document.querySelector(".btnList").addEventListener("click", (e) => {
        e.preventDefault()
        e.stopPropagation()

        form.setAttribute("action", "/memberboard/list")
        form.setAttribute("method", "get")
        form.submit()
    }, false)

    document.querySelector(".btnKick").addEventListener("click", (e) => {
        e.preventDefault()
        e.stopPropagation()

        form.setAttribute("action", "/memberboard/read")
        form.setAttribute("method", "post")
        form.submit()
    }, false)

</script>

<%--권한부여--%>
<script>
    const actionForm = document.querySelector("#actionForm")

    function banUser(userID) {
        actionForm.setAttribute("action","/memberboard/ban")

        actionForm.innerHTML += `<input type='hidden' name='userID' value='\${userID}'>`
        actionForm.submit()
    }

    function unbanUser(userID) {
        actionForm.setAttribute("action","/memberboard/unban")

        actionForm.innerHTML += `<input type='hidden' name='userID' value='\${userID}'>`
        actionForm.submit()
    }

    function grantMember(userID) {
        actionForm.setAttribute("action","/memberboard/grantMember")
        actionForm.innerHTML += `<input type='hidden' name='userID' value='\${userID}'>`
        actionForm.submit()
    }

    function grantSeller(userID) {
        actionForm.setAttribute("action","/memberboard/grantSeller")
        actionForm.innerHTML += `<input type='hidden' name='userID' value='\${userID}'>`
        actionForm.submit()
    }

    function grantAdmin(userID) {
        actionForm.setAttribute("action","/memberboard/grantAdmin")
        actionForm.innerHTML += `<input type='hidden' name='userID' value='\${userID}'>`
        actionForm.submit()
    }
</script>
</body>
