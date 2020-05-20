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
		<div id="bg-overlay" class="bg-img" style="background-image: url(img/bg-img/bg-team.jpg)"></div>
		
		
		<!-- LOGIN FORM -->
		<!--===================================================-->
		<div class="cls-content">
		    <div class="cls-content-sm panel">
		        <div class="panel-body">
		            <div class="mar-ver pad-btm">
		                <h1 class="h3">校园社团</h1>
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
		            <span class="btn-link mar-lft">注册</span>--%>

		
		            <div class="media pad-top bord-top">
		                <div class="pull-right" id="zhuce">
		                    <%--<a href="#" class="pad-rgt"><i class="demo-psi-qq icon-lg text-primary"></i></a>
		                    <a href="#" class="pad-rgt"><i class="demo-psi-twitter icon-lg text-info"></i></a>
		                    <a href="#" class="pad-rgt"><i class="demo-psi-google-plus icon-lg text-danger"></i></a>--%>
								注册
		                </div>
		                <div class="media-body text-left text-bold text-main">
		                    洛师校社
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
	<!-- 新增内容弹出框内容 -->
	<div class="modal" id="xinzeng" role="dialog" tabindex="-1"
		 aria-labelledby="demo-default-modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<!--Modal header-->
				<div class="modal-header" style="border-bottom: 1px solid #e5e5e5;">
					<button type="button" class="close" data-dismiss="modal">
						<i class="pci-cross pci-circle"></i>
					</button>
					<h4 class="modal-title">用户注册界面</h4>
				</div>


				<!--Modal body-->
				<form class="form-horizontal"  id="form2"  method="post">

					<div class="modal-body">
						<div class="form-group">
							<label class="col-sm-3 control-label"><span style="color: red">*</span>学号：</label>
							<div class="col-sm-6">
								<input type="text" placeholder="请输入学号" class="form-control"
									   id="demo-is-inputnormal0" name="sno">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label"><span style="color: red">*</span>用户名：</label>
							<div class="col-sm-6">
								<input type="text" placeholder="请输入用户名" class="form-control"
									   id="demo-is-inputnormal1" name="username">
							</div>
						</div>
						<div class="form-group">
							<label for="demo-is-inputnormal2" class="col-sm-3 control-label"><span style="color: red">*</span>密码：</label>
							<div class="col-sm-6">
								<input type="text" placeholder="请输入密码" class="form-control"
									   id="demo-is-inputnormal2" name="password">
							</div>
						</div>
						<div class="form-group">
							<label for="demo-is-inputnormal3" class="col-sm-3 control-label"><span style="color: red">*</span>邮箱：</label>
							<div class="col-sm-6">
								<input type="text" placeholder="请输入邮箱" class="form-control"
									   id="demo-is-inputnormal3" name="email">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label"><span style="color: red">*</span>手机号：</label>
							<div class="col-sm-6">
								<input type="text" placeholder="请输入手机号" class="form-control"
									   id="demo-is-inputnormal4" name="phone" flag="xinzeng">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label"><span style="color: red">*</span>角色：</label>
							<div class="col-sm-6">
								<select class="form-control" name="roleid" id="roleid">

								</select>
							</div>
						</div>

					</div>
					<div class="modal-footer">

						<div class="row">
							<div class="col-sm-9 col-sm-offset-3">
								<button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
								<button class="btn btn-primary" id="add" type="button" value="添加">注册</button>
							</div>
						</div>

					</div>
				</form>
				<!--===================================================-->
				<!--End Input Size-->

			</div>
		</div>
	</div>
    <!--jQuery [ REQUIRED ]-->
    <script src="js/jquery.min.js"></script>


    <!--BootstrapJS [ RECOMMENDED ]-->
    <script src="js/bootstrap.min.js"></script>

	<!--弹框样式插件-->
	<script src="plugins/bootbox/bootbox.min.js"></script>

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
            var bootstrapValidator =$('#form2').bootstrapValidator({
                trigger: 'focus blur',
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh',
                },

                fields: {
                    sno: {

                        validators: {
                            notEmpty: {
                                message: '学号不能为空'
                            },

                        }
                    },
                    username: {

                        validators: {
                            notEmpty: {
                                message: '用户名不能为空'
                            },

                        }
                    },
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
                    email: {
                        validators: {
                            notEmpty: {
                                message: '邮箱地址不能为空'
                            },
                            emailAddress:{
                                message:'邮箱格式不正确'
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
                            threshold: 10,//有2字符以上才发送ajax请求
                            remote: {//ajax验证。server result:{"valid",true or false}
                                url: "../phoneyan",
                                message: '手机号已存在,请重新输入',
                                delay:2000,
                                type: 'POST',
                                //自定义提交数据，默认值提交当前input value
                                data: function(validator) {

                                    return {
                                        checkphone : validator.getFieldElements('phone').val(),
                                        flag:validator.getFieldElements('phone').attr("flag"),
                                    };
                                },

                            }
                        }


                    },
                    roleid: {

                        validators: {
                            notEmpty: {
                                message: '角色不能为空'
                            },

                        }
                    },

                }
            })
            //新增判断
            $("#zhuce").click(function(){

                $("#roleid").empty();

                var select = $("#roleid");
				//select.append("<option value='" + datas[i].rid + "'>" +  datas[i].rname + "</option>")
				select.append("<option value='3'>普通用户</option>")

                $('#xinzeng').modal()
            })

            //新增数据
            $("#add").click(function(){

                $('#form2').data('bootstrapValidator').validate();
                if ($("#form2").data('bootstrapValidator').isValid()) {
                    $.ajax({
                        type: 'post',
                        url: '../zhuce',
                        data: $('#form2').serialize(),
                        success: function (data) {

                            $("#xinzeng").modal('hide');

                            $.niftyNoty({
                                type: 'success',
                                icon: 'pli-like-2 icon-2x',
                                message: '用户注册成功',
                                container: 'floating',
                                timer: 10000
                            });
                        }
                    })
                }
            })

        });
	</script>

</body>
</html>
