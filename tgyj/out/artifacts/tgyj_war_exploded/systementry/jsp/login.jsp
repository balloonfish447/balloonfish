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

    <title>系统登录页面</title>

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
	<!--表单验证  -->
	<link href="plugins/bootstrap-validator/bootstrapValidator.css" rel="stylesheet">

</head>


<body>
    <div id="container" class="cls-container">
        
		<!-- BACKGROUND IMAGE -->
		<!--===================================================-->
		<div id="bg-overlay" class="bg-img" style="background-image: url(img/bg-img/bg-img-3.jpg)"></div>
		
		
		<!-- LOGIN FORM -->
		<!--===================================================-->
		<div class="cls-content">
		    <div class="cls-content-sm panel">
		        <div class="panel-body">
		            <div class="mar-ver pad-btm">
		                <h1 class="h3">欢迎登陆</h1>
		                <p>请输入你的用户信息</p>
		            </div>
		            <form action="../login" method="post" id="loginform">
		                <div class="form-group">
		                    <input type="text" class="form-control" placeholder="请输手机号" autofocus name="phone">
		                </div>
		                <div class="form-group">
		                    <input type="password" class="form-control" placeholder="请输入密码" name="password">
		                </div>
		              <%--  <div class="checkbox pad-btm text-left">
		                    <input id="demo-form-checkbox" class="magic-checkbox" type="checkbox">
		                    <label for="demo-form-checkbox">记住密码</label>
		                </div>--%>
		                <button class="btn btn-primary btn-lg btn-block" type="submit">登 录</button>
		            </form>
		        </div>
				<span id="errorlogin" style="color: red"></span>
		        <div class="pad-all">
		           <%-- <a href="pages-password-reminder.html" class="btn-link mar-rgt">忘记密码 ?</a>
		            <a href="link/toregister" class="btn-link mar-lft">前往注册</a>--%>
		
		            <div class="media pad-top bord-top">
		                <div class="pull-right">
		                    <%--<a href="#" class="pad-rgt"><i class="demo-psi-qq icon-lg text-primary"></i></a>
		                    <a href="#" class="pad-rgt"><i class="demo-psi-twitter icon-lg text-info"></i></a>
		                    <a href="#" class="pad-rgt"><i class="demo-psi-google-plus icon-lg text-danger"></i></a>--%>
							管理系统
		                </div>
		                <div class="media-body text-left text-bold text-main">
		                    唐宫银匠
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
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
	<!--表单验证的js  -->
	<script src="plugins/bootstrap-validator/bootstrapValidator.js"></script>
	<script>
		$(function () {
			$("#errorlogin").text('${requestScope.errorlogin}');

        })
	</script>
	<%--表单验证--%>
	<script type="text/javascript">

        $(function () {
            var bootstrapValidator =$('#loginform').bootstrapValidator({
                trigger: 'focus blur',
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh',
                },

                fields: {

                    password: {

                        validators: {
                            notEmpty: {
                                message: '密码不能为空'
                            },
                            stringLength: {
                                min: 6,
                                max: 30,
                                message: '密码的长度在6-30位之间'
                            }
                        }
                    },

                    phone: {
                        validators: {
                            notEmpty: {
                                message: '手机号不能为空'
                            },
                            regexp: {
                                regexp: /^[1][3,4,5,7,8,6,9][0-9]{9}$/,
                                message: '请输入正确的手机号码'
                            },

                        }


                    },


                }
            })

        });
	</script>

</body>
</html>
