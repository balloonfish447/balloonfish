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

    <title>系统管理首页</title>


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
    <link id="theme" href="css/themes/type-c/theme-navy.min.css" rel="stylesheet">
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
						<h3>欢迎使用校园社团管理系统</h3>
						<p>希望大家能够多多提供建议，之后不断改进完善，建立一个实用，适用的管理平台</p>
					</div>
				</div>


                <!--Page content-->
                <!--===================================================-->
                <div id="page-content">

					    <div class="row">

					        <div class="col-lg-12">
<%--					            <div class="row">--%>
<%--					                <div class="col-sm-12 col-lg-12">--%>

<%--					                    <!--Sparkline Area Chart-->--%>
<%--					                    <div class="panel panel-success panel-colorful">--%>
<%--					                        <div class="pad-all" id="liulanqi">--%>
<%--					                            <p class="text-lg text-semibold"><i class="demo-pli-data-storage icon-fw"></i> ----</p>--%>

<%--					                        </div>--%>

<%--					                        <div class="pad-top text-center">--%>

<%--					                            <!--Placeholder-->--%>
<%--					                            <div id="demo-sparkline-area" class="sparklines-full-content"></div>--%>
<%--					                        </div>--%>
<%--					                    </div>--%>
<%--					                </div>--%>

<%--					            </div>--%>


					            <!--Extra Small Weather Widget-->
					            <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					            <div class="panel">
					                <div class="panel-body text-center clearfix">
					                    <div class="col-sm-4 pad-top">
											<div id="bingtu" style="height: 500px;width: 900px"></div>
					                       <%-- <div class="text-lg">
					                            <p class="text-5x text-thin text-main">2019</p>
					                        </div>
					                        <p class="text-sm text-bold text-uppercase">开始使用</p>--%>
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
	<script src="js/echarts.js"></script>

    <!--BootstrapJS [ RECOMMENDED ]-->
    <script src="js/bootstrap.min.js"></script>


    <!--NiftyJS [ RECOMMENDED ]-->
    <script src="js/nifty.min.js"></script>


    <!--=================================================-->

    <!--布局修改js-->
   <!-- <script src="js/demo/nifty-demo.min.js"></script>-->

	<script>

		$(function () {
            // var jis =[];//数量
            // var bis =[];//名字
            // $.ajax({
            //     url:'../system/getecharts',
            //     type:'post',
            //     dataType:'json',
            //     async:false,
            //     success:function(data) {
            //
            //         jis = data.jis;
            //         bis = data.bis;
            //     }});



            // 绘制图表。
            echarts.init(document.getElementById('bingtu')).setOption({
                title: {
                    text: '社团概览'
                },
                tooltip: {},
                legend: {
                    data:['人数']
                },
                xAxis: {
                    type: 'category',
                    data: ['滑板社', '吉他社', '美食社', '街舞社', '自强社', '桌游社', '旅游社','摄影社', '骑行社', '足球社', '汉服社', '电子社', '绘画社', 'cos社']
                   // data:bis
                },
                yAxis: {
                    type: 'value'
                },
                series: [{
                    data: [120, 200, 150, 80, 70, 110, 130,120, 200, 150, 80, 70, 110, 130],
                   // data:jis,
                    type: 'bar'
                }]
            });



        })




	</script>




</body>
</html>
