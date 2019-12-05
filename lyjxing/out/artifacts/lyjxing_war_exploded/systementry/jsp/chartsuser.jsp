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

    <title>数据图表</title>

    <!--bootstrap样式-->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!--核心样式-->
    <link href="css/nifty.min.css" rel="stylesheet">


    <!--ico小图标-->
    <link href="css/demo/nifty-demo-icons.min.css" rel="stylesheet">

	<!--页面加载进度条  -->
    <link href="plugins/pace/pace.min.css" rel="stylesheet">
    <script src="plugins/pace/pace.min.js"></script>

    <!--模板样式-->
    <link href="css/demo/nifty-demo.min.css" rel="stylesheet">

	<%--模板风格--%>
	<link  href="css/themes/type-d/theme-navy.min.css" rel="stylesheet">    
</head>


<body>
    <div id="container" class="effect aside-float aside-bright mainnav-lg navbar-fixed mainnav-fixed">
        
        <!--NAVBAR-->
        <jsp:include page="comment/header.jsp"></jsp:include>
        <!--END NAVBAR-->

        <div class="boxed">

            <!--CONTENT CONTAINER-->
            <!--===================================================-->
            <div id="content-container">
                <div id="page-head">
                    
                    <!--Page Title-->
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <div id="page-title">
                        <h1 class="page-header text-overflow">用户数据统计</h1>
                    </div>
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <!--End page title-->


                    <!--Breadcrumb-->
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <ol class="breadcrumb">
					<li><a href="#"><i class="demo-pli-home"></i></a></li>
					<li><a href="#">用户数据</a></li>
					<li class="active">echarts JS</li>
                    </ol>
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <!--End breadcrumb-->

                </div>

                
                <!--Page content-->
                <!--===================================================-->
                <div id="page-content">
                    
					    <div class="row">
					        <div class="col-md-6">
					
					
					            <!-- Area Chart -->
					            <!---------------------------------->
					            <div class="panel">
					                <div class="panel-heading">
					                    <h3 class="panel-title">面积图</h3>
					                </div>
					                <div class="pad-all">
					                  	<div id="chart1" style="height: 280px"></div>
					                </div>
					            </div>
					            <!---------------------------------->
					
					
					        </div>
					        <div class="col-md-6">
					
					            <!-- Line Chart -->
					            <!---------------------------------->
					            <div class="panel">
					                <div class="panel-heading">
					                    <h3 class="panel-title">线图</h3>
					                </div>
					                <div class="pad-all">
					                   <div id="chart2" style="height: 280px"></div>
					                </div>
					            </div>
					            <!---------------------------------->
					
					
					        </div>
					    </div>
					
					
					    <!-- Morris JS Full Content -->
					    <!---------------------------------->
					    <div class="panel">
					        <div class="panel-body">
					           <div id="chart3" style="height: 280px"></div>
					            <div class="">
					                <h4>Morris JS Full Content</h4>
					                <p>Please make sure to add class <code>morris-full-content</code> to display the chart full content.</p>
					            </div>
					        </div>
					    </div>
					    <!---------------------------------->
					
					
					    <div class="row">
					        <div class="col-md-7">
					
					
					            <!-- Bar Chart -->
					            <!---------------------------------->
					            <div class="panel">
					                <div class="panel-heading">
					                    <h3 class="panel-title">Bar Chart</h3>
					                </div>
					                <div class="panel-body">
					                  
					                </div>
					            </div>
					            <!---------------------------------->
					
					
					        </div>
					        <div class="col-md-5">
					
					
					            <!-- Donut Chart -->
					            <!---------------------------------->
					            <div class="panel">
					                <div class="panel-heading">
					                    <h3 class="panel-title">Donut Chart</h3>
					                </div>
					                <div class="panel-body">
					                 
					                </div>
					            </div>
					        </div>
					    </div>

                </div>
                <!--===================================================-->
                <!--End page content-->

            </div>
            <!--===================================================-->
            <!--END CONTENT CONTAINER-->
        
            <!--ASIDE-->
          	<jsp:include page="comment/nav_left.jsp"></jsp:include> 
            <!--END ASIDE-->

            
            <!--MAIN NAVIGATION-->
            <jsp:include page="comment/nav_right.jsp"></jsp:include> 
            <!--END MAIN NAVIGATION-->

        </div>

        <!-- FOOTER -->
        <jsp:include page="comment/footer.jsp"></jsp:include> 
        <!-- END FOOTER -->


        <!-- 右下角按钮 -->
       
        <button class="scroll-top btn">
            <i class="pci-chevron chevron-up"></i>
        </button>


    </div>
    
 
    <!--jQuery [ REQUIRED ]-->
    <script src="js/jquery.min.js"></script>

    <!--BootstrapJS [ RECOMMENDED ]-->
    <script src="js/bootstrap.min.js"></script>

    <!--NiftyJS [ RECOMMENDED ]-->
    <script src="js/nifty.min.js"></script>
    
    <script src="js/echarts.js"></script>
	
	
	<script type="text/javascript">
	// 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('chart1'));

    // 指定图表的配置项和数据
    var option = {
    title: {
    	left: 'center',
        text: '堆叠区域图'
    },
    tooltip : {
        trigger: 'axis',
        axisPointer: {
            type: 'cross',
            label: {
                backgroundColor: '#6a7985'
            }
        }
    },
    legend: {
        data:['邮件营销','联盟广告','视频广告','直接访问','搜索引擎']
    },
    toolbox: {
        feature: {
            saveAsImage: {}
        }
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis : [
        {
            type : 'category',
            boundaryGap : false,
            data : ['周一','周二','周三','周四','周五','周六','周日']
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:'邮件营销',
            type:'line',
            stack: '总量',
            areaStyle: {},
            data:[120, 132, 101, 134, 90, 230, 210]
        },
        {
            name:'联盟广告',
            type:'line',
            stack: '总量',
            areaStyle: {},
            data:[220, 182, 191, 234, 290, 330, 310]
        },
        {
            name:'视频广告',
            type:'line',
            stack: '总量',
            areaStyle: {},
            data:[150, 232, 201, 154, 190, 330, 410]
        },
        {
            name:'直接访问',
            type:'line',
            stack: '总量',
            areaStyle: {normal: {}},
            data:[320, 332, 301, 334, 390, 330, 320]
        },
        {
            name:'搜索引擎',
            type:'line',
            stack: '总量',
            label: {
                normal: {
                    show: true,
                    position: 'top'
                }
            },
            areaStyle: {normal: {}},
            data:[820, 932, 901, 934, 1290, 1330, 1320]
        }
    ]
};

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
	</script>
	
	
	<script type="text/javascript">
	// 基于准备好的dom，初始化echarts实例
    var myChart2 = echarts.init(document.getElementById('chart2'));
	var option2 = {
		    title : {
		        text: '某地区蒸发量和降水量',
		        subtext: '纯属虚构'
		    },
		    tooltip : {
		        trigger: 'axis'
		    },
		    legend: {
		        data:['蒸发量','降水量']
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            dataView : {show: true, readOnly: false},
		            magicType : {show: true, type: ['line', 'bar']},
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    calculable : true,
		    xAxis : [
		        {
		            type : 'category',
		            data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		            name:'蒸发量',
		            type:'bar',
		            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
		            markPoint : {
		                data : [
		                    {type : 'max', name: '最大值'},
		                    {type : 'min', name: '最小值'}
		                ]
		            },
		            markLine : {
		                data : [
		                    {type : 'average', name: '平均值'}
		                ]
		            }
		        },
		        {
		            name:'降水量',
		            type:'bar',
		            data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3],
		            markPoint : {
		                data : [
		                    {name : '年最高', value : 182.2, xAxis: 7, yAxis: 183},
		                    {name : '年最低', value : 2.3, xAxis: 11, yAxis: 3}
		                ]
		            },
		            markLine : {
		                data : [
		                    {type : 'average', name : '平均值'}
		                ]
		            }
		        }
		    ]
		};
	
	 // 使用刚指定的配置项和数据显示图表。
    myChart2.setOption(option2);
	</script>
	
	<script type="text/javascript">
	// 基于准备好的dom，初始化echarts实例
    var myChart3 = echarts.init(document.getElementById('chart3'));
	var option3 = {
		    xAxis: {
		        type: 'category',
		        boundaryGap: false,
		        data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
		    },
		    yAxis: {
		        type: 'value'
		    },
		    series: [{
		        data: [820, 932, 901, 934, 1290, 1330, 1320],
		        type: 'line',
		        areaStyle: {}
		    }]
		};

	 // 使用刚指定的配置项和数据显示图表。
    myChart3.setOption(option3);
	</script>

</body>
</html>
