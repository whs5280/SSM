<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
    <meta content="Coderthemes" name="author" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico">

    <!-- App css -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/icons.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/style.css" rel="stylesheet" type="text/css" />

    <script src="assets/js/modernizr.min.js"></script>
</head>


<body class="bg-accpunt-pages">

<!-- HOME -->
<section>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">

                <div class="wrapper-page">

                    <div class="account-pages">
                        <div class="account-box">
                            <div class="account-logo-box">
                                <h3 class="text-uppercase text-center font-bold mt-4">Sign In</h3>
                            </div>
                            <div class="account-content">
                                <form class="form-horizontal" id="loginForm">

                                    <div class="form-group m-b-20 row">
                                        <div class="col-12">
                                            <label for="username">Username</label>
                                            <input class="form-control" type="text" id="username" required="" placeholder="Enter your email">
                                        </div>
                                    </div>

                                    <div class="form-group row m-b-20">
                                        <div class="col-12">
                                            <label for="password">Password</label>
                                            <input class="form-control" type="password" required="" id="password" placeholder="Enter your password">
                                        </div>
                                    </div>

                                    <span class="error" style="display:none;color: red;" id="beError"></span>

                                    <div class="form-group row m-b-20">
                                        <div class="col-12">

                                            <div class="checkbox checkbox-success">
                                                <input id="remember" type="checkbox" checked="">
                                                <label for="remember">
                                                    Remember me
                                                </label>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="form-group row text-center m-t-10">
                                        <div class="col-12">
                                            <button class="btn btn-block btn-gradient waves-effect waves-light" type="button" id="admin-login">Sign In</button>
                                        </div>
                                    </div>

                                </form>

                                <div class="row m-t-50">
                                    <div class="col-sm-12 text-center"></div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- end card-box-->

                </div>
                <!-- end wrapper -->

            </div>
        </div>
    </div>
</section>
<!-- END HOME -->

<!-- jQuery  -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/waves.js"></script>
<script src="assets/js/jquery.slimscroll.js"></script>

<!-- App js -->
<script src="assets/js/jquery.core.js"></script>
<script src="assets/js/jquery.app.js"></script>

<script>
    $(function(){

        $("#admin-login").on('click', function () {
            var email = $('#username').val();
            var password = $('#password').val();
            $.ajax({
                type:'POST',
                data:{"email":email,"password":password},
                url:'UserType.do',
                async:false,
                dataType: 'json'
            }).done(function(result) {
                if(result.tip=="admin"){
                    //window.location = 'maSystem';
                    window.location = 'dashboard';
                }else{
                    $('#beError').show();
                    $('#beError').html("密码错误，请重新输入！");
                }
            });
        });
    })
</script>
</body>
</html>