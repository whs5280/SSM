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
    <title>Part_time List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description"/>
    <meta content="Coderthemes" name="author"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>

    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico">

    <!-- App css -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/icons.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>

    <!-- 分页 css -->
    <style type="text/css">
        .pagination>.active>a, .pagination>.active>span, .pagination>.active>a:hover, .pagination>.active>span:hover, .pagination>.active>a:focus, .pagination>.active>span:focus {
            z-index: 2;
            color: #fff;
            background-color: #428bca;
            border-color: #428bca;
            cursor: default;
        }
        .pagination>li>a, .pagination>li>span {
            position: relative;
            float: left;
            padding: 6px 12px;
            line-height: 1.42857143;
            text-decoration: none;
            color: #428bca;
            background-color: #fff;
            border: 1px solid #ddd;
            margin-left: -1px;
        }
        a {
            color: #428bca;
            text-decoration: none;
        }
        a {
            background: 0 0;
        }
        * {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
        #pagination{
            margin-top: 35px;
        }
    </style>

    <script src="assets/js/modernizr.min.js"></script>
</head>

<jsp:include page="navbar.jsp"/>

<body>

<div class="wrapper">
    <div class="container-fluid">

        <!-- Page-Title -->
        <div class="row">
            <div class="col-sm-12">
                <div class="page-title-box">
                    <h4 class="page-title">Part_time List</h4>
                </div>
            </div>
        </div>
        <!-- end page title end breadcrumb -->


        <div class="card-box">
            <div class="col-sm-12">
                <!--查询条件-->
                <form id="myform">
                    <div class="form-row align-items-center">
                        <div class="col-auto">
                            <select name="state" id="state" class="form-control mb-2 mb-sm-0">
                                <option value="">-状态-</option>
                                <option value="审核">待审核</option>
                                <option value="通过">已通过</option>
                                <option value="未通过">未通过</option>
                            </select>
                        </div>
                        <div class="col-auto">
                            <button type="button" class="btn btn-primary" id="search">查询</button>
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
                            <table id="tech-companies-1" class="table table-striped">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>公司</th>
                                    <th>图片</th>
                                    <th>描述</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%--<tr>
                                    <td>
                                        <a href="" id="1" class="btn btn-outline-info" onclick="blockUser(this);">Block</a>
                                        <a href="" id="2" class="btn btn-outline-danger" onclick="delUser(this);">Delete</a>
                                    </td>
                                </tr>--%>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="6">
                                        <div id="total" class="pull-left" style="padding-top:20px;padding-left:10px">&nbsp;</div>
                                        <div class="pull-right">
                                            <ul class="pagination" id="pagination"></ul>
                                        </div>
                                    </td>
                                </tr>
                                </tfoot>
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

<!-- App js -->
<script src="assets/js/jquery.core.js"></script>
<script src="assets/js/jquery.app.js"></script>

<!-- 分页 -->
<script src="style/js/jqPaginator/jqPaginator.min.js"></script>

<script>
    $(document).ready(function(){
        //查询全部用户列表
        listUser();
    });

    //查询功能
    $("#search").click(function(){
        listUser();
    });

    function listUser(){
        //查询条件
        var state = $("#myform #state").val();
        var pageNum = 1;

        //获取用户列表
        $.post('listPic.do',
            {"state":state,"pageNum":pageNum},
            function(response){
                //生成结果列表
                pageInfo = response.page;
                obj = response.page.list;
                var html = "";
                for (var i = 0; i < obj.length; i++) {
                    html += '<tr><td>'
                        + obj[i].id + '</td><td>'
                        + obj[i].comEmail + '</td><td>'
                        + obj[i].pic + '</td><td>'
                        + obj[i].mark + '</td><td>'
                        + obj[i].state + '</td><td>'
                        + '<a href="" id="' + obj[i].id + '" class="btn btn-outline-info btn-bolck"'
                        + ' onclick="blockUser(this)">Pass</a>' + '&nbsp;&nbsp;'
                        + '<a href="" id="' + obj[i].id + '" class="btn btn-outline-danger"'
                        + ' onclick="deleteUser(this);">Refuse</a>'
                        +    '</td></tr>';
                }
                //setPage(pageInfo);
                $("#tech-companies-1 tbody").html(html);
            }
        );
    }

    function setPage(page) {
        var state = $("#myform #state").val();
        //设置总记录条
        $("#total").html("共<b>"+page.total+"</b>条记录");
        if(page.total > 5){
            $('#pagination').jqPaginator({
                totalCounts : page.total,
                pageSize : page.pageSize,
                prev: '<li class="prev"><a href="javascript:void(0);">上一页</a></li>',
                next:'<li class="next"><a href="javascript:void(0);">下一页</a></li>',
                first:'<li class="first"><a href="javascript:void(0);">首页</a></li>',
                last:'<li class="last"><a href="javascript:void(0);">尾页</a></li>',
                page: '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',
                onPageChange:function(page){
                    $.ajax({
                        type: "post",
                        url: "listPic.do",
                        data: {"state":state,"pageNum":page},
                        dataType: "json",
                        success: function (response){
                            console.log(response.page.list);
                            var ob = response.page.list;
                            var html = "";
                            for (var i = 0; i < ob.length; i++) {
                                html += '<tr><td>'
                                    + obj[i].id + '</td><td>'
                                    + obj[i].comEmail + '</td><td>'
                                    + obj[i].pic + '</td><td>'
                                    + obj[i].mark + '</td><td>'
                                    + obj[i].state + '</td><td>'
                                    + '<a href="" id="' + obj[i].id + '" class="btn btn-outline-info btn-bolck"'
                                    + ' onclick="blockUser(this)">Pass</a>' + '&nbsp;&nbsp;'
                                    + '<a href="" id="' + obj[i].id + '" class="btn btn-outline-danger"'
                                    + ' onclick="deleteUser(this);">DisPas</a>'
                                    +    '</td></tr>';
                            }
                            $("#tech-companies-1 tbody").html(html);
                        },
                        error: function () {
                        }
                    });
                }
            });
        }else{
            $('#pagination').jqPaginator('destroy')
        }
    }

    //不通过用户
    function deleteUser(obj){
        var id = $(obj).attr('id');
        $.post("dispassPic.do",{"id":id},function(response){
            if(response.tip=="success"){
                listUser();
            }
            else if(response.tip=="error"){
                //alert("用户删除失败!"+response.msg);
            }
        });
    }

    //审核通过
    function blockUser(obj){
        var id = $(obj).attr('id');
        $.post("passPic.do",{"id":id},function(response){
            if(response.tip=="success"){
                listUser();
            }
            else if(response.tip=="error"){
                //alert("用户锁定失败!"+response.msg);
            }
        });
    }

</script>
</body>
</html>
