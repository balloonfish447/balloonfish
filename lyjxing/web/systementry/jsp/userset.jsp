<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <title>用户信息设置</title>

    <!--Bootstrap Stylesheet [ REQUIRED ]-->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!--Nifty Stylesheet [ REQUIRED ]-->
    <link href="css/nifty.min.css" rel="stylesheet">

    <!--Nifty Premium Icon [ DEMONSTRATION ]-->
    <link href="css/demo/nifty-demo-icons.min.css" rel="stylesheet">


    <!--Pace - Page Load Progress Par [OPTIONAL]-->
    <link href="plugins/pace/pace.min.css" rel="stylesheet">
    <script src="plugins/pace/pace.min.js"></script>


    <!--Demo [ DEMONSTRATION ]-->
    <link href="css/demo/nifty-demo.min.css" rel="stylesheet">

        
    <!--Bootstrap Validator [ OPTIONAL ]-->
    <link href="plugins/bootstrap-validator/bootstrapValidator.min.css" rel="stylesheet">
    <%--样式风格--%>
    <link id="theme" href="css/themes/type-d/theme-navy.min.css"
          rel="stylesheet">


        
</head>

<!--TIPS-->
<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
<body>
    <div id="container" class="effect aside-float aside-bright mainnav-lg navbar-fixed mainnav-fixed">

        <!--NAVBAR-->
        <!--===================================================-->
        <jsp:include page="comment/header.jsp"></jsp:include>
        <!--===================================================-->
        <!--END NAVBAR-->


        <div class="boxed">

            <!--CONTENT CONTAINER-->
            <!--===================================================-->
            <div id="content-container">
                <div id="page-head">
                    
                    <!--Page Title-->
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <div id="page-title">
                        <h1 class="page-header text-overflow">用户信息设定</h1>
                    </div>
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <!--End page title-->


                    <!--Breadcrumb-->
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <ol class="breadcrumb">
					<li><a href="#"><i class="demo-pli-home"></i></a></li>
					<li><a href="#">用户信息</a></li>
					<li class="active">用户信息设定</li>
                    </ol>
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <!--End breadcrumb-->

                </div>

                
                <!--Page content-->
                <!--===================================================-->
                <div id="page-content">
                    
					<div class="row">

					    <div class="col-lg-12">
					        <div class="panel">
					            <div class="panel-heading">
					                <h3 class="panel-title">用户信息设定</h3>
					            </div>

					            <form id="demo-bvd-notempty" action="../set/usermess" class="form-horizontal" method="post">
					                <div class="panel-body">
					                    <p class="bord-btm pad-ver text-main text-bold">用户名昵称设定</p>

					                    <!--NOT EMPTY VALIDATOR-->
					                    <!--===================================================-->
					                    <fieldset>
					                        <div class="form-group">
					                            <label class="col-lg-3 control-label">用户名：</label>
					                            <div class="col-lg-7">
					                                <input type="text" class="form-control" name="username" placeholder="请输入用户名" value="${sessionScope.USERINFO.username}" readonly>
					                            </div>
					                        </div>
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">邮箱：</label>
                                                <div class="col-lg-7">
                                                    <input type="text" class="form-control" name="email"  value="${sessionScope.USERINFO.email}" readonly>
                                                </div>
                                            </div>

					                    </fieldset>
					                    <!--===================================================-->

					                    <br>
					                    <p class="bord-btm pad-ver text-main text-bold">密码设定</p>

					                    <!--IDENTICAL VALIDATOR-->
					                    <!--===================================================-->
					                    <fieldset>
					                        <div class="form-group">
					                            <label class="col-lg-3 control-label">密码：</label>
					                            <div class="col-lg-7">
					                                <input type="password" class="form-control" name="password" placeholder="请输入密码" value="${sessionScope.USERINFO.password}">
					                            </div>
					                        </div>
					                        <div class="form-group">
					                            <label class="col-lg-3 control-label">确认密码：</label>
					                            <div class="col-lg-7">
					                                <input type="password" class="form-control" name="confirmPassword" placeholder="请再次输入密码" value="${sessionScope.USERINFO.password}">
					                            </div>
					                        </div>
					                    </fieldset>

					                    <br>
					                    <p class="bord-btm pad-ver text-main text-bold">其它信息设定</p>

                                        <fieldset>
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">城市：</label>
                                                <div class="col-lg-7">
                                                    <input type="text" class="form-control" name="registerAddress" placeholder="请输入所在城市" value="${sessionScope.USERINFO.password}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">签名：</label>
                                                <div class="col-lg-7">
                                                    <input type="text" class="form-control" name="signed" placeholder="请输入你的个性签名" value="${sessionScope.USERINFO.signed}">
                                                </div>
                                            </div>
                                        </fieldset>


					                </div>
					                <div class="panel-footer">
					                    <div class="row">
					                        <div class="col-sm-7 col-sm-offset-3">
					                            <button class="btn btn-mint" type="submit">提交更新</button>
					                        </div>
					                    </div>
					                </div>
					            </form>
					        </div>
					    </div>
					</div>
					
					
					
                </div>
                <!--===================================================-->
                <!--End page content-->

            </div>
            <!--===================================================-->
            <!--END CONTENT CONTAINER-->




            <jsp:include page="comment/nav_right.jsp"></jsp:include>

            <jsp:include page="comment/nav_left.jsp"></jsp:include>

        </div>


        <jsp:include page="comment/footer.jsp"></jsp:include>


        <button class="scroll-top btn">
            <i class="pci-chevron chevron-up"></i>
        </button>



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






    
    <!--Bootstrap Validator [ OPTIONAL ]-->
    <script src="plugins/bootstrap-validator/bootstrapValidator.min.js"></script>


    <!--Masked Input [ OPTIONAL ]-->
    <script src="plugins/masked-input/jquery.maskedinput.min.js"></script>


    <!--Form validation [ SAMPLE ]-->
    <script src="js/demo/form-validation.js"></script>
    <!--弹框样式插件-->
    <script src="plugins/bootbox/bootbox.min.js"></script>
    <script>
        var set_mess='${requestScope.set_mess}'
        if(set_mess!=null&&set_mess!=""){
                bootbox.alert({
                    message: set_mess,
                    size: 'small',

                });
                set_mess="";
        }
    </script>

    

</body>
</html>
