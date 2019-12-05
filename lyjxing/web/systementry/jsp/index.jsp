<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath(); //  path = "/travel"
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/systementry/";
%>
<!DOCTYPE html>
<html lang="en">


<head>
    <base href=" <%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>系统管理-模板</title>


    <!--Bootstrap Stylesheet [ REQUIRED ]-->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!--Nifty Stylesheet [ REQUIRED ]-->
    <link href="css/nifty.min.css" rel="stylesheet">
    <!--Nifty Premium Icon [ DEMONSTRATION ]-->
    <link href="css/demo/nifty-demo-icons.min.css" rel="stylesheet">
    <!--加载进度线插件-->
    <link href="plugins/pace/pace.min.css" rel="stylesheet">
    <script src="plugins/pace/pace.min.js"></script>
    <!--Demo [ DEMONSTRATION ]-->
    <link href="css/demo/nifty-demo.min.css" rel="stylesheet">
    <link id="theme" href="css/themes/type-d/theme-navy.min.css" rel="stylesheet">
</head>
<body>
    <div id="container" class="effect aside-float aside-bright mainnav-lg navbar-fixed mainnav-fixed ">
        
    <jsp:include page="comment/header.jsp"></jsp:include>

        <div class="boxed">

            <!--CONTENT CONTAINER-->
            <!--===================================================-->
            <div id="content-container">
                <div id="page-head">
                    
					<div class="pad-all text-center">
						<h3>欢迎访问文章管理与发布系统</h3>
						<p>提供你的意见和建议帮助更好的完善和使用管理平台，该平台旨在提高和帮助完成相应的业务使用</p>
					</div>
				</div>

                
                <!--Page content-->
                <!--===================================================-->
                <div id="page-content">

					    <div class="row">

					        <div class="col-lg-12">
					            <div class="row">
					                <div class="col-sm-6 col-lg-6">

					                    <!--Sparkline Area Chart-->
					                    <div class="panel panel-success panel-colorful">
					                        <div class="pad-all">
					                            <p class="text-lg text-semibold"><i class="demo-pli-data-storage icon-fw"></i> HDD Usage</p>
					                            <p class="mar-no">
					                                <span class="pull-right text-bold">132Gb</span> Free Space
					                            </p>
					                            <p class="mar-no">
					                                <span class="pull-right text-bold">1,45Gb</span> Used space
					                            </p>
					                        </div>
					                        <div class="pad-top text-center">
					                            <!--Placeholder-->
					                            <div id="demo-sparkline-area" class="sparklines-full-content"></div>
					                        </div>
					                    </div>
					                </div>
					                <div class="col-sm-6 col-lg-6">

					                    <!--Sparkline Line Chart-->
					                    <div class="panel panel-info panel-colorful">
					                        <div class="pad-all">
					                            <p class="text-lg text-semibold">Earning</p>
					                            <p class="mar-no">
					                                <span class="pull-right text-bold">$764</span> Today
					                            </p>
					                            <p class="mar-no">
					                                <span class="pull-right text-bold">$1,332</span> Last 7 Day
					                            </p>
					                        </div>
					                        <div class="pad-top text-center">

					                            <!--Placeholder-->
					                            <div id="demo-sparkline-line" class="sparklines-full-content"></div>

					                        </div>
					                    </div>
					                </div>
					            </div>
					            <div class="row">
					                <div class="col-sm-6 col-lg-6">

					                    <!--Sparkline bar chart -->
					                    <div class="panel panel-purple panel-colorful">
					                        <div class="pad-all">
					                            <p class="text-lg text-semibold"><i class="demo-pli-basket-coins icon-fw"></i> Sales</p>
					                            <p class="mar-no">
					                                <span class="pull-right text-bold">$764</span> Today
					                            </p>
					                            <p class="mar-no">
					                                <span class="pull-right text-bold">$1,332</span> Last 7 Day
					                            </p>
					                        </div>
					                        <div class="text-center">

					                            <!--Placeholder-->
					                            <div id="demo-sparkline-bar" class="box-inline"></div>

					                        </div>
					                    </div>
					                </div>
					                <div class="col-sm-6 col-lg-6">

					                    <!--Sparkline pie chart -->
					                    <div class="panel panel-warning panel-colorful">
					                        <div class="pad-all">
					                            <p class="text-lg text-semibold">Task Progress</p>
					                            <p class="mar-no">
					                                <span class="pull-right text-bold">34</span> Completed
					                            </p>
					                            <p class="mar-no">
					                                <span class="pull-right text-bold">79</span> Total
					                            </p>
					                        </div>
					                        <div class="pad-all">
					                            <div class="pad-btm">
					                                <div class="progress progress-sm">
					                                    <div style="width: 45%;" class="progress-bar progress-bar-light">
					                                        <span class="sr-only">45%</span>
					                                    </div>
					                                </div>
					                            </div>
					                            <div class="pad-btm">
					                                <div class="progress progress-sm">
					                                    <div style="width: 89%;" class="progress-bar progress-bar-light">
					                                        <span class="sr-only">89%</span>
					                                    </div>
					                                </div>
					                            </div>
					                        </div>
					                    </div>
					                </div>
					            </div>


					            <!--Extra Small Weather Widget-->
					            <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					            <div class="panel">
					                <div class="panel-body text-center clearfix">
					                    <div class="col-sm-4 pad-top">
					                        <div class="text-lg">
					                            <p class="text-5x text-thin text-main">95</p>
					                        </div>
					                        <p class="text-sm text-bold text-uppercase">New Friends</p>
					                    </div>
					                    <div class="col-sm-8">
					                        <button class="btn btn-pink mar-ver">View Details</button>
					                        <p class="text-xs">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p>
					                        <ul class="list-unstyled text-center bord-top pad-top mar-no row">
					                            <li class="col-xs-4">
					                                <span class="text-lg text-semibold text-main">1,345</span>
					                                <p class="text-sm text-muted mar-no">Following</p>
					                            </li>
					                            <li class="col-xs-4">
					                                <span class="text-lg text-semibold text-main">23K</span>
					                                <p class="text-sm text-muted mar-no">Followers</p>
					                            </li>
					                            <li class="col-xs-4">
					                                <span class="text-lg text-semibold text-main">278</span>
					                                <p class="text-sm text-muted mar-no">Post</p>
					                            </li>
					                        </ul>
					                    </div>
					                </div>
					            </div>

					            <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					            <!--End Extra Small Weather Widget-->


					        </div>
					    </div>


					
					
					    
                </div>
                <!--===================================================-->
                <!--End page content-->

            </div>
            <!--===================================================-->
            <!--END CONTENT CONTAINER-->


            
            <jsp:include page="comment/nav_left.jsp"></jsp:include>
            <jsp:include page="comment/nav_right.jsp"></jsp:include>
            


        </div>
	<jsp:include page="comment/footer.jsp"></jsp:include>

    </div>
    <!--===================================================-->
    <!-- END OF CONTAINER -->

    
    <!--JAVASCRIPT-->
    <!--=================================================-->

    <!--jQuery [ REQUIRED ]-->
    <script src="js/jquery.min.js"></script>


    <!--BootstrapJS [ RECOMMENDED ]-->
    <script src="js/bootstrap.min.js"></script>


    <!--NiftyJS [ RECOMMENDED ]-->
    <script src="js/nifty.min.js"></script>


    <!--=================================================-->
    
    <!--布局修改js-->
   <!-- <script src="js/demo/nifty-demo.min.js"></script>-->




</body>
</html>
