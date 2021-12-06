<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>G-STREET Admin | Dashboard</title>

    <link href="/resources/css/nav.css" rel="stylesheet"/>
    <!--paper kit 2-->
    <link href="/resources/css/paper-kit.css?v=2.2.0" rel="stylesheet"/>
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/resources/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bootstrap 4 -->
    <link rel="stylesheet" href="/resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- JQVMap -->
    <link rel="stylesheet" href="/resources/plugins/jqvmap/jqvmap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/resources/css/adminlte.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="/resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="/resources/plugins/daterangepicker/daterangepicker.css">
    <!-- summernote -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">


</head>
<style>
    .media-body, .media-left, .media-right {
        padding: 10px;
    }

    .dropdown-item-title {
        font-size: xxx-large;
    }
</style>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

    <!-- Preloader -->
    <div class="preloader flex-column justify-content-center align-items-center">
        <img class="animation__shake" src="/resources/img/AdminLTELogo.png" alt="gstreet" height="60" width="60">
    </div>

    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item d-none d-sm-inline-block">
                <a href="/admin/main" class="nav-link"><b>G - S T R E E T</b></a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="/memberboard/list" class="nav-link">Member</a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="/fundboard/list" class="nav-link">Fund</a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="/saleboard/list" class="nav-link">Drop-shipping</a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="/reqboard/list" class="nav-link">Request</a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="/qnaboard/list2" class="nav-link">Q&A</a>
            </li>
        </ul>

        <!-- Right navbar links -->
        <ul class="navbar-nav ml-auto">
            <!-- Messages Dropdown Menu -->
            <li class="nav-item dropdown">
                <sec:authorize access="isAuthenticated()">
                    <a class="nav-link" data-toggle="dropdown" href="#"><i class="fas fa-users-cog"></i>
                    </a>
                </sec:authorize>
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right" style="padding: 10px">
                    <div class="dropdown-divider"></div>
                    <!-- Message Start -->
                    <div class="media">
                        <div class="media-body">
                            <sec:authorize access="isAuthenticated()">
                                <h3 class="dropdown-item-title">
                                    Welcome, <b><sec:authentication property="principal.userID"/></b>
                                    <span class="float-right text-sm text-warning"></span>
                                </h3>
                            </sec:authorize>
                            <p class="text-sm text-muted" style="padding-top:15px;">
                                <button class="btn btn-block btn-warning" onclick="location.href='/logout'">logout
                                </button>
                            </p>
                        </div>
                    </div>
                    <!-- Message End -->
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                    <i class="fas fa-expand-arrows-alt"></i>
                </a>
            </li>
        </ul>
    </nav>
    <!-- /.navbar -->
</div>