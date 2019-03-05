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
    <script type="text/javascript" async="" src="style/js/conversion.js"></script>
    <script src="style/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script>
    <style type="text/css"></style>
    <meta content="no-siteapp" http-equiv="Cache-Control">
    <link media="handheld" rel="alternate">
    <!-- end 云适配 -->
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <title>我的收藏-大学生兼职平台</title>
    <meta content="23635710066417756375" property="qc:admins">
    <meta name="description" content="大学生兼职平台-专注于为大学生和企业服务的平台">
    <meta name="keywords" content="大学生兼职平台-专注于为大学生和企业服务的平台">
    <meta content="QIQ6KC1oZ6" name="baidu-site-verification">

    <!-- <div class="web_root"  style="display:none">h</div> -->
    <script type="text/javascript">
        var ctx = "h";
        console.log(1);
    </script>
    <link href="h/images/favicon.ico" rel="Shortcut Icon">
    <link href="style/css/style.css" type="text/css" rel="stylesheet">
    <link href="style/css/external.min.css" type="text/css" rel="stylesheet">
    <link href="style/css/popup.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
    <script src="style/js/jquery.lib.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="style/js/ajaxfileupload.js"></script>
    <script src="style/js/additional-methods.js" type="text/javascript"></script>
    <!--[if lte IE 8]>
    <script type="text/javascript" src="style/js/excanvas.js"></script>
    <![endif]-->
    <script type="text/javascript">
        var youdao_conv_id = 271546;
        var email = "${sessionScope.email}";
        var type = "${sessionScope.type}";
        $(document).ready(function reload() {
            if (email != null && email != "") {
            } else {
                $("#ex").html("未登录");
                window.location.href = 'login';
            }
            ;

            if (type != "student") {
                window.location.href = 'index';
            }

            $.ajax({
                type: "post",
                data: {"email": email},
                url: 'showRecord',
                dataType: 'json',
                success: function (response) {
                    var obj = response.recordList;
                    var htm = '<ul style="list-style-type:circle">';
                    var s = "";
                    var grade = 0, number = 0;
                    for (var i = 0; i < obj.length; i++) {
                        if (obj[i].stuState == "0") {
                            s = "待查看";
                        } else if (obj[i].stuState == "1") {
                            s = "已通过";
                        } else if (obj[i].stuState == "2") {
                            s = "不合适";
                        } else if (obj[i].stuState == "4") {
                            s = "已完成";
                            if (obj[i].stuGrade != null & obj[i].stuGrade != "") {
                                number++;
                                grade += parseInt(obj[i].stuGrade);
                            }
                        }

                        if (i > 3) {
                            break;
                        }
                        htm += '<li>' +
                            obj[i].jobName + '<span style="float:right;margin-right:55px;">' + s + '</span><br/>投递时间：' +
                            obj[i].applyTime + '</li>'
                    }
                    grade = (grade / number).toFixed(1);
                    if (isNaN(grade)) {

                    } else {
                        $("#showGrade").html(grade);
                    }

                    htm += '</ul>';
                    $("#showRecord").html(htm);
                }
            });

            //显示收藏信息
            $.ajax({
                type: "post",
                url: "findCollect",
                data: {"email": email},
                dataType: "json",
                success: function (response) {
                    obj = response.list;
                    var html = "";
                    for (var i = 0; i < obj.length; i++) {
                        //html += '信息'+ obj[i].stuEmail + ';' + obj[i].resume.jobType + '<br/>';
                        html += '<li data-id="133340"><div class="co_item" style="margin-left: 15px;"><h2 title="jobName"><a target="_blank"><em>'
						+ obj[i].resume.jobName + '</em><span>（'
						+ obj[i].resume.salary + '）</span></a></h2><div class="co_cate">' + '人数：'
						+ obj[i].resume.number + '<span style="margin-left: 30px;">地点：'
						+ obj[i].resume.department + '</span><br/>时间：'
						+ obj[i].resume.time + '</div><div></div><a class="collectionCancel collection_link collected" onclick="deleteCollect(this)"'
                        + ' id="' + obj[i].cid + '"'
                        + '>取消收藏</a></div></li>'
                    }
                    $("#my_collections").append(html);
                }
            });

        });
    </script>
    <script>
        //取消收藏
        function deleteCollect(obj) {
            var id = $(obj).attr('id');
            $.post("delCollect",{"id":id},function(response){
                window.location.href = 'collect';
            });
        }
    </script>
    <script src="style/js/conv.js" type="text/javascript"></script>
    <script src="style/js/ajaxCross.json" charset="UTF-8"></script>
</head>
<body>
<div id="body">
    <div id="header">
        <div class="wrapper">
            <a class="logo" href="index">
                <img width="229" height="43" alt="大学生兼职平台-专注于为大学生和企业服务的平台" src="style/images/logo6.png">
            </a>
            <ul id="navheader" class="reset">
                <li><a href="index">首页</a></li>
                <li><a rel="nofollow" href="stuResume">我的简历</a></li>
                <li><a rel="nofollow" target="_blank" href="preview?email=${sessionScope.email}">预览简历</a></li>
            </ul>
            <dl class="collapsible_menu">
                <dt>
                    <span id="ex">${sessionScope.email}</span>
                    <span class="red dn" id="noticeDot-0"></span>
                    <i></i>
                </dt>
                <dd style="display: none;"><a rel="nofollow" href="stuResume">修改简历</a></dd>
                <dd style="display: none;"><a href="delivery">我投递的兼职 <span id="noticeNo" class="red dn">(0)</span></a>
                </dd>
                <dd class="btm" style="display: none;"><a target="_blank" href="preview?email=${sessionScope.email}">预览简历</a>
                </dd>
                <dd style="display: none;"><a href="updatePwd">密码修改</a></dd>
                <dd class="logout" style="display: none;"><a rel="nofollow" href="outLogin">退出</a></dd>
            </dl>
            <div class="dn" id="noticeTip">
                <span class="bot"></span>
                <span class="top"></span>
                <a target="_blank" href="delivery.html"><strong>0</strong>条新投递反馈</a>
                <a class="closeNT" href="javascript:;"></a>
            </div>
        </div>
    </div><!-- end #header -->
    <div id="container">

        <div class="clearfix">

            <div class="content_l">
                <dl class="c_collections" id="c_collections">
                    <dt>
                        <h1><em></em>我收藏的职位</h1>
                    </dt>
                    <dd>
                        <form id="collectionsForm">
                            <ul class="reset my_collections" id="my_collections">

                            </ul>
                        </form>
                    </dd>
                </dl>
            </div>
            <!--end .content_l-->
            <div class="content_r">

                <div class="mycenterR" id="myCollect">
                    <h2>我的收藏</h2>
                    <a target="_blank" href="collect">我收藏的职位</a>
                </div><!--end #myCollect-->

                <div class="mycenterR" id="myInfo">
                    <h2>我的报名</h2>
                    <div id="showRecord" href="collect">

                    </div>
                    <a target="_blank" href="delivery">查看更多</a>

                </div><!--end #myInfo-->


                <div class="mycenterR" id="myShare">
                    <h2>当前每日投递量：10个</h2>
                </div><!--end #myShare-->


            </div><!--end .content_r-->
        </div>

        <input type="hidden" id="userid" name="userid" value="314873">

        <script src="style/js/Chart.min.js" type="text/javascript"></script>
        <script src="style/js/profile11.min.js" type="text/javascript"></script>
        <!-- <div id="profileOverlay"></div> -->
        <div class="" id="qr_cloud_resume" style="display: none;">
            <div class="cloud">
                <img width="134" height="134" src="">
                <a class="close" href="javascript:;"></a>
            </div>
        </div>
        <script>
            $(function () {
                $.ajax({
                    url: ctx + "/mycenter/showQRCode",
                    type: "GET",
                    async: false
                }).done(function (data) {
                    if (data.success) {
                        $('#qr_cloud_resume img').attr("src", data.content);
                    }
                });
                var sessionId = "resumeQR" + 314873;
                if (!$.cookie(sessionId)) {
                    $.cookie(sessionId, 0, {expires: 1});
                }
                if ($.cookie(sessionId) &amp;&amp; $.cookie(sessionId) != 5) {
                    $('#qr_cloud_resume').removeClass('dn');
                }
                $('#qr_cloud_resume .close').click(function () {
                    $('#qr_cloud_resume').fadeOut(200);
                    resumeQR = parseInt($.cookie(sessionId)) + 1;
                    $.cookie(sessionId, resumeQR, {expires: 1});
                });
            });
        </script>
        <div class="clear"></div>
        <input type="hidden" value="97fd449bcb294153a671f8fe6f4ba655" id="resubmitToken">
        <a rel="nofollow" title="回到顶部" id="backtop" style="display: none;"></a>
    </div><!-- end #container -->
</div><!-- end #body -->


<script src="style/js/core.min.js" type="text/javascript"></script>
<script src="style/js/popup.min.js" type="text/javascript"></script>

<!--  -->

<div id="cboxOverlay" style="display: none;"></div>
<div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none;">
    <div id="cboxWrapper">
        <div>
            <div id="cboxTopLeft" style="float: left;"></div>
            <div id="cboxTopCenter" style="float: left;"></div>
            <div id="cboxTopRight" style="float: left;"></div>
        </div>
        <div style="clear: left;">
            <div id="cboxMiddleLeft" style="float: left;"></div>
            <div id="cboxContent" style="float: left;">
                <div id="cboxTitle" style="float: left;"></div>
                <div id="cboxCurrent" style="float: left;"></div>
                <button type="button" id="cboxPrevious"></button>
                <button type="button" id="cboxNext"></button>
                <button id="cboxSlideshow"></button>
                <div id="cboxLoadingOverlay" style="float: left;"></div>
                <div id="cboxLoadingGraphic" style="float: left;"></div>
            </div>
            <div id="cboxMiddleRight" style="float: left;"></div>
        </div>
        <div style="clear: left;">
            <div id="cboxBottomLeft" style="float: left;"></div>
            <div id="cboxBottomCenter" style="float: left;"></div>
            <div id="cboxBottomRight" style="float: left;"></div>
        </div>
    </div>
    <div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div>
</div>
</body>
</html>