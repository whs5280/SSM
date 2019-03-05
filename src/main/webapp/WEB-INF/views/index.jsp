<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page errorPage="showError.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <script id="allmobilize" charset="utf-8" src="style/js/allmobilize.min.js"></script>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="alternate" media="handheld"/>
    <!-- end 云适配 -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>大学生兼职平台</title>
    <meta property="qc:admins" content="23635710066417756375"/>
    <meta content="大学生兼职平台" name="description">
    <meta content="大学生兼职平台" name="keywords">
    <meta name="baidu-site-verification" content="QIQ6KC1oZ6"/>

    <!-- <div class="web_root"  style="display:none">h</div> -->
    <script type="text/javascript">
        var ctx = "h";
        console.log(1);
    </script>
    <link rel="stylesheet" type="text/css" href="style/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="style/css/external.min.css"/>
    <link rel="stylesheet" type="text/css" href="style/css/popup.css"/>
    <script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="style/js/jquery.lib.min.js"></script>
    <script src="style/js/ajaxfileupload.js" type="text/javascript"></script>
    <script type="text/javascript" src="style/js/additional-methods.js"></script>
    <%--<script type="text/javascript" src="style/js/jquery.pagination.min.js"></script>--%>
    <!--[if lte IE 8]>
    <script type="text/javascript" src="style/js/excanvas.js"></script>
    <![endif]-->
    <style>
        .con {
            display: inline-block;
            vertical-align: middle;
            width: 200px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
    </style>
    <script type="text/javascript">
        var youdao_conv_id = 271546;
        var email = "${sessionScope.email}";
        var type = "${sessionScope.type}";
        $(document).ready(function () {

            $.ajax({
                type: "post",
                url: "allResume",
                data: {},
                dataType: "json",
                success: function (response) {
                    //pageInfo = response.page;
                    obj = response.list;
                    var html = "";
                    for (var i = 0; i < obj.length; i++) {
                        html += '<li class="odd clearfix" style="width:750px;margin-top:8px;"><div class="hot_pos_l" ><div class="mb10"><a href="applyRe?id=' + obj[i].id + '" target="_blank" style="text-decoration:blink ">'
                            + obj[i].jobName + '</a></div><div style="float:left;"><span><em class="c7">兼职类型： </em>'
                            + obj[i].jobName + '</span> <br /><span><em class="c7">人数：</em>'
                            + obj[i].number + '</span></div><div style="float:left;"><span class="con"><em class="c7">时间：</em>'
                            + obj[i].time + '</span><br /><span class="con"><em class="c7">地点：</em>'
                            + obj[i].department + '</span></div></div><div class="hot_pos_r" style="width:350px;"><div class="apply" style="margin-top:25px;"><a href="applyRe?id=' + obj[i].id + '" target="_blank"  style="width:120px;height:40px;text-align:center;line-height:40px;">报名参加</a></div><div class="mb10" style="margin-top:35px;margin-left:30px;"><span><em class="c7">报酬： </em>'
                            + obj[i].salary + '</span></div></div></li>'
                    }
                    //setPage(pageInfo);
                    $("#allRe").html(html);
                }
            });

            /*function setPage(obj){
                $('.Pagination').pager({
                    currentPage: 1,
                    pageNOName: "pn",
                    isShow: true,
                    pageCount: obj.total,
                    pageSize: obj.pages,
                });
            }*/

            //jobName
            $("dl dd a,#search_button").click(function () {
                var key = $(this).text();
                if (key.length == 0) {
                    key = $("#search_input").val();
                }
                if (key == "全国"){
                    key = "";
                }
                $.ajax({
                    type: "post",
                    url: "findResumeByName",
                    data: {jobName: key},
                    dataType: "json",
                    success: function (response) {
                        obj = response.list;
                        var html = "";
                        for (var i = 0; i < obj.length; i++) {
                            html += '<li class="odd clearfix" style="width:750px;margin-top:8px;"><div class="hot_pos_l" ><div class="mb10"><a href="applyRe?id=' + obj[i].id + '" target="_blank" style="text-decoration:blink ">'
                                + obj[i].jobName + '</a></div><div style="float:left;"><span><em class="c7">兼职类型： </em>'
                                + obj[i].jobName + '</span> <br /><span><em class="c7">人数：</em>'
                                + obj[i].number + '</span></div><div style="float:left;"><span class="con"><em class="c7">时间：</em>'
                                + obj[i].time + '</span><br /><span class="con"><em class="c7">地点：</em>'
                                + obj[i].department + '</span></div></div><div class="hot_pos_r" style="width:350px;"><div class="apply" style="margin-top:25px;"><a href="applyRe?id=' + obj[i].id + '" target="_blank" style="width:120px;height:40px;text-align:center;line-height:40px;">报名参加</a></div><div class="mb10" style="margin-top:35px;margin-left:30px;"><span><em class="c7">报酬： </em>'
                                + obj[i].salary + '</span></div></div></li>'
                        }
                        $("#allRe").html(html);
                    }
                })
            });

        });


    </script>

    <script type="text/javascript" src="style/js/conv.js"></script>
</head>
<body>
<div id="body">
    <div id="header">
        <div class="wrapper">
            <a href="index" class="logo">
                <img src="style/images/logo6.png" width="229" height="40" alt="勾拉"/>
            </a>
            <!-- 导航条 -->
            <ul class="reset" id="navheader">
                <li class="current"><a href="index">首页</a></li>
                <% if (session.getAttribute("type") != null) { %>
                <%if (session.getAttribute("type").equals("company")) {%>
                <li><a href="comIndex" rel="nofollow">公司主页</a></li>
                <li><a href="create" rel="nofollow">兼职</a></li>
                <%} else if (session.getAttribute("type").equals("student")) {%>
                <li><a href="delivery" rel="nofollow">报名</a></li>
                <li><a href="stuResume" rel="nofollow">简历</a></li>
                <li><a rel="nofollow" target="_blank" href="preview?email=${sessionScope.email}">预览</a></li>
                <%} else if (session.getAttribute("type").equals("noCom")) {%>
                <li><a href="company" rel="nofollow">完善公司信息</a></li>
                <%
                    }
                } else {
                %>
                <li><a href="login" rel="nofollow">企业版</a></li>
                <li><a href="login" rel="nofollow">学生版</a></li>
                <%}%>
            </ul>
            <ul class="loginTop">
                <% if (session.getAttribute("type") == null) {%>
                <li><a href="login" rel="nofollow">登录</a></li>
                <li>|</li>
                <li><a href="register" rel="nofollow">注册</a></li>
                <%}%>
            </ul>
        </div>
    </div><!-- end #header -->
    <div id="container">

        <div id="sidebar">
            <div class="mainNavs" id="kk">
                <div class="menu_box">
                    <div class="menu_main">
                        <h2>热门兼职 <span></span></h2>
                    </div>
                    <div class="menu_sub dn">
                        <dl class="reset">
                            <dt><a href="#">热门兼职</a></dt>
                            <dd><a href="#">服务员</a>
                                <a href="#">促销导购</a>
                                <a href="#">打包分拣</a>
                                <a href="#">礼仪模特</a>
                                <a href="#">话务客服</a>
                                <a href="#">家教助教</a>
                                <a href="#">充场</a>
                                <a href="#">问卷调查</a>
                            </dd>
                        </dl>
                    </div>
                </div>

                <div class="menu_box">
                    <div class="menu_main">
                        <h2>演艺达人<span></span></h2>
                    </div>
                    <div class="menu_sub dn">
                        <dl class="reset">
                            <dt><a href="#">演艺达人</a></dt>
                            <dd><a href="#">礼仪模特</a>
                                <a href="#">群众演员</a>
                                <a href="#">演出</a>
                            </dd>
                        </dl>
                    </div>
                </div>

                <div class="menu_box">
                    <div class="menu_main">
                        <h2>简单易做<span></span></h2>
                    </div>
                    <div class="menu_sub dn">
                        <dl class="reset">
                            <dt><a href="#">简单易做</a></dt>
                            <dd><a href="#">传单派发</a>
                                <a href="#">打包分拣</a>
                                <a href="#">充场</a>
                                <a href="#">问卷调查</a>
                                <a href="#">审核录入</a>
                                <a href="#">保洁</a>
                                <a href="#">地推拉访</a>
                            </dd>
                        </dl>
                    </div>
                </div>

                <div class="menu_box">
                    <div class="menu_main">
                        <h2>跑腿办事<span></span></h2>
                    </div>
                    <div class="menu_sub dn">
                        <dl class="reset">
                            <dt><a href="#">跑腿办事</a></dt>
                            <dd><a href="#">挂号排队</a>
                                <a href="#">送餐员</a>
                                <a href="#">宠物寄养</a>
                                <a href="#">车票代购</a>
                            </dd>
                        </dl>
                    </div>
                </div>

                <div class="menu_box">
                    <div class="menu_main">
                        <h2>室内推荐<span></span></h2>
                    </div>
                    <div class="menu_sub dn">
                        <dl class="reset">
                            <dt><a href="#">室内推荐</a></dt>
                            <dd><a href="#">话务客服</a>
                                <a href="#">促销导购</a>
                                <a href="#">文员</a>
                                <a href="#">展会协助</a>
                            </dd>
                        </dl>
                    </div>
                </div>

                <div class="menu_box">
                    <div class="menu_main">
                        <h2>体力达人<span></span></h2>
                    </div>
                    <div class="menu_sub dn">
                        <dl class="reset">
                            <dt><a href="#">体力达人</a></dt>
                            <dd><a href="#">餐饮工</a>
                                <a href="#">服务员</a>
                                <a href="#">安保</a>
                                <a href="#">会展执行</a>
                                <a href="#">快递配送</a>
                            </dd>
                        </dl>
                    </div>
                </div>

                <div class="menu_box">
                    <div class="menu_main">
                        <h2>专业技能<span></span></h2>
                    </div>
                    <div class="menu_sub dn">
                        <dl class="reset">
                            <dt><a href="#">专业技能</a></dt>
                            <dd><a href="#">司机代驾</a>
                                <a href="#">技师技工</a>
                                <a href="#">美容美发</a>
                                <a href="#">月嫂阿姨</a>
                                <a href="#">销售房产</a>
                                <a href="#">经纪人</a>
                                <a href="#">保险</a>
                                <a href="#">在线老师</a>
                            </dd>
                        </dl>
                    </div>
                </div>

                <div class="menu_box">
                    <div class="menu_main">
                        <h2>特色职位<span></span></h2>
                    </div>
                    <div class="menu_sub dn">
                        <dl class="reset">

                            <dt><a href="#">特色职位</a></dt>
                            <dd><a href="#">校园代理</a>
                                <a href="#">家教助教</a>
                                <a href="#">健身教练</a>
                                <a href="#">翻译</a>
                                <a href="#">婚礼主持</a>
                                <a href="#">摄影摄像</a>
                                <a href="#">旅行导游</a>
                                <a href="#">美工设计</a>
                                <a href="#">创意策划</a>
                                <a href="#">财务会计</a>
                                <a href="#">项目外包</a>
                                <a href="#">软件开发</a>
                            </dd>
                        </dl>
                    </div>
                </div>

                <div class="menu_box">
                    <div class="menu_main">
                        <h2>优秀青年<span></span></h2>
                    </div>
                    <div class="menu_sub dn">
                        <dl class="reset">
                            <dt><a href="#">优秀青年</a></dt>
                            <dd><a href="#">志愿者</a>
                                <a href="#">救生员</a>
                                <a href="#">实习生</a>
                                <a href="#">社会义工</a>
                            </dd>
                        </dl>
                    </div>
                </div>

                <div class="menu_box">
                    <div class="menu_main">
                        <h2>其他<span></span></h2>
                    </div>
                    <div class="menu_sub dn">
                        <dl class="reset">
                            <dt><a href="#">其他</a></dt>
                            <dd><a href="#">临时工</a>
                                <a href="#">其他</a>
                            </dd>
                        </dl>
                    </div>
                </div>

            </div>

            <!-- QQ群 -->
            <div class="qq_group">
                加入<span>学校兼职</span>QQ群
                <div class="f18">跟同行聊聊</div>
                <p>849918037</p>
            </div>

            <!-- 对外合作广告位  -->
            <a href="http://www.w3cplus.com/" target="_blank" class="partnersAd">
                <img src="style/images/w3cplus.png" width="230" height="80" alt="w3cplus" />
            </a>
            <a href="" target="_blank" class="partnersAd">
                <img src="style/images/jquery_school.jpg" width="230" height="80" alt="JQ学校" />
            </a>
            <a href="http://linux.cn/" target="_blank" class="partnersAd">
                <img src="style/images/linuxcn.png" width="230" height="80" alt="Linux中文社区"  />
            </a>
            <a href="http://zt.zhubajie.com/zt/makesite? utm_source=lagou.com&utm_medium=referral&utm_campaign=BD-yl" target="_blank" class="partnersAd">
                <img src="style/images/zhubajie.jpg" width="230" height="80" alt="猪八戒" />
            </a>
            <a href="http://www.imooc.com" target="_blank" class="partnersAd">
                <img src="style/images/muke.jpg" width="230" height="80" alt="幕课网" />
            </a>
            <!-- 	            <a href="http://www.osforce.cn/" target="_blank" class="partnersAd">
     <img src="style/images/osf-lg.jpg" width="230" height="80" alt="开源力量"  />
 </a>
-->
        </div>

        <div class="content">
            <div id="search_box">

                <ul id="searchType">
                    <li class="type_selected">职位</li>
                </ul>

                <div class="searchtype_arrow"></div>
                <input type="text" id="search_input" name="kd" tabindex="1" value="" placeholder="请输入兼职名称，如：话务客服"/>
                <input type="submit" id="search_button" value="搜索"/>

            </div>

            <dl class="hotSearch">
                <dt>热门搜索：</dt>
                <dd><a href="#hotabbing">服务员</a></dd>
                <dd><a href="#hotabbing">促销导购</a></dd>
                <dd><a href="#hotabbing">打包分拣</a></dd>
                <dd><a href="#hotabbing">礼仪模特</a></dd>
                <dd><a href="#hotabbing">话务客服</a></dd>
                <dd><a href="#hotabbing">家教助教</a></dd>
                <dd><a href="#hotabbing">充场</a></dd>
                <dd><a href="#hotabbing">问卷调查</a></dd>
            </dl>

            <div class="breakline"></div>

            <!-- city -->
            <dl class="workplace" id="workplaceSelect">
                <dt class="fl">工作地点：</dt>
                <dd >
                    <a href="#hotabbing" class="current">全国</a>
                    |
                </dd>
                <dd >
                    <a href="#hotabbing" >北京</a>
                    |
                </dd>
                <dd >
                    <a href="#hotabbing" >上海</a>
                    |
                </dd>
                <dd >
                    <a href="#hotabbing" >广州</a>
                    |
                </dd>
                <dd >
                    <a href="#hotabbing" >深圳</a>
                    |
                </dd>
                <dd >
                    <a href="#hotabbing" >成都</a>
                    |
                </dd>
                <dd >
                    <a href="#hotabbing" >杭州</a>
                    |
                </dd>
                <dd >
                    <a href="#hotabbing" >武汉</a>
                    |
                </dd>
                <dd >
                    <a href="#hotabbing" >南京</a>
                    |
                </dd>
                <dd  class="more" >
                    <a href="javascript:;" >其他</a>
                    <div class="triangle citymore_arrow"></div>
                </dd>
                <dd id="box_expectCity" class="searchlist_expectCity dn">
                    <span class="bot"></span>
                    <span class="top"></span>
                    <dl>
                        <dt>ABCDEF</dt>
                        <dd>
                            <span>北京</span><span>长春</span><span>成都</span>
                            <span>重庆</span><span>长沙</span><span>常州</span>
                            <span>东莞</span><span>大连</span><span>佛山</span><span>福州</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>GHIJ</dt>
                        <dd>
                            <span>贵阳</span><span>广州</span><span>哈尔滨</span>
                            <span>合肥</span><span>海口</span><span>杭州</span>
                            <span>惠州</span><span>金华</span><span>济南</span><span>嘉兴</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>KLMN</dt>
                        <dd>
                            <span>昆明</span><span>廊坊</span><span>宁波</span>
                            <span>南昌</span><span>南京</span><span>南宁</span>
                            <span>南通</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>OPQR</dt>
                        <dd>
                            <span>青岛</span><span>泉州</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>STUV</dt>
                        <dd>
                            <span>上海</span><span>石家庄</span><span>绍兴</span>
                            <span>沈阳</span><span>深圳</span><span>苏州</span>
                            <span>天津</span><span>太原</span><span>台州</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>WXYZ</dt>
                        <dd>
                            <span>武汉</span><span>无锡</span><span>温州</span>
                            <span>西安</span><span>厦门</span><span>烟台</span>
                            <span>珠海</span><span>中山</span><span>郑州</span>
                        </dd>
                    </dl>
                </dd>
            </dl>

            <!--/#main_banner-->
            <div id="home_banner">
                <ul class="banner_bg">
                    <li  class="banner_bg_1 current" >
                        <a href="javascript:void(0)" target="_blank"><img src="style/images/d05a2cc6e6c94bdd80e074eb05e37ebd.jpg" width="612" height="160" alt="好买基金——来了就给100万" /></a>
                    </li>
                    <li  class="banner_bg_2" >
                        <a href="javascript:void(0)" target="_blank"><img src="style/images/c9d8a0756d1442caa328adcf28a38857.jpg" width="612" height="160" alt="世界杯放假看球，老板我也要！" /></a>
                    </li>
                    <li  class="banner_bg_3" >
                        <a href="javascript:void(0)" target="_blank"><img src="style/images/d03110162390422bb97cebc7fd2ab586.jpg" width="612" height="160" alt="出北京记——第一站厦门" /></a>
                    </li>
                </ul>
                <div class="banner_control">
                    <em></em>
                    <ul class="thumbs">
                        <li  class="thumbs_1 current" >
                            <i></i>
                            <img src="style/images/4469b1b83b1f46c7adec255c4b1e4802.jpg" width="113" height="42" />
                        </li>
                        <li  class="thumbs_2" >
                            <i></i>
                            <img src="style/images/381b343557774270a508206b3a725f39.jpg" width="113" height="42" />
                        </li>
                        <li  class="thumbs_3" >
                            <i></i>
                            <img src="style/images/354d445c5fd84f1990b91eb559677eb5.jpg" width="113" height="42" />
                        </li>
                    </ul>
                </div>
            </div>

            <ul id="da-thumbs" class="da-thumbs">
                <li >
                    <a href="javascript:void(0)" target="_blank">
                        <img src="style/images/a254b11ecead45bda166afa8aaa9c8bc.jpg" width="113" height="113" alt="联想" />
                        <div class="hot_info">
                            <h2 title="联想">联想</h2>
                            <em></em>
                            <p title="世界因联想更美好">
                                世界因联想更美好
                            </p>
                        </div>
                    </a>
                </li>
                <li >
                    <a href="javascript:void(0)" target="_blank">
                        <img src="style/images/c75654bc2ab141df8218983cfe5c89f9.jpg" width="113" height="113" alt="淘米" />
                        <div class="hot_info">
                            <h2 title="淘米">淘米</h2>
                            <em></em>
                            <p title="将心注入 追求极致">
                                将心注入 追求极致
                            </p>
                        </div>
                    </a>
                </li>
                <li >
                    <a href="javascript:void(0)" target="_blank">
                        <img src="style/images/2bba2b71d0b0443eaea1774f7ee17c9f.png" width="113" height="113" alt="优酷土豆" />
                        <div class="hot_info">
                            <h2 title="优酷土豆">优酷土豆</h2>
                            <em></em>
                            <p title="专注于视频领域，是中国网络视频行业领军企业">
                                专注于视频领域，是中国网络视频行业领军企业
                            </p>
                        </div>
                    </a>
                </li>
                <li >
                    <a href="javascript:void(0)" target="_blank">
                        <img src="style/images/f4822a445a8b495ebad81fcfad3e40e2.jpg" width="113" height="113" alt="思特沃克" />
                        <div class="hot_info">
                            <h2 title="思特沃克">思特沃克</h2>
                            <em></em>
                            <p title="一家全球信息技术服务公司">
                                一家全球信息技术服务公司
                            </p>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)" target="_blank">
                        <img src="style/images/5caf8f9631114bf990f87bb11360653e.png" width="113" height="113" alt="奇猫" />
                        <div class="hot_info">
                            <h2 title="奇猫">奇猫</h2>
                            <em></em>
                            <p title="专注于移动互联网、互联网产品研发">
                                专注于移动互联网、互联网产品研发
                            </p>
                        </div>
                    </a>
                </li>
                <li  class="last" >
                    <a href="javascript:void(0)" target="_blank">
                        <img src="style/images/c0052c69ef4546c3b7d08366d0744974.jpg" width="113" height="113" alt="堆糖网" />
                        <div class="hot_info">
                            <h2 title="堆糖网">堆糖网</h2>
                            <em></em>
                            <p title="分享收集生活中的美好，遇见世界上的另外一个你">
                                分享收集生活中的美好，遇见世界上的另外一个你
                            </p>
                        </div>
                    </a>
                </li>
            </ul>

            <ul class="reset hotabbing" id="hotabbing">
                <li class="current">热门职位</li>
                <%--<li>最新职位</li>--%><%--<li>最新职位</li>--%>
            </ul>

            <div class="content">
                <ul class="hot_pos reset" id="allRe"></ul>
            </div>

            <!-- 分页导航 -->
            <div class="Pagination"></div>

            <!-- 外部链接 -->
            <div id="linkbox">
                <dl>
                    <dt>友情链接</dt>
                    <dd>
                        <a href="http://www.zhuqu.com/" target="_blank">住趣家居网</a> <span>|</span>
                        <a href="http://www.woshipm.com/" target="_blank">人人都是产品经理</a> <span>|</span>
                        <a href="http://zaodula.com/" target="_blank">互联网er的早读课</a> <span>|</span>
                        <a href="http://lieyunwang.com/" target="_blank">猎云网</a> <span>|</span>
                        <a href="http://www.ucloud.cn/" target="_blank">UCloud</a> <span>|</span>
                        <a href="http://www.iconfans.com/" target="_blank">iconfans</a>  <span>|</span>
                        <a href="http://www.html5dw.com/" target="_blank">html5梦工厂</a>   <span>|</span>
                        <a href="http://www.sykong.com/" target="_blank">手游那点事</a>

                        <a href="http://www.php100.com/" target="_blank">php100</a> <span>|</span>
                        <a href="http://www.uehtml.com/" target="_blank">uehtml</a> <span>|</span>
                        <a href="http://www.w3cplus.com/" target="_blank">W3CPlus</a> <span>|</span>
                        <a href="http://www.boxui.com/" target="_blank">盒子UI</a> <span>|</span>
                        <a href="http://www.uimaker.com/" target="_blank">uimaker</a> <span>|</span>
                        <a href="http://www.yixieshi.com/" target="_blank">互联网的一些事</a> <span>|</span>
                        <a href="http://www.chuanke.com/" target="_blank">传课网</a> <span>|</span>
                        <a href="http://www.eoe.cn/" target="_blank">安卓开发</a> <span>|</span>
                        <a href="http://www.eoeandroid.com/" target="_blank">安卓开发论坛</a>
                        <a href="http://hao.360.cn/" target="_blank" >360安全网址导航</a> <span>|</span>
                        <a href="http://se.360.cn/" target="_blank" >360安全浏览器</a> <span>|</span>
                        <a href="http://www.hao123.com/" target="_blank" >hao123上网导航</a> <span>|</span>
                        <a href="http://www.ycpai.com" target="_blank" >互联网创业</a><span>|</span>
                        <a href="http://www.zhongchou.cn" target="_blank" >众筹网</a><span>|</span>
                        <a href="http://www.marklol.com/" target="_blank" >马克互联网</a><span>|</span>
                        <a href="http://www.chaohuhr.com/" target="_blank" >巢湖英才网</a>

                        <a href="http://www.zhubajie.com/" target="_blank" >创意服务外包</a><span>|</span>
                        <a href="http://www.thinkphp.cn/" target="_blank" >thinkphp</a><span>|</span>
                        <a href="http://www.chuangxinpai.com/" target="_blank" >创新派</a><span>|</span>

                        <a href="http://w3cshare.com/" target="_blank" >W3Cshare</a><span>|</span>
                        <a href="http://www.518lunwen.cn/" target="_blank" >论文发表网</a><span>|</span>
                        <a href="http://www.199it.com" target="_blank" >199it</a><span>|</span>

                        <a href="http://www.shichangbu.com" target="_blank" >市场部网</a><span>|</span>
                        <a href="http://www.meitu.com/" target="_blank" >美图公司</a><span>|</span>
                        <a href="https://www.teambition.com/" target="_blank" >Teambition</a>
                        <a href="http://oupeng.com/" target="_blank" >欧朋浏览器</a><span>|</span>
                        <a href="http://iwebad.com/" target="_blank">网络广告人社区</a>
                        <a href="h/af/flink.html" target="_blank" class="more">更多</a>
                    </dd>
                </dl>
            </div>
        </div>

        <style>
                .ui-autocomplete {
                    width: 488px;
                    background: #fafafa !important;
                    position: relative;
                    z-index: 10;
                    border: 2px solid #91cebe;
                }

                .ui-autocomplete-category {
                    font-size: 16px;
                    color: #999;
                    width: 50px;
                    position: absolute;
                    z-index: 11;
                    right: 0px; /*top: 6px; */
                    text-align: center;
                    border-top: 1px dashed #e5e5e5;
                    padding: 5px 0;
                }

                .ui-menu-item {
                    *width: 439px;
                    vertical-align: middle;
                    position: relative;
                    margin: 0px;
                    margin-right: 50px !important;
                    background: #fff;
                    border-right: 1px dashed #ededed;
                }

                .ui-menu-item a {
                    display: block;
                    overflow: hidden;
                }
            </style>

            <!-- <div id="loginToolBar">
                <div>
                    <em></em>
                    <img src="style/images/footbar_logo.png" width="138" height="45" />
                    <span class="companycount"></span>
                    <span class="positioncount"></span>
                    <a href="#loginPop" class="bar_login inline" title="登录"><i></i></a>
                    <div class="right">
                        <a href="register.html?from=index_footerbar" onclick="_hmt.push(['_trackEvent', 'button', 'click', 'register'])" class="bar_register" id="bar_register" target="_blank"><i></i></a>
                    </div>
                    <input type="hidden" id="cc" value="16002" />
                    <input type="hidden" id="cp" value="96531" />
                </div>
            </div>
             -->
            <!-------------------------------------弹窗lightbox  ----------------------------------------->
            <div style="display:none;">
                <!-- 登录框 -->
                <div id="loginPop" class="popup" style="height:240px;">
                    <form id="loginForm">
                        <input type="text" id="email" name="email" tabindex="1" placeholder="请输入登录邮箱地址"/>
                        <input type="password" id="password" name="password" tabindex="2" placeholder="请输入密码"/>
                        <span class="error" style="display:none;" id="beError"></span>
                        <label class="fl" for="remember"><input type="checkbox" id="remember" value="" checked="checked"
                                                                name="autoLogin"/> 记住我</label>
                        <a href="h/reset.html" class="fr">忘记密码？</a>
                        <input type="submit" id="submitLogin" value="登 &nbsp; &nbsp; 录"/>
                    </form>
                    <div class="login_right">
                        <div>还没有帐号？</div>
                        <a href="register.html" class="registor_now">立即注册</a>
                        <div class="login_others">使用以下帐号直接登录:</div>
                        <a href="h/ologin/auth/sina.html" target="_blank" id="icon_wb" class="icon_wb"
                           title="使用新浪微博帐号登录"></a>
                        <a href="h/ologin/auth/qq.html" class="icon_qq" id="icon_qq" target="_blank"
                           title="使用腾讯QQ帐号登录"></a>
                    </div>
                </div><!--/#loginPop-->
            </div>
        </div>
    </div>
</div>
            <!------------------------------------- end ----------------------------------------->
            <script type="text/javascript" src="style/js/Chart.min.js"></script>
            <script type="text/javascript" src="style/js/home.min.js"></script>
            <script type="text/javascript" src="style/js/count.js"></script>


            <script type="text/javascript" src="style/js/core.min.js"></script>
            <script type="text/javascript" src="style/js/popup.min.js"></script>

            <!-- <script src="style/js/wb.js" type="text/javascript" charset="utf-8"></script>
             -->
</body>
</html>