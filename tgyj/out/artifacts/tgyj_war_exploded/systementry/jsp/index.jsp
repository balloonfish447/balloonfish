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
	<link href="css/demo/iconfont.css" rel="stylesheet">
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
						<h3>欢迎使用唐宫银匠后台管理系统</h3>
						<p>提供你的意见和建议帮助更好的完善和使用管理平台，该平台旨在提高和帮助完成相应的业务使用</p>
					</div>
				</div>

                
                <!--Page content-->
                <!--===================================================-->
                <div id="page-content">

					    <div class="row">

					        <div class="col-lg-12">
					            <div class="row">
					                <div class="col-sm-12 col-lg-12">

					                    <!--Sparkline Area Chart-->
					                    <div class="panel panel-success panel-colorful">
					                        <div class="pad-all" id="liulanqi">
					                            <p class="text-lg text-semibold"><i class="demo-pli-data-storage icon-fw"></i> 浏览器信息：</p>

					                        </div>
					                        <div class="pad-top text-center">
					                            <!--Placeholder-->
					                            <div id="demo-sparkline-area" class="sparklines-full-content"></div>
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
					                            <p class="text-5x text-thin text-main">2019</p>
					                        </div>
					                        <p class="text-sm text-bold text-uppercase">开始使用</p>
					                    </div>
					                    <div class="col-sm-8">



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

	<script>

		$(function () {
            //获取浏览器相关信息
            txt = "<p>浏览器代号: " + navigator.appCodeName + "</p>";
            txt+= "<p>浏览器名称: " + navigator.appName + "</p>";
            txt+= "<p>浏览器版本: " + navigator.appVersion + "</p>";
            txt+= "<p>启用Cookies: " + navigator.cookieEnabled + "</p>";
            txt+= "<p>硬件平台: " + navigator.platform + "</p>";
            txt+= "<p>用户代理: " + navigator.userAgent + "</p>";
            txt+= "<p>用户代理语言: " + navigator.systemLanguage + "</p>";
            $("#liulanqi").append(txt)


        })




	</script>




</body>
</html>
