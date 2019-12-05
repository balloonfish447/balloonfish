<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>出库管理</title>

<!--Bootstrap Stylesheet [ REQUIRED ]-->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!--Nifty Stylesheet [ REQUIRED ]-->
<link href="css/nifty.min.css" rel="stylesheet">

<!--Nifty Premium Icon [ DEMONSTRATION ]-->
<link href="css/demo/nifty-demo-icons.min.css" rel="stylesheet">
<link href="css/demo/iconfont.css" rel="stylesheet">

<!--页面加载进度条-->
<link href="plugins/pace/pace.min.css" rel="stylesheet">
<script src="plugins/pace/pace.min.js"></script>


<!--Demo [ DEMONSTRATION ]-->
<link href="css/demo/nifty-demo.min.css" rel="stylesheet">



<%--样式风格--%>
<link id="theme" href="css/themes/type-d/theme-navy.min.css" rel="stylesheet">
<!--DataTables [ OPTIONAL ]-->
<link href="plugins/datatables/media/css/dataTables.bootstrap.css" rel="stylesheet">

<link href="plugins/animate-css/animate.min.css" rel="stylesheet">

<!--表单验证  -->
<link href="plugins/bootstrap-validator/bootstrapValidator.css" rel="stylesheet">
<%--文件上传样式--%>
<link href="plugins/dropzone/dropzone.min.css" rel="stylesheet">
<style type="text/css">
.tog {
	background-color: #294f75 !important;
	color: #ffffff ;
}

</style>
</head>

<body>
	<div id="container"
		class="effect aside-float aside-bright mainnav-lg navbar-fixed mainnav-fixed">

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
						<h1 class="page-header text-overflow">出库管理</h1>
					</div>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End page title-->
					<ol class="breadcrumb">
						<li><a href="javascript::#"><i class="demo-pli-home"></i></a></li>
						<li><a href="javascript::#">产品管理</a></li>
						<li class="active">出库管理</li>
					</ol>
				</div>


				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">
					<div class="row">

						<div class="col-sm-4 col-md-12">

							<div class="panel">
								<%--<div class="panel-heading">
									<h3 class="panel-title">快速查询</h3>

								</div>
								<div class="panel-footer">

									<!-- Inline Form  -->
									<!--===================================================-->
									<form class="form-inline">
										<div class="row">

											<div class="form-group">
												<label class="" >生产厂家：</label>
												<input class="form-control"  type="text" placeholder="生产厂家">
											</div>
											<div class="form-group">
												<label class="" >可否出库：</label>
												<input class="form-control"  type="text" placeholder="可否出库">
											</div>
											<div class="form-group">
												<label class="" >产品名称：</label>
												<input class="form-control"  type="text" placeholder="产品名称">
											</div>
											<div class="form-group">
												<label class="" >入库人：</label>
												<input class="form-control"  type="text" placeholder="入库人">
											</div>
											<button class="btn btn-primary" type="button">搜索</button>
										</div>
										<div class="row">

										</div>
									</form>
									<!--===================================================-->
									<!-- End Inline Form  -->

								</div>--%>
								<div class="panel-body">
									<div class="row" style="margin-bottom: 20px">

										<button class="btn btn-danger" id="batchdelete">导出excel</button>


									</div>
									<div class="row">
									<div class="alert alert-mint" style="text-align: center;display: none" id="quanxuantishi">
					                    
					                    <strong>已选择本页的<span id="pagesize"></span>条数据,  <a href="#" class="alert-link" style="font-weight: 400" id="quanbuxuanze">勾选全部的 <span id="totalsize"></span> 数据</a></strong>
					                </div>
										<table id="chanpinruku"
											class="table table-striped table-bordered  table-hover" style="width: 100%">
											<thead>
												<tr>	
													<th><input type="checkbox" name="allusers" id="checkAll" ></th>											
													<th>产品图标</th>
													<th>产品名称</th>
													<th>银价</th>
													<th>银克重</th>
													<th>加工费/克</th>
													<th>加工费总计</th>
													<th>总价</th>
													<th>生产厂家</th>
													<th>入库人</th>
													<th>入库时间</th>
													<th>可否出库</th>
													<th>操作</th>
												</tr>
											</thead>
											
										</table>
									</div>

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


			<!--MAIN NAVIGATION-->
			<!--===================================================-->
			<jsp:include page="comment/nav_left.jsp"></jsp:include>
			<!--===================================================-->
			<!--END MAIN NAVIGATION-->

		</div>


		<!-- FOOTER -->
		<!--===================================================-->
		<jsp:include page="comment/footer.jsp"></jsp:include>
		<!--===================================================-->
		<!-- END FOOTER -->


		<!-- SCROLL PAGE BUTTON -->
		<!--===================================================-->
		<button class="scroll-top btn">
			<i class="pci-chevron chevron-up"></i>
		</button>
		<!--===================================================-->


	</div>
	
	<!--===================================================-->
	<!-- 修改内容弹出框内容 form1-->
	<div class="modal"  id="xiugai" role="dialog" tabindex="-1"
		aria-labelledby="demo-default-modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<!--Modal header-->
				<div class="modal-header" style="border-bottom: 1px solid #e5e5e5;">
					<button type="button" class="close" data-dismiss="modal">
						<i class="pci-cross pci-circle"></i>
					</button>
					<h4 class="modal-title">入库信息修改界面</h4>
				</div>
				<!--Modal body-->
				<div class="modal-body">
				<!--文件上传-->
				<div id="dropzxiugai" class="dropzone" style="padding: 0px;min-height: 100px;margin-bottom: 10px " >

				</div>

				<form class="form-horizontal"  id="form1" method="post">
					<%--隐藏变量入库id--%>
					<input type="hidden" name="rkid">
					<input type="hidden" name="rukushijian">
					<input type="hidden" name="kefouchuku">
					<input type="hidden" name="logopath" id="logopathxiugai">


							<div class="form-group">
								<label class="col-sm-3 control-label"><span style="color: red">*</span>产品名称：</label>
								<div class="col-sm-6">
									<input type="text" placeholder="请输入产品名称" class="form-control chanpinname1"
										    name="chanpinname">
								</div>
							</div>
							<div class="form-group">
								<label for="demo-is-inputnormal2" class="col-sm-3 control-label"><span style="color: red">*</span>银价：</label>
								<div class="col-sm-6">
									<input type="text" placeholder="请输入银价" class="form-control yinjia1"
										   name="yinjia">
								</div>
							</div>
							<div class="form-group">
								<label for="demo-is-inputnormal3" class="col-sm-3 control-label"><span style="color: red">*</span>银克重：</label>
								<div class="col-sm-6">
									<input type="text" placeholder="请输入银克重" class="form-control yinkezhong1"
										   name="yinkezhong">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"><span style="color: red">*</span>加工费：</label>
								<div class="col-sm-6">
									<input type="text" placeholder="请输入加工费" class="form-control jiagongfei1"
										    name="jiagongfei" flag="xinzeng">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"><span style="color: red">*</span>加工费总价：</label>
								<div class="col-sm-6">
									<input type="text" placeholder="系统自动计算:=银克重*加工费/克" class="form-control jiagongfeizongji1"
										   name="jiagongfeizongji" flag="xinzeng" readonly>
								</div>

							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"><span style="color: red">*</span>总价：</label>
								<div class="col-sm-6">
									<input type="text" placeholder="系统自动计算:=(银价+加工费/克)*银克重" class="form-control zongjia1"
										   name="zongjia" flag="xinzeng" readonly>
								</div>

							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"><span style="color: red">*</span>生产厂家：</label>
								<div class="col-sm-6">
									<input type="text" placeholder="请输入生产厂家" class="form-control shengchachangjia1"
										   name="shengchachangjia" flag="xinzeng">
								</div>

							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label"><span style="color: red">*</span>入库员：</label>
								<div class="col-sm-6">
									<input type="text" placeholder="请输入入库员" class="form-control rukuren1"
										   name="rukuren" flag="xinzeng" readonly value="${sessionScope.USERINFO.username}">
								</div>

							</div>
						</form>
						</div>
						<div class="modal-footer">

							<div class="row">
								<div class="col-sm-9 col-sm-offset-3">
									<button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
									<button class="btn btn-primary" id="baocun" type="button" value="添加">保存</button>
								</div>
							</div>

						</div>

				<!--===================================================-->
				<!--End Input Size-->
				
			</div>
		</div>
	</div>

	<!--===================================================-->

	
	<%--出库操作弹出框 form3--%>
	<div class="modal" id="chukucaozuo" role="dialog" tabindex="-1"
		 aria-labelledby="demo-default-modal" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">

				<!--Modal header-->
				<div class="modal-header" style="border-bottom: 1px solid #e5e5e5;">
					<button type="button" class="close" data-dismiss="modal">
						<i class="pci-cross pci-circle"></i>
					</button>
					<h4 class="modal-title">出库管理界面</h4>
				</div>


				<!--Modal body-->
				<form class="form-horizontal"  id="form3"  method="post">
					<%--隐藏数据入库id--%>
					<input type="hidden" name="rkid">
					<input type="hidden" name="kefouchuku">
					<input type="hidden" name="rukushijian">
						<input type="hidden" name="logopath">
					<div class="modal-body">

						<div class="form-group">
							<%--
							<label class="col-sm-2 control-label"><span style="color: red">*</span>产品名称：</label>
							<div class="col-sm-3">
								<input type="text" placeholder="请输入产品名称" class="form-control chanpinname"
									   name="chanpinname">
							</div>--%>
							<label class="col-sm-3 control-label"><span style="color: red">*</span>产品名称：</label>
							<div class="col-sm-6">
								<input type="text" placeholder="请输入产品名称" class="form-control chanpinname3"
									   name="chanpinname" readonly>
							</div>
						</div>
						<div class="form-group">
							<label for="demo-is-inputnormal2" class="col-sm-3 control-label"><span style="color: red">*</span>银价：</label>
							<div class="col-sm-6">
								<input type="text" placeholder="请输入银价" class="form-control yinjia3"
									    name="yinjia">
							</div>
						</div>
						<div class="form-group">
							<label for="demo-is-inputnormal3" class="col-sm-3 control-label"><span style="color: red">*</span>银克重：</label>
							<div class="col-sm-6">
								<input type="text" placeholder="请输入银克重" class="form-control yinkezhong3"
									   name="yinkezhong">
								<span class="label label-warning" >可出库量：<b id="chukushengyu">100</b></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label"><span style="color: red">*</span>加工费：</label>
							<div class="col-sm-6">
								<input type="text" placeholder="请输入加工费" class="form-control jiagongfei3"
									    name="jiagongfei" >
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label"><span style="color: red">*</span>加工费总价：</label>
							<div class="col-sm-6">
								<input type="text" placeholder="系统自动计算:=银克重*加工费/克" class="form-control jiagongfeizongji3"
									   name="jiagongfeizongji" readonly>
							</div>

						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label"><span style="color: red">*</span>总价：</label>
							<div class="col-sm-6">
								<input type="text" placeholder="系统自动计算:=(银价+加工费/克)*银克重" class="form-control zongjia3"
									   name="zongjia"  readonly>
							</div>

						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label"><span style="color: red">*</span>代理商：</label>
							<div class="col-sm-6">
								<input type="text" placeholder="请输入代理商" class="form-control dailishang3"
									   name="dailishang" >
							</div>

						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label"><span style="color: red">*</span>出库人：</label>
							<div class="col-sm-6">
								<input type="text" placeholder="请输入入库员" class="form-control chukuren3"
									   name="chukuren"  readonly value="${sessionScope.USERINFO.username}">
							</div>

						</div>

					</div>
					<div class="modal-footer">

						<div class="row">
							<div class="col-sm-9 col-sm-offset-3">
								<button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
								<button class="btn btn-primary" id="chuku" type="button" value="添加">出库</button>
							</div>
						</div>

					</div>
				</form>
				<!--===================================================-->
				<!--End Input Size-->

			</div>
		</div>
	</div>

	<%--出库详情弹出框 form4--%>
	<div class="modal" id="chukuxiangqing" role="dialog" tabindex="-1"
		 aria-labelledby="demo-default-modal" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<!--Modal header-->
				<div class="modal-header" style="border-bottom: 1px solid #e5e5e5;">
					<button type="button" class="close" data-dismiss="modal">
						<i class="pci-cross pci-circle"></i>
					</button>
					<h4 class="modal-title">出库信息详情</h4>
				</div>


				<div class="modal-body">

						<h4 class="modal-title" style="color: #f55145">
							出库加工费总计:<span id="ckjgfzj"></span>&nbsp;&nbsp;
							入库加工费总计:<span id="rkjgfzj"></span>&nbsp;&nbsp;
							利润:<span id="lirun"></span>
						</h4>

					<table class="table table-striped table-bordered  table-hover" id="chukuxiangqingmess" style="width: 100%">
						<thead>
						<tr>
							<th>产品图标</th>
							<th>产品名称</th>
							<th>出库银价</th>
							<th>出库银克重</th>
							<th>出库加工费/克</th>
							<th>出库加工费总计</th>
							<th>出库总价</th>
							<th>代理商</th>
							<th>出库人</th>
							<th>出库时间</th>
						</tr>
						</thead>

					</table>
				</div>

				<div class="modal-footer">

						<div class="row">
							<div class="col-sm-9 col-sm-offset-3">
								<button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
							</div>
						</div>

				</div>

				<!--===================================================-->
				<!--End Input Size-->

			</div>
		</div>
	</div>



	<!--JAVASCRIPT-->

	<!--jQuery [ REQUIRED ]-->
	<script src="js/jquery.min.js"></script>
	<!--BootstrapJS [ RECOMMENDED ]-->
	<script src="js/bootstrap.min.js"></script>
	<!--NiftyJS [ RECOMMENDED ]-->
	<script src="js/nifty.min.js"></script>

	<!--弹框样式插件-->
	<script src="plugins/bootbox/bootbox.min.js"></script>

	<!--DataTables [ OPTIONAL ]-->
	<script src="plugins/datatables/media/js/jquery.dataTables.js"></script>
	<script src="plugins/datatables/media/js/dataTables.bootstrap.js"></script>
	<!--表单验证的js  -->
	<script src="plugins/bootstrap-validator/bootstrapValidator.js"></script>

	<%--js数字计算高精度计算--%>
	<script src="plugins/bignumber.min.js"></script>

	<%--文件上传js--%>
	<script src="plugins/dropzone/dropzone.min.js"></script>

	<%--jquery小数计算--%>
	<script>
		$(function () {
            /*计算加工费总价和总价--新增页面*/
            $(".yinkezhong,.jiagongfei,.yinjia").on("input",function () {
                //银价
                var yinjia=$(".yinjia");

                //银克重
                var yinkezhong=$(".yinkezhong");

                //加工费
                var jiagongfei=$(".jiagongfei");

                //加工费总价
                var jiagongfeizongji=$(".jiagongfeizongji");

                //总价
                var zongjia=$(".zongjia");

                if(yinkezhong.val()!=""&&jiagongfei.val()!=""){
                    //计算加工费总价
                    jiagongfeizongji.val(new BigNumber(yinkezhong.val()).multipliedBy(new BigNumber(jiagongfei.val())).toFormat(2));

                }else{
                    jiagongfeizongji.val("");
                }
                //计算总价
                if(yinjia.val()!=""&&yinkezhong.val()!=""&&jiagongfei.val()!=""){
                    //计算总价
                    zongjia.val(new BigNumber(yinjia.val()).plus(new BigNumber(jiagongfei.val())).multipliedBy(new BigNumber(yinkezhong.val())).toFormat(2));

                }else{
                    zongjia.val("");
                }


            })

            /*计算加工费总价和总价--修改页面*/
            $(".yinkezhong1,.jiagongfei1,.yinjia1").on("input",function () {
                //银价
                var yinjia1=$(".yinjia1");

                //银克重
                var yinkezhong1=$(".yinkezhong1");

                //加工费
                var jiagongfei1=$(".jiagongfei1");

                //加工费总价
                var jiagongfeizongji1=$(".jiagongfeizongji1");

                //总价
                var zongjia1=$(".zongjia1");

                if(yinkezhong1.val()!=""&&jiagongfei1.val()!=""){
                    //计算加工费总价
                    jiagongfeizongji1.val(new BigNumber(yinkezhong1.val()).multipliedBy(new BigNumber(jiagongfei1.val())).toFormat(2));

                }else{
                    jiagongfeizongji1.val("");
                }
                //计算总价
                if(yinjia1.val()!=""&&yinkezhong1.val()!=""&&jiagongfei1.val()!=""){
                    //计算总价
                    zongjia1.val(new BigNumber(yinjia1.val()).plus(new BigNumber(jiagongfei1.val())).multipliedBy(new BigNumber(yinkezhong1.val())).toFormat(2));

                }else{
                    zongjia1.val("");
                }


            })

            /*计算加工费总价和总价--出库页面*/
            $(".yinkezhong3,.jiagongfei3,.yinjia3").on("input",function () {
                //银价
                var yinjia3=$(".yinjia3");

                //银克重
                var yinkezhong3=$(".yinkezhong3");

                //加工费
                var jiagongfei3=$(".jiagongfei3");

                //加工费总价
                var jiagongfeizongji3=$(".jiagongfeizongji3");

                //总价
                var zongjia3=$(".zongjia3");

                if(yinkezhong3.val()!=""&&jiagongfei3.val()!=""){
                    //计算加工费总价
                    jiagongfeizongji3.val(new BigNumber(yinkezhong3.val()).multipliedBy(new BigNumber(jiagongfei3.val())).toFormat(2));

                }else{
                    jiagongfeizongji3.val("");
                }
                //计算总价
                if(yinjia3.val()!=""&&yinkezhong3.val()!=""&&jiagongfei3.val()!=""){
                    //计算总价
                    zongjia3.val(new BigNumber(yinjia3.val()).plus(new BigNumber(jiagongfei3.val())).multipliedBy(new BigNumber(yinkezhong3.val())).toFormat(2));

                }else{
                    zongjia3.val("");
                }


            })
        })
	</script>

	<%--表单验证--%>
	<script>
    $(function () {
        var bootstrapValidator =$('#form2,#form1,#form3').bootstrapValidator({
        	trigger: 'focus blur',
        	message: 'This value is not valid',
           feedbackIcons: {
        	   valid: 'glyphicon glyphicon-ok',
        	   invalid: 'glyphicon glyphicon-remove',
        	   validating: 'glyphicon glyphicon-refresh',
           },
           
            fields: {
                chanpinname: {
                   
                    validators: {
                        notEmpty: {
                            message: '产品名称不能为空'
                        },

                    }
                },
                yinjia: {
                    validators: {
                        notEmpty: {
                            message: '银价不能为空'
                        },
                        regexp:{
                            regexp:/^[0-9]+([.]{1}[0-9]+){0,1}$/,
							message:'只能输入小数或者整数'
                        }
                    }
                },
                yinkezhong: {
                    validators: {
                        notEmpty: {
                            message: '银克重不能为空'
                        },
                        regexp:{
                            regexp:/^[0-9]+([.]{1}[0-9]+){0,1}$/,
                            message:'只能输入小数或者整数'
                        }
                    }
                },
                jiagongfei: {
                    validators: {
                        notEmpty: {
                            message: '加工费不能为空'
                        },
                        regexp:{
                            regexp:/^[0-9]+([.]{1}[0-9]+){0,1}$/,
                            message:'只能输入小数或者整数'
                        }

                    }
                },
                jiagongfeizongji: {
                    validators: {
                        notEmpty: {
                            message: '加工费总价不能为空'
                        },

                    }
                },
                zongjia: {
                    validators: {
                        notEmpty: {
                            message: '总价不能为空'
                        },

                    }
                },
                shengchachangjia: {
                    validators: {
                        notEmpty: {
                            message: '生产厂家不能为空'
                        },

                    }
                },
                rukuren: {
                    validators: {
                        notEmpty: {
                            message: '入库人不能为空'
                        },

                    }
                },
                dailishang:{
                    validators: {
                        notEmpty: {
                            message: '代理商不能为空'
                        },

                    }
				},
                chukuren: {
                    validators: {
                        notEmpty: {
                            message: '出库人不能为空'
                        },

                    }
                },
            }
        })
    });
	</script>

	<!--格式化时间的函数  -->
	<script>
		function timeStamp2String(time){
			var datetime = new Date();
			datetime.setTime(time);
			var year = datetime.getFullYear();
			var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
			var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
			var hour = datetime.getHours()< 10 ? "0" + datetime.getHours() : datetime.getHours();
			var minute = datetime.getMinutes()< 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
			var second = datetime.getSeconds()< 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
			return year + "/" + month + "/" + date+" "+hour+":"+minute+":"+second;
	}
	</script>
	
	<!--复选框全选  -->
	<script>
	//存放选中的uid集合
	var checkedIds=[];
	var tempcheckedIds=[];
	$(function(){
		
		//总记录条数
		var totalsize
		//当前页显示的数据
	 	var pagesize
     //全选
     $("#checkAll").click(function(){
    	 
    	 //获取总的记录条数
    	  totalsize=$('#chanpinruku').DataTable().page.info().recordsTotal;
    	 $("#totalsize").text(totalsize);
    	 //获取当前页数据
    	  pagesize=$('#chanpinruku').DataTable().page.info().length;
    	 $("#pagesize").text(pagesize);
    	 if($(this).is(':checked')){
    		 checkedIds=[];
				$('input[name="checkusers"]').each(function(){
					$(this).prop("checked",true);
					$("#chanpinruku tbody tr").addClass('tog')
					//把当前页的id放入集合中
					checkedIds.push($(this).attr("id"));
					if(pagesize<totalsize){
						
					
						//展开提示信息
						$("#quanxuantishi").slideDown();
					}
					
				});
				console.log(checkedIds)
			}else{
				$('input[name="checkusers"]').each(function(){
					$(this).prop("checked",false);
					$("#chanpinruku tbody tr").removeClass('tog')
					//清空集合中的id
					checkedIds=[];
					
					//清空提示信息显示的内容 
					var newstrong='已选择本页的<span id="pagesize"></span>条数据,  <a href="#" class="alert-link" style="font-weight: 400" id="quanbuxuanze">勾选全部的 <span id="totalsize"></span> 数据</a>'
					$("#quanxuantishi strong").html(newstrong);
					$("#quanxuantishi").slideUp();
					 
			    	
				});
				console.log(checkedIds);
			}
		
			
	 });
     
     //单选完毕改变状态全选
	 $("#chanpinruku tbody").on("click",'[name=checkusers]:checkbox',function(){
		
				//定义一个临时变量，避免重复使用同一个选择器选择页面中的元素，提升程序效率。
				var $tmp=$('[name=checkusers]:checkbox');
				
				//用filter方法筛选出选中的复选框。并直接给CheckedAll赋值。
				$('#checkAll').prop('checked',$tmp.length==$tmp.filter(':checked').length);
				
							
							if($(this).prop('checked')){
								
								checkedIds.push($(this).attr("id"));
								
								
							}else{
								for(var i=0; i<checkedIds.length; i++){
									
									if($(this).attr("id") == checkedIds[i]){ 
										$("#quanxuantishi").slideUp();
										checkedIds.splice(i, 1); break;
									}
								}
							}

				console.log(checkedIds);
		
	 });
     
     //勾选全部数据处理，分页全选
     $("#quanxuantishi").on("click","#quanbuxuanze",function(){
    	 var newstrong="已选择全部的"+totalsize+"条记录   <a class='alert-link' href='javascript::#' id='quxiaoquanxuan'>取消全选</a>"
    	 $("#quanxuantishi strong").html(newstrong);
    	 //全选后直接放入当前的机构id，删除该机构下所有数据即可
    	/* var oid=$("#oid").val();*/
    	 tempcheckedIds=checkedIds;
    	 checkedIds=[];
    	 //放入一个all作为判断的依据
    	 checkedIds.push('all');
    	/* checkedIds.push(oid);*/
    	 console.log(checkedIds);
    	 return false;
    	
     });
     //取消全选
     $("#quanxuantishi").on("click","#quxiaoquanxuan",function(){
    	 var newstrong='已选择本页的<span id="pagesize"></span>条数据,  <a href="#" class="alert-link" style="font-weight: 400" id="quanbuxuanze">勾选全部的 <span id="totalsize"></span> 数据</a>'
    	 $("#quanxuantishi strong").html(newstrong);
    	 //全选后直接放入当前的机构id，删除该机构下所有数据即可
    	 $("#totalsize").text(totalsize);
    	
    	 $("#pagesize").text(pagesize);
    	checkedIds=tempcheckedIds;
    	tempcheckedIds=[];
    	
    	 console.log(checkedIds);
    	 return false;
    	
     });
     
     //分页记录全选，监听datatable的绘制事件
  $('#chanpinruku').on('draw.dt',function() {
	//判断chekedIds的第一个值是否为all，是的话默认页面跳转后复选框选中
	   	 if(checkedIds[0]!=null&&checkedIds[0]=="all"){
	   		
	   	 		$("input[name='checkusers']").each(function(){
	   	 		
	   	 			$(this).prop("checked", true)
	   	 			
	   				$("#chanpinruku tbody tr").addClass('tog')
	   				
	   				
	   	 		})
	   	 	 }
    });
   	 	
       	
   
     
	});
	</script>

	<!-- 构建datatable -->
	<script> 
   	$(function (){
    	//构建新table时提示不显示
    	$("#quanxuantishi").hide();
    	
    	$('#chanpinruku').dataTable({
        	destroy:true,    /*允许重新构建datatable  */   
        	processing: true,//功能控制处理指标
        	serverSide: true,//启动服务器模式，会向后台传递值
        	paging : true,//是否分页
            searching: false,
        	lengthMenu: [ 10, 25, 50, 75, 100 ],//指定显示数据长度
        	"autoWidth": true, 
        	 "scrollX": true,
            ordering:true,//启动排序
            order: [[ 10, "desc" ]],
        	/* "scrollCollapse": true,  */ //表格高度随内容自适应
        	//获取数据源 
        	ajax:{
        		
        		url:"../chanpinguanli/getrukuinfos",	//请求地址
                dataSrc: "data",	//默认为data,这里定义为空，则只需要传不带属性的数据              
        	}, 

            columns: [
            	{ data: 'rkid',
                    orderable: false,//制定是否排序
                  //数据渲染
                	render: function (data, type, row, meta) {
                		return '<input type="checkbox" name="checkusers" id='+data+' value='+data+'>'
                	}
        	  
                  },
                { data: 'logopath',

                    orderable: false,//制定是否排序
					render:function (data, type, row, meta) {
                    	if(data==null||data==""){
                            return '<img class="img-sm"  src="img/zwtp.jpg" >'
						}else{
                            return '<img class="img-sm"  src="' + data + '" >'
						}

                    }
                },

                { data: 'chanpinname',
                	
                	 orderable: false,//制定是否排序
                },
                { data: 'yinjia' ,
                	
                	 orderable: false,//制定是否排序
                },
                { data: 'yinkezhong' ,
                	
                	 orderable: false,//制定是否排序
                },
                { data: 'jiagongfei',
                	
                	 orderable: false,//制定是否排序	
                },

                { data: 'jiagongfeizongji',

                },



                { data: 'zongjia',

                },
                { data: 'shengchachangjia',
                    orderable: false,//制定是否排序
                },
                { data: 'rukuren',
                    orderable: false,//制定是否排序
                },
                { data: 'rukushijian',
                    orderable:true,

                },
				{ data:'kefouchuku',
                    orderable: false,//制定是否排序
                    //数据渲染
                    render: function (data, type, row, meta) {
						var ykz=row.yinkezhong;
						if(data==""||data==null){
                            return '<span class="label label-success">已出库：<b>0</b></span>'
						}else{
                            if(ykz-data>0){
                                return '<span class="label label-success">已出库：<b>'+data+'</b></span>'
                            }else{
                                return '<span class="label label-danger">出库完</span>'
                            }
						}


                    }

				},

                { data: null,
                  orderable: false,//制定是否排序
                  //也可以这样添加自己想要的列data-target="#xiugai" data-toggle="modal"
                  defaultContent: /*'<a href="javascript::##" data-target="#xiugai" data-toggle="modal" title="修改" class="xiugai"> <i class="iconfont icon-tianxie"></i></a>'+*/
                	 /* '<a href="javascript::##"  title="删除"  class="shanchu"> <i class="iconfont icon-shanchu"></i></a>'+*/
                 	 '<a href="javascript::##"  title="查看出库详情" class="chakan"> <i class="iconfont icon-sousuo"></i></a>'+
                  '<a href="javascript::##" title="出库" class="chuku"> <i class="iconfont icon-fabu"></i></a>'
                }
            ],
            /*通过该属性可以制定columns中的各种属性，包括添加列和字段属性变换等，当然也可以在columns中实现  */
            columnDefs: [ 
            	
            	
            ],

            /*语言处理  */
            language: {
                "sProcessing": "处理中...",
                "sLengthMenu": "显示 _MENU_ 项结果",
                "sZeroRecords": "没有匹配结果",
                "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                "sInfoPostFix": "",
                "sSearch": "搜索:",
                "sUrl": "",
                "sEmptyTable": "暂未匹配到相应的数据",
                "sLoadingRecords": "载入中...",
                "sInfoThousands": ",",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上页",
                    "sNext": "下页",
                    "sLast": "末页"
                },
                "oAria": {
                    "sSortAscending": ": 以升序排列此列",
                    "sSortDescending": ": 以降序排列此列"
                },
                "decimal":','
            },
            
        });


		var datats=$('#chanpinruku').DataTable();

		//修改方法，注意datatable返回的数据和字段都是动态元素，只能通过jquery的on方法进行绑定
		$('#chanpinruku tbody').on('click','.xiugai', function() {

						var this1=$(this).parent().parent();

						this1.siblings().removeClass('tog')
						this1.toggleClass('tog')
						this1.children().children("a").css("color","inherit")
						//$(this).children().first().children().prop("checked",true)
						//获取点击的行号
						var rowIndex =$('#chanpinruku').DataTable().row(this1).index();
						//通过dataTable获取隐藏的值
						var rkid=$('#chanpinruku').DataTable().row(rowIndex).data().rkid;
						var chanpinname=$('#chanpinruku').DataTable().row(rowIndex).data().chanpinname;
						var yinjia=$('#chanpinruku').DataTable().row(rowIndex).data().yinjia;
						var yinkezhong=$('#chanpinruku').DataTable().row(rowIndex).data().yinkezhong;
						var jiagongfei=$('#chanpinruku').DataTable().row(rowIndex).data().jiagongfei;
						var jiagongfeizongji=$('#chanpinruku').DataTable().row(rowIndex).data().jiagongfeizongji;
						var zongjia=$('#chanpinruku').DataTable().row(rowIndex).data().zongjia;
						var shengchachangjia=$('#chanpinruku').DataTable().row(rowIndex).data().shengchachangjia;
						var rukuren=$('#chanpinruku').DataTable().row(rowIndex).data().rukuren;
						var rukushijian=$('#chanpinruku').DataTable().row(rowIndex).data().rukushijian;
            			var kefouchuku=$('#chanpinruku').DataTable().row(rowIndex).data().kefouchuku;
            			var logopath=$('#chanpinruku').DataTable().row(rowIndex).data().logopath;

						//把页面上去到的值放入到弹出框中
						$("#xiugai input[name=rkid]").val(rkid)
						$("#xiugai input[name=chanpinname]").val(chanpinname)
						$("#xiugai input[name=yinjia]").val(yinjia)
						$("#xiugai input[name=yinkezhong]").val(yinkezhong)
						$("#xiugai input[name=jiagongfei]").val(jiagongfei)
						$("#xiugai input[name=jiagongfeizongji]").val(jiagongfeizongji)
						$("#xiugai input[name=zongjia]").val(zongjia)
						$("#xiugai input[name=shengchachangjia]").val(shengchachangjia)
						$("#xiugai input[name=rukuren]").val(rukuren)
						$("#xiugai input[name=rukushijian]").val(rukushijian)
            			$("#xiugai input[name=kefouchuku]").val(kefouchuku)
            			$("#xiugai input[name=logopath]").val(logopath)

						$("#baocun").off().click(function(){
							$('#form1').data('bootstrapValidator').validate();
							if ($("#form1").data('bootstrapValidator').isValid()) {
								$.ajax({
									type: 'post',
									url: '../chanpinguanli/updaterukuxinxi',
									data: $('#form1').serialize(),
									context: document.body,
									success: function (data) {

										$("#xiugai").modal('hide');
                                        this1.children(":eq(1)").children().attr("src",data.logopath)
										this1.children(":eq(2)").text(data.chanpinname)
										this1.children(":eq(3)").text(data.yinjia)
										this1.children(":eq(4)").text(data.yinkezhong)
										this1.children(":eq(5)").text(data.jiagongfei)
										this1.children(":eq(6)").text(data.jiagongfeizongji)
										this1.children(":eq(7)").text(data.zongjia)
										this1.children(":eq(8)").text(data.shengchachangjia)
										this1.children(":eq(9)").text(data.rukuren)
										this1.children(":eq(10)").text(data.rukushijian)
                                        this1.children(":eq(11)").children().children().text(data.kefouchuku)
										//把修改后的值放入到datatable中
										$('#chanpinruku').DataTable().row(rowIndex).data().rkid=data.rkid;
										$('#chanpinruku').DataTable().row(rowIndex).data().chanpinname=data.chanpinname;
										$('#chanpinruku').DataTable().row(rowIndex).data().yinjia=data.yinjia;
										$('#chanpinruku').DataTable().row(rowIndex).data().yinkezhong=data.yinkezhong;
										$('#chanpinruku').DataTable().row(rowIndex).data().jiagongfei=data.jiagongfei;
										$('#chanpinruku').DataTable().row(rowIndex).data().jiagongfeizongji=data.jiagongfeizongji;
										$('#chanpinruku').DataTable().row(rowIndex).data().zongjia=data.zongjia;
										$('#chanpinruku').DataTable().row(rowIndex).data().shengchachangjia=data.shengchachangjia;
										$('#chanpinruku').DataTable().row(rowIndex).data().rukuren=data.rukuren;
										$('#chanpinruku').DataTable().row(rowIndex).data().rukushijian=data.rukushijian;
                                        $('#chanpinruku').DataTable().row(rowIndex).data().kefouchuku=data.kefouchuku;
                                        $('#chanpinruku').DataTable().row(rowIndex).data().logopath=data.logopath;
										this1.animate({backgroundColor: '#294f75 !important', opacity: '0.5'}, 1000);

										this1.animate({backgroundColor: '#294f75 !important', opacity: '1'}, 1000);
                                        this1.removeClass('tog')
										$.niftyNoty({
											type: 'success',
											icon: 'pli-like-2 icon-2x',
											message: '修改成功',
											container: 'floating',
											timer: 2000
										});
										this1='';
									}
								})
							}
						})



				});

		//删除，注意datatable返回的数据和字段都是动态元素，只能通过jquery的on方法进行绑定
		$('#chanpinruku tbody').on('click','.shanchu', function() {

				var thisis = $(this).parent().parent();
				 thisis.siblings().removeClass('tog')
				 thisis.toggleClass('tog')
				 thisis.children().children("a").css("color","inherit")
				 //获取点击的行号
				 var rowIndex = $('#chanpinruku').DataTable().row(thisis).index();
				 //通过dataTable获取隐藏的值
				 var uid=$('#chanpinruku').DataTable().row(rowIndex).data().uid;

				  bootbox.confirm({
					  animateIn:'',
					  animateOut: '',
					  message:"确认要删除该条数据吗？",
					  buttons: {
						  confirm: {
							  label: '确定',
							  className: 'btn-danger'
						  },
						  cancel: {
							  label: '取消',

						  }
					  },
					  size:"small",
					  callback:function(deletemess){
						if(deletemess==true){
						$.ajax({
							url:'../system/deleteOrgUser',
							datatype:'boolean',
							data:'uid='+uid,
							context: document.body,
							success:function(data){

								if(data==true){
									thisis.hide(1000,function(){
										thisis='';

										$.niftyNoty({
											type: 'success',
											icon : 'pli-like-2 icon-2x',
											message : '删除成功',
											container : 'floating',
											timer : 2000
										});
									})



								}
							}
						})
					}
				  }
				  });

			})






		//导出excel
		$("#batchdelete").click(function(){
				if(checkedIds==""||checkedIds.length==0){
					bootbox.alert({
						message:"没有选中数据，请选择要导出的数据",
                        size:"small",

					});
				}else{
				    window.location.href='../chanpinguanli/excelrukusc?idList='+encodeURI(encodeURI(checkedIds))
					/*$.ajax({
						type:'post',
						url:'../chanpinguanli/excelrukusc',
						data:{'idList':checkedIds},
						success:function(data){
							//重绘表格
                            datats.draw();
							$.niftyNoty({
								type: 'success',
								icon : 'pli-like-2 icon-2x',
								message : 'excel下载成功',
								container : 'floating',
								timer : 3000
							});

						}

					})*/
				}
			})

        //出库管理
        $('#chanpinruku tbody').on('click','.chuku', function() {

            var this1=$(this).parent().parent();

            this1.siblings().removeClass('tog')
            this1.toggleClass('tog')
            this1.children().children("a").css("color","inherit")
            //$(this).children().first().children().prop("checked",true)
            //获取点击的行号
            var rowIndex =$('#chanpinruku').DataTable().row(this1).index();
            //通过dataTable获取隐藏的值
            var rkid=$('#chanpinruku').DataTable().row(rowIndex).data().rkid;
            var chanpinname=$('#chanpinruku').DataTable().row(rowIndex).data().chanpinname;
            var yinjia=$('#chanpinruku').DataTable().row(rowIndex).data().yinjia;
            var yinkezhong=$('#chanpinruku').DataTable().row(rowIndex).data().yinkezhong;
            var jiagongfei=$('#chanpinruku').DataTable().row(rowIndex).data().jiagongfei;
            var jiagongfeizongji=$('#chanpinruku').DataTable().row(rowIndex).data().jiagongfeizongji;
            var zongjia=$('#chanpinruku').DataTable().row(rowIndex).data().zongjia;
            var shengchachangjia=$('#chanpinruku').DataTable().row(rowIndex).data().shengchachangjia;
            var rukuren=$('#chanpinruku').DataTable().row(rowIndex).data().rukuren;
            var rukushijian=$('#chanpinruku').DataTable().row(rowIndex).data().rukushijian;
            var kefouchuku=$('#chanpinruku').DataTable().row(rowIndex).data().kefouchuku;
            var logopath=$('#chanpinruku').DataTable().row(rowIndex).data().logopath;

            if(yinkezhong-kefouchuku<=0){
                bootbox.alert({
                    message:"银子已经出库完了，不能再出库了",
                    size: "small",
                })
            }else{
                $('#chukucaozuo').modal()
                //把页面上去到的值放入到弹出框中
                $("#chukucaozuo input[name=rkid]").val(rkid)
                $("#chukucaozuo input[name=chanpinname]").val(chanpinname)
                $("#chukucaozuo input[name=yinjia]").val(yinjia)
                $("#chukucaozuo input[name=yinkezhong]").val(yinkezhong)
                $("#chukucaozuo input[name=jiagongfei]").val(jiagongfei)
                $("#chukucaozuo input[name=jiagongfeizongji]").val(jiagongfeizongji)
                $("#chukucaozuo input[name=zongjia]").val(zongjia)
                $("#chukucaozuo input[name=shengchachangjia]").val(shengchachangjia)
                $("#chukucaozuo input[name=rukuren]").val(rukuren)
                $("#chukucaozuo input[name=rukushijian]").val(rukushijian)
                $("#chukucaozuo input[name=kefouchuku]").val(kefouchuku)
                $("#chukucaozuo input[name=logopath]").val(logopath)
                $("#chukushengyu").text(yinkezhong-kefouchuku)


                $("#chuku").off().click(function(){
                    $('#form3').data('bootstrapValidator').validate();
                    if ($("#form3").data('bootstrapValidator').isValid()) {
                        $.ajax({
                            type: 'post',
                            url: '../chanpinguanli/savechukuxinxi',
                            data: $('#form3').serialize(),
                            context: document.body,
                            success: function (data) {

                                $("#chukucaozuo").modal('hide');

								//重绘表格
                                datats.draw();

                                $.niftyNoty({
                                    type: 'success',
                                    icon: 'pli-like-2 icon-2x',
                                    message: '出库成功',
                                    container: 'floating',
                                    timer: 2000
                                });
                                this1='';
                            }
                        })
                    }
                })
			}


        });

		//查看出库详情
        $('#chanpinruku tbody').on('click','.chakan', function() {
            $("#chukuxiangqing").modal();

            var this1 = $(this).parent().parent();
            this1.siblings().removeClass('tog')
            this1.toggleClass('tog')
            this1.children().children("a").css("color", "inherit")
            //$(this).children().first().children().prop("checked",true)
            //获取点击的行号
            var rowIndex = $('#chanpinruku').DataTable().row(this1).index();
            //通过dataTable获取隐藏的值
            var rkid = $('#chanpinruku').DataTable().row(rowIndex).data().rkid;
            var jiagongfeizongji=$('#chanpinruku').DataTable().row(rowIndex).data().jiagongfeizongji;
            $.ajax({
                type: 'post',
                url: '../chanpinguanli/getchukuxinxiforrkid',
                data: "rkid="+rkid,
                context: document.body,
                success: function (data) {
                   var ckjgfzj= chukuxiangqing(data,jiagongfeizongji)

                    $("#rkjgfzj").text(jiagongfeizongji);
                    $("#ckjgfzj").text(ckjgfzj.toFormat(2));
                    var lirun =ckjgfzj.minus(new BigNumber(formaNum(jiagongfeizongji)))
                    $("#lirun").text(lirun.toFormat(2));
                    this1='';

                }

            })

        })

		//构建出库详细的datatable
        function chukuxiangqing(chukuxiangqing,jiagongfeizongji) {
            $('#chukuxiangqingmess').DataTable({
                destroy:true,    /*允许重新构建datatable  */
                processing: true,//功能控制处理指标
                //serverSide: true,//启动服务器模式，会向后台传递值
                paging : true,//是否分页
                lengthMenu: [ 10, 25, 50, 75, 100 ],//指定显示数据长度
                /* "autoWidth": true, */
                "scrollX": true,
                /* "scrollCollapse": true,  */ //表格高度随内容自适应
				searching:true,
                ordering:true,//启动排序
                order: [9, "desc" ],
                data:chukuxiangqing,
                columns: [
                    { data: 'logopath',

                        orderable: false,//制定是否排序
                        render:function (data, type, row, meta) {
                            if(data==null||data==""){
                                return '<img class="img-sm"  src="img/zwtp.jpg" >'
                            }else{
                                return '<img class="img-sm"  src="' + data + '" >'
                            }

                        }
                    },
                    { data: 'chanpinname' ,//接收数据字段名
                        orderable: false,//制定是否排序

                    },
                    { data: 'yinjia',

                        orderable: false,//制定是否排序
                    },

                    { data: 'yinkezhong' ,

                        orderable: false,//制定是否排序
                    },
                    { data: 'jiagongfei' ,

                        orderable: false,//制定是否排序
                    },
                    { data: 'jiagongfeizongji' ,

                        orderable: false,//制定是否排序
                    },
                    { data: 'zongjia' ,

                        orderable: false,//制定是否排序
                    },
                    { data: 'dailishang' ,

                        orderable: false,//制定是否排序
                    },
                    { data: 'chukuren' ,

                        orderable: false,//制定是否排序
                    },
                    { data: 'chukushijian' ,

                        orderable: true,//制定是否排序
                    },



                ],
                /*通过该属性可以制定columns中的各种属性，包括添加列和字段属性变换等，当然也可以在columns中实现  */
                columnDefs: [
                    /* {
                    "targets": -1,
                    "data": null,
                    "defaultContent": '<a href="javascript::##" data-target="#demo1" data-toggle="modal"> <i class="iconfont icon-tianxie"></i></a>'
                    }, */


                ],


                /*语言处理  */
                language: {
                    "sProcessing": "处理中...",
                    "sLengthMenu": "显示 _MENU_ 项结果",
                    "sZeroRecords": "没有匹配结果",
                    "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                    "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                    "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                    "sInfoPostFix": "",
                    "sSearch": "搜索:",
                    "sUrl": "",
                    "sEmptyTable": "暂未匹配到相应的数据",
                    "sLoadingRecords": "载入中...",
                    "sInfoThousands": ",",
                    "oPaginate": {
                        "sFirst": "首页",
                        "sPrevious": "上页",
                        "sNext": "下页",
                        "sLast": "末页"
                    },
                    "oAria": {
                        "sSortAscending": ": 以升序排列此列",
                        "sSortDescending": ": 以降序排列此列"
                    },
                    "decimal":','
                },



            });


            //计算利润值
            var dt2=$('#chukuxiangqingmess').DataTable();
            var ckjgfzj=new BigNumber(0);
			for(var i=0;i<dt2.rows().count();i++){
                ckjgfzj=ckjgfzj.plus(new BigNumber(formaNum(dt2.row(i).data().jiagongfeizongji)));

			}

			return ckjgfzj;


        }



        function formaNum(str) {
            str = str.replace(/,/g, "");//取消字符串中出现的所有逗号
            return str;
        }



    })

</script>

	<%--文件上传--%>
	<script>
		//上传文件的原始名字
		var oname="";
		//上传后文件的名字
		var fileName="";
        $("#dropz").dropzone({
            url: "../upload/uploadImages",
            maxFiles: 1,
            maxFilesize: 5,
            acceptedFiles: ".jpg,.gif,.png,.jpeg",
            addRemoveLinks:true,
            autoProcessQueue: true,//即拖入文件立即自动上传
            paramName: "file",
            dictMaxFilesExceeded: "您最多只能上传1个文件！",
            dictFileTooBig:"文件大小不能超过5M",
            dictInvalidInputType:"只允许上传图片：.jpg.jpeg.png.gif",

            init: function () {
				this.on("success",function (file,data) {
                    //上传成功是触发
				    $("#logopath").val(data.path)
                    oname=data.orname;
				    fileName=data.fileName;

                })
                this.on("removedfile",function(file){

                    if(file.name==oname){
                        $("#logopath").val("");
					}
                });
                this.on("maxfilesexceeded", function(file)
                {
                    this.removeFile(file);
                });

            }
        });



        //修改缩略图
        $("#dropzxiugai").dropzone({
            url: "../upload/uploadImages",
            maxFiles: 1,
            maxFilesize: 5,
            acceptedFiles: ".jpg,.gif,.png,.jpeg",
            addRemoveLinks:true,
            autoProcessQueue: true,//即拖入文件立即自动上传
            paramName: "file",
            dictMaxFilesExceeded: "您最多只能上传1个文件！",
            dictFileTooBig:"文件大小不能超过5M",
            dictInvalidInputType:"只允许上传图片：.jpg.jpeg.png.gif",
            dictDefaultMessage :'<img class="img-sm" src="' + $("#logopathxiugai").val()+ '"><br><span>点击修改</span>',
            init: function () {
                this.on("success",function (file,data) {
                    //上传成功是触发
                    $("#logopathxiugai").val(data.path)
                    oname=data.orname;
                    fileName=data.fileName;

                })
                this.on("removedfile",function(file){

                    if(file.name==oname){
                        $("#logopathxiugai").val("");
                    }
                });
                this.on("maxfilesexceeded", function(file)
                {
                    this.removeFile(file);
                });

            }
        });




	</script>
    
</body>
</html>

