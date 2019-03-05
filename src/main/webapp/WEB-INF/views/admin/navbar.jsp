<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!-- Navigation Bar-->
<header id="topnav">
    <div class="topbar-main">
        <div class="container-fluid">

            <!-- Logo container-->
            <div class="logo">
                <a href="navbar.html" class="logo">
                    <img src="assets/images/logo_sm.png" alt="" height="26" class="logo-small">
                    <img src="assets/images/logo.png" alt="" height="16" class="logo-large">
                </a>
            </div>
            <!-- End Logo container-->

            <div class="menu-extras topbar-custom">

                <ul class="list-unstyled topbar-right-menu float-right mb-0">

                    <li class="menu-item">
                        <!-- Mobile menu toggle-->
                        <a class="navbar-toggle nav-link">
                            <div class="lines">
                                <span></span>
                                <span></span>
                                <span></span>
                            </div>
                        </a>
                        <!-- End mobile menu toggle-->
                    </li>

                    <li class="dropdown notification-list">
                        <a class="nav-link dropdown-toggle waves-effect waves-light nav-user" data-toggle="dropdown" href="#" role="button"
                           aria-haspopup="false" aria-expanded="false">
                            <img src="assets/images/users/avatar-1.jpg" alt="user" class="rounded-circle"> <span class="ml-1 pro-user-name">Admin <i class="mdi mdi-chevron-down"></i> </span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
                            <!-- item-->
                            <div class="dropdown-item noti-title">
                                <h6 class="text-overflow m-0">Welcome !</h6>
                            </div>

                            <!-- item-->
                            <a href="javascript:void(0);" class="dropdown-item notify-item">
                                <i class="fi-head"></i> <span>My Account</span>
                            </a>

                            <!-- item-->
                            <a href="outAdmin" class="dropdown-item notify-item">
                                <i class="fi-power"></i> <span>Logout</span>
                            </a>

                        </div>
                    </li>
                </ul>
            </div>
            <!-- end menu-extras -->

            <div class="clearfix"></div>

        </div> <!-- end container -->
    </div>
    <!-- end topbar-main -->

    <div class="navbar-custom">
        <div class="container-fluid">
            <div id="navigation">
                <!-- Navigation Menu-->
                <ul class="navigation-menu">

                    <li class="has-submenu">
                        <a href="dashboard"><i class="fi-air-play"></i>Dashboard</a>
                    </li>

                    <li class="has-submenu">
                        <a href="#"><i class="fi-bar-graph-2"></i>User Management</a>
                        <ul class="submenu">
                            <li><a href="userlist">User List</a></li>
                            <%--<li class="has-submenu">
                                <a href="#">Company List</a>
                                <ul class="submenu">
                                    <li><a href="#">Statue for Running</a></li>
                                    <li><a href="#">Statue for Pending</a></li>
                                </ul>
                            </li>--%>
                        </ul>
                    </li>

                    <li class="has-submenu">
                        <a href="#"><i class="fi-bar-graph-2"></i>Contract Management</a>
                        <ul class="submenu">
                            <li><a href="#">Contract List</a></li>
                        </ul>
                    </li>

                    <li class="has-submenu">
                        <a href="#"><i class="fi-bar-graph-2"></i>Notice Management</a>
                        <ul class="submenu">
                            <li><a href="partlist">Notice List</a></li>
                        </ul>
                    </li>

                </ul>
                <!-- End navigation menu -->
            </div> <!-- end #navigation -->
        </div> <!-- end container -->
    </div> <!-- end navbar-custom -->
</header>
<!-- End Navigation Bar-->