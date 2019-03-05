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
    <meta charset="utf-8"/>
    <title>Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description"/>
    <meta content="Coderthemes" name="author"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>

    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico">

    <!-- Table Responsive css -->
    <link href="../plugins/responsive-table/css/rwd-table.min.css" rel="stylesheet" type="text/css" media="screen">

    <!-- App css -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/icons.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>

    <script src="assets/js/modernizr.min.js"></script>

</head>

<body>

<jsp:include page="navbar.jsp"/>

<div class="wrapper">
    <div class="container-fluid">

        <!-- Page-Title -->
        <div class="row">
            <div class="col-sm-12">
                <div class="page-title-box">
                    <h4 class="page-title">Welcome !</h4>
                </div>
            </div>
        </div>
        <!-- end page title end breadcrumb -->

        <!-- start -->
        <div class="row">
            <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                <div class="card-box tilebox-one">
                    <i class="fi-box float-right"></i>
                    <h6 class="text-muted text-uppercase mb-3">成功兼职量</h6>
                    <h4 class="mb-3" data-plugin="counterup">${a_total}</h4>
                </div>
            </div>

            <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                <div class="card-box tilebox-one">
                    <i class="fi-layers float-right"></i>
                    <h6 class="text-muted text-uppercase mb-3">兼职信息量</h6>
                    <h4 class="mb-3"><span data-plugin="counterup">${r_total}</span></h4>
                </div>
            </div>

            <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                <div class="card-box tilebox-one">
                    <i class="fi-tag float-right"></i>
                    <h6 class="text-muted text-uppercase mb-3">学生数量</h6>
                    <h4 class="mb-3"><span data-plugin="counterup">${s_total}</span></h4>
                </div>
            </div>

            <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                <div class="card-box tilebox-one">
                    <i class="fi-briefcase float-right"></i>
                    <h6 class="text-muted text-uppercase mb-3">企业数量</h6>
                    <h4 class="mb-3" data-plugin="counterup">${c_total}</h4>
                </div>
            </div>
        </div>
        <!-- end -->

        <div class="card-box">
            <div class="col-sm-12">
                <form>
                    <div class="checkbox">
                        <input id="checkbox0" type="checkbox">
                        <label for="checkbox0">
                            Check
                        </label>
                        <input id="checkbox1" type="checkbox">
                        <label for="checkbox1">
                            Check
                        </label>
                    </div>

                    <div class="form-row align-items-center">
                        <div class="col-auto">
                            <label class="sr-only" for="inlineFormInput">Username</label>
                            <input type="text" class="form-control mb-2 mb-sm-0" id="inlineFormInput"
                                   placeholder="Name">
                        </div>
                        <div class="col-auto">
                            <label class="sr-only" for="inlineFormInput">Password</label>
                            <input type="text" class="form-control mb-2 mb-sm-0" id="inlineFormInput2"
                                   placeholder="Name">
                        </div>
                        <div class="col-auto">
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <div class="card-box">

                    <div class="table-rep-plugin">
                        <div class="table-responsive" data-pattern="priority-columns">
                            <table id="tech-companies-1" class="table  table-striped">
                                <thead>
                                <tr>
                                    <th>Company</th>
                                    <th data-priority="1">Last Trade</th>
                                    <th data-priority="3">Trade Time</th>
                                    <th data-priority="1">Change</th>
                                    <th data-priority="3">Prev Close</th>
                                    <th data-priority="3">Open</th>
                                    <th data-priority="6">Bid</th>
                                    <th data-priority="6">Ask</th>
                                    <th data-priority="6">1y Target Est</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th>ORCL <span class="co-name">Oracle Corporation</span></th>
                                    <td>31.15</td>
                                    <td>12:44PM</td>
                                    <td>1.41 (4.72%)</td>
                                    <td>29.74</td>
                                    <td>30.67</td>
                                    <td>31.14 x 6500</td>
                                    <td>31.15 x 3200</td>
                                    <td>36.11</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        <!-- end row -->

    </div> <!-- end container -->
</div>
<!-- end wrapper -->

<jsp:include page="footer.jsp"/>

<!-- jQuery  -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/waves.js"></script>
<script src="assets/js/jquery.slimscroll.js"></script>

<!-- responsive-table-->
<script src="../plugins/responsive-table/js/rwd-table.min.js" type="text/javascript"></script>

<!-- App js -->
<script src="assets/js/jquery.core.js"></script>
<script src="assets/js/jquery.app.js"></script>

<script>
    $(function () {
        $('.table-responsive').responsiveTable({
            addDisplayAllBtn: 'btn btn-secondary'
        });

        //统计数据
    });
</script>

</body>
</html>