<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<!--MAIN NAVIGATION-->
<!--===================================================-->
<nav id="mainnav-container">
    <div id="mainnav">

        <!--Menu-->
        <!--================================-->
        <div id="mainnav-menu-wrap">
            <div class="nano">
                <div class="nano-content">

                    <!--用户信息设定-->
                    <!--================================-->
                    <div id="mainnav-profile" class="mainnav-profile">
                        <div class="profile-wrap text-center">
                            <div class="pad-btm">
                                <img class="img-circle img-md" src="img/profile-photos/1.png" alt="Profile Picture">
                            </div>
                            <a href="#profile-nav" class="box-block" data-toggle="collapse" aria-expanded="false">
                                            <span class="pull-right dropdown-toggle">
                                                <i class="dropdown-caret"></i>
                                            </span>
                                <p class="mnp-name">${sessionScope.USERINFO.username}</p>
                                <span class="mnp-desc">${sessionScope.USERINFO.email}</span>
                            </a>
                        </div>
                        <div id="profile-nav" class="collapse list-group bg-trans">

                            <a href="jsp/userset.jsp" class="list-group-item">
                                <i class="demo-pli-gear icon-lg icon-fw"></i> 设定
                            </a>

                            <a href="jsp/login.jsp" class="list-group-item">
                                <i class="demo-pli-unlock icon-lg icon-fw"></i> 退出
                            </a>
                        </div>
                    </div>

                    <ul id="mainnav-menu" class="list-group">
                        <!--Menu list item-->
                        <li class="active-sub">
                            <a href="jsp/index.jsp">
                                <i class="demo-pli-home"></i>
                                <span class="menu-title">首页</span>
                                <i class="arrow"></i>
                            </a>

                            
                        </li>
                        <!--Menu list item-->
                        <li>
                            <a href="#">
                                <i class="demo-pli-gear"></i>
                                <span class="menu-title">系统管理</span>
                                <i class="arrow"></i>
                            </a>
                            <ul>
                                <li><a href="../link/tosysuser">用户管理</a></li>
                                <li><a href="../link/tosysorg">组织管理</a></li>
                                <li><a href="../link/tosyspower">权限管理</a></li>
                                <li><a href="../link/tosysrole">角色管理</a></li>

                            </ul>

                        </li>

                        <li class="list-divider"></li>

                        <!--Category name-->
                        <li class="list-header">客户信息发布</li>

                        <!--Menu list item-->
                        <li>
                            <a href="#">
                                <i class="demo-pli-speech-bubble-5"></i>
                                <span class="menu-title">信息管理</span>
                                <i class="arrow"></i>
                            </a>

                            <!--Submenu-->
                            <ul class="collapse">
                                <li><a href="jsp/addnews.jsp">文章发布</a></li>
                                <li><a href="../set/user_index">文章管理</a></li>

                            </ul>
                        </li>
                        <li class="list-divider"></li>

    </ul>



                    <div class="mainnav-widget">

                        <!-- Show the button on collapsed navigation -->
                        <div class="show-small">
                            <a href="#" data-toggle="menu-widget" data-target="#demo-wg-server">
                                <i class="demo-pli-monitor-2"></i>
                            </a>
                        </div>

                        <!-- Hide the content on collapsed navigation -->
                        <div id="demo-wg-server" class="hide-small mainnav-widget-content">
                            <ul class="list-group">
                                <li class="list-header pad-no mar-ver">服务器状态</li>
                                <li class="mar-btm">
                                    <span class="label label-primary pull-right">75%</span>
                                    <p>CPU Usage</p>
                                    <div class="progress progress-sm">
                                        <div class="progress-bar progress-bar-primary" style="width: 75%;">
                                            <span class="sr-only">75%</span>
                                        </div>
                                    </div>
                                </li>
                                <li class="mar-btm">
                                    <span class="label label-purple pull-right">65%</span>
                                    <p>Bandwidth</p>
                                    <div class="progress progress-sm">
                                        <div class="progress-bar progress-bar-purple" style="width: 65%;">
                                            <span class="sr-only">65%</span>
                                        </div>
                                    </div>
                                </li>
                                <li class="pad-ver"><a href="JavaScript::#" class="btn btn-success btn-bock">查看详情</a></li>
                            </ul>
                        </div>
                    </div>


                </div>
            </div>
        </div>
        <!--================================-->
        <!--End menu-->

    </div>
</nav>
<!--===================================================-->
<!--END MAIN NAVIGATION-->
</body>
</html>
