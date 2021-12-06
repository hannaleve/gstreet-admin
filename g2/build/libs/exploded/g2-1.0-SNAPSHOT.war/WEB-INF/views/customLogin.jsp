<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>G-STREET
        | Log in</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/resources/plugins/fontawesome-free/css/all.min.css">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/resources/css/adminlte.min.css">
</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <b>G-STREET</b> Admin Login
    </div>
    <!-- /.login-logo -->
    <div class="card">
        <div class="card-body login-card-body">
            <p class="login-box-msg">Requires Access to Admin Page</p>

            <form action="/login" method="post">
                <div class="input-group mb-3">
                    <input type="text" name="username" class="form-control" placeholder="Username">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-user"></span>
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <input type="password" name="password" class="form-control" placeholder="Password">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                </div>
                <div class="row">
                    <div class="col-8">
                        <div class="icheck-primary">
                            <input type="checkbox" id="remember" name="remember-me">
                            <label for="remember">
                                Remember Me
                            </label>
                        </div>
                    </div>
                </div>
                <p></p>
                <div class="row">
                    <div class="col-6">
                        <a class="btn btn-primary btn-block btn-danger" href="javascript:registerPage()"><i
                                class="fas fa-user-plus"></i> Register
                        </a>
                    </div>

                    <div class="col-6">
                        <button type="submit" class="btn btn-primary btn-block"><i class="fas fa-key"></i> Sign In
                        </button>
                    </div>
                </div>

            </form>


            <!-- /.social-auth-links -->
            <%--            <p class="mb-1">--%>
            <%--                <a href="forgot-password.html">I forgot my password</a>--%>
            <%--            </p>--%>

            <!-- /.login-card-body -->
        </div>
    </div>

    <!-- /.login-box -->

    <!-- jQuery -->
    <script src="/resources/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="/resources/js/adminlte.min.js"></script>
    <%--sweetaleart--%>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <%--로그인 모달--%>
    <script>
        const result = '${result}'

        if (result && result !== '') {
            Swal.fire({
                icon : 'success',
                title: 'Congratulations!',
                text : 'register finished!'
            })
            window.history.replaceState(null, '', '/customLogin');
        }
    </script>

    <script>
        function registerPage() {
            window.location.href = "/memberboard/register"
        }
    </script>

</body>
</html>