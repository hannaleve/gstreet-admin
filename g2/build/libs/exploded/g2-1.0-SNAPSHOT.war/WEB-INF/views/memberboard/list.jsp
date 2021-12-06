<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../includes/header.jsp" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Select2 -->
<link rel="stylesheet" href="/resources/plugins/select2/css/select2.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/resources/css/adminlte.min.css">

<style>
    .pagination { display: flex; }

    .card-footer {
        background-color: white;
        align-self: center;
    }
</style>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Members</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="/memberboard/exmain">Home</a></li>
                        <li class="breadcrumb-item active">Members</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <!-- Default box -->
        <div class="card">
            <div class="card-header">

                <form action="/memberboard/list" method="get">
                    <input type="hidden" name="page" value="1">
                    <input type="hidden" name="size" value="${pageMaker.size}">
                    <div class="row">
                        <div class="col-md-10 offset-md-1">
                            <div class="row">
                                <div class="col-6">
                                    <div class="form-group">
                                        <label>Search for:</label>
                                        <select name="type" class="form-control" data-placeholder="Any" style="width: 100%;">
                                            <option value="I" ${pageRequestDTO.type=="I"?"selected":""}>User ID</option>
                                            <option value="N" ${pageRequestDTO.type=="N"?"selected":""}>Name</option>
                                            <option value="K" ${pageRequestDTO.type=="K"?"selected":""}>Nickname
                                            </option>
                                        </select>

                                        <div class="input-group input-group-lg">
                                            <input type="search" class="form-control form-control-lg"
                                                   placeholder="Type your keywords here" name="keyword" style="width: auto;"
                                                   value="${pageRequestDTO.keyword}">
                                            <div class="input-group-append">
                                                <button type="submit" class="btn btn-lg btn-default">
                                                    <i class="fa fa-search"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">

                            </div>
                        </div>
                    </div>
                </form>
            </div>


            <div class="card-body p-0">
                <table class="table table-striped projects" style="text-align-last: center">
                    <thead>
                    <tr>
                        <th style="width: 10%">
                            ID
                        </th>
                        <th style="width: 20%">
                            Name
                        </th>
                        <th style="width: 10%">
                            NickName
                        </th>
                        <th style="width: 10%">
                            User Level
                        </th>
                        <th style="width: 8%" class="text-center">
                            User Status
                        </th>
                        <th style="width: 25%" class="text-center">
                            User Control
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${memberdtoList}" var="dto">
                        <tr>
                            <td>
                                <c:out value="${dto.userID}"></c:out>
                            </td>
                            <td>
                                <a>
                                    <c:out value="${dto.userName}"></c:out>
                                </a>
                                <br/>
                                <small>
                                    Joined At : <fmt:formatDate value="${dto.userRegDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                                </small>
                            </td>

                            <td>
                                <c:out value="${dto.userNickname}"></c:out>
                            </td>
                            <td>
                                <c:out value="${dto.userRole}"></c:out>
                            </td>
                            <td class="project-state">
                            <span class="badge badge-success">

                                <c:out value="${dto.userEnabled?'ENABLE':'DISABLE'}"></c:out>

                            </span>
                            </td>
                            <td class="project-state">
                                <a class="btn btn-primary btn-sm" href="javascript:moveRead('${dto.userID}')">
                                    <i class="fas fa-search">
                                    </i>
                                    View Profile
                                </a>
                                <c:if test="${dto.userEnabled eq true}">
                                    <a class="btn btn-danger btn-sm" href="javascript:banUser('${dto.userID}')">
                                        <i class="fas fa-user-slash">
                                        </i>
                                        BAN USER
                                    </a>
                                </c:if>
                                <c:if test="${dto.userEnabled eq false}">
                                    <a class="btn btn-success btn-sm" href="javascript:unbanUser('${dto.userID}')">
                                        <i class="fas fa-user-check">
                                        </i>
                                        UNBAN USER
                                    </a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <!-- /.card-body -->
            <div class="card-footer clearfix">
                <nav aria-label="Contacts Page Navigation">
                    <ul class="pagination justify-content-center m-0">
                        <c:if test="${pageMaker.prev}">
                            <li class="page-item"><a class="page-link" href="javascript:movePage(${pageMaker.start -1})"> << </a>
                            </li>
                        </c:if>

                        <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="num">
                            <li class="page-item ${pageMaker.page == num?'active':''}"><a class="page-link"
                                                                                          href="javascript:movePage(${num})">${num}</a>
                            </li>
                        </c:forEach>

                        <c:if test="${pageMaker.next}">
                            <li class="page-item"><a class="page-link"
                                                     href="javascript:movePage(${pageMaker.end +1})"> >> </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
        <!-- /.card -->
        <form id="actionForm" action="/memberboard/list" method="get">
            <input type="hidden" name="page" value="${pageMaker.page}">
            <input type="hidden" name="size" value="${pageMaker.size}">
            <c:if test="${pageRequestDTO.type != null}">
                <input type="hidden" name="type" value="${pageRequestDTO.type}">
                <input type="hidden" name="keyword" value="${pageRequestDTO.keyword}">
            </c:if>
        </form>
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
<%@include file="../includes/footer.jsp" %>
<%--sweetaleart--%>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
    {
        const actionForm = document.querySelector("#actionForm")

        const result = '${result}'

        const banResult = '${banResult}'
        const unbanResult = '${unbanResult}'
        const grantMemberResult = '${grantMemberResult}'
        const grantSellerResult = '${grantSellerResult}'
        const grantAdminResult = '${grantAdminResult}'


        const Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 4000,
            timerProgressBar: true,
            didOpen: (toast) => {
                toast.addEventListener('mouseenter', Swal.stopTimer)
                toast.addEventListener('mouseleave', Swal.resumeTimer)
            }
        })

        if (banResult && banResult !== '') {
            Toast.fire({
                icon: 'success',
                title: 'User Banned in successfully'
            })
            window.history.replaceState(null, '', '/memberboard/list');
        }

        if (unbanResult && unbanResult !== '') {
            Toast.fire({
                icon: 'success',
                title: 'User Unbanned in successfully'
            })
            window.history.replaceState(null, '', '/memberboard/list');
        }

        if (grantMemberResult && grantMemberResult !== '') {
            Toast.fire({
                icon: 'info',
                title: 'Member Granted in successfully'
            })
            window.history.replaceState(null, '', '/memberboard/list');
        }

        if (grantSellerResult && grantSellerResult !== '') {
            Toast.fire({
                icon: 'info',
                title: 'Seller Granted in successfully'
            })
            window.history.replaceState(null, '', '/memberboard/list');
        }

        if (grantAdminResult && grantAdminResult !== '') {
            Toast.fire({
                icon: 'info',
                title: 'Admin Granted in successfully'
            })
            window.history.replaceState(null, '', '/memberboard/list');
        }


        function movePage(pageNum) {

            actionForm.querySelector("input[name='page']").setAttribute("value", pageNum)
            actionForm.submit()

        }

        function moveRead(userID) {

            actionForm.setAttribute("action", "/memberboard/read")
            // actionForm.innerHTML += `<input type='hidden' name='userID' value='\${userID}'>`

            actionForm.innerHTML += `<input type='hidden' name='userID' value='\${userID}'>`
            actionForm.submit()
        }

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

    }
</script>