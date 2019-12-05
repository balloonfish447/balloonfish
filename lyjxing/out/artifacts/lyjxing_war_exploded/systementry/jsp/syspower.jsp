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

<title>组织结构管理</title>

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



<!--zTree [ OPTIONAL ]-->
<link rel="stylesheet" href="plugins/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">


<%--样式风格--%>
<link id="theme" href="css/themes/type-d/theme-navy.min.css" rel="stylesheet">
<!--DataTables [ OPTIONAL ]-->
<link href="plugins/datatables/media/css/dataTables.bootstrap.css" rel="stylesheet">

<link href="plugins/datatables/extensions/Buttons/css/buttons.dataTables.css" rel="stylesheet">

<!--Bootstrap Table [ OPTIONAL ]-->
<link href="plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
<!--X-editable [ OPTIONAL ]-->
<link href="plugins/x-editable/css/bootstrap-editable.css" rel="stylesheet">

<style type="text/css">
.tog {
	background-color: #294f75 !important;
	color: #ffffff;
}
</style>
</head>

<!--TIPS-->
<!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
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
						<h1 class="page-header text-overflow">组织结构管理</h1>
					</div>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End page title-->


					<!--Breadcrumb-->
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<ol class="breadcrumb">
						<li><a href="#"><i class="demo-pli-home"></i></a></li>
						<li><a href="#">系统管理</a></li>
						<li class="active">组织结构管理</li>
					</ol>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End breadcrumb-->

				</div>


				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">
					<div class="row">
						<div class="col-sm-2 col-md-2">

							<!-- JSON Example -->
							<!---------------------------------->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">组织结构列表</h3>
								</div>
								<div class="panel-body">
									<ul id="treeDemo" class="ztree">

									</ul>
								</div>
							</div>
							<!---------------------------------->


						</div>
						<div class="col-sm-2 col-md-2">

							<!-- JSON Example -->
							<!---------------------------------->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">角色列表</h3>
								</div>
								<div class="panel-body">
									<ul id="treeDemo1" class="ztree">

									</ul>
								</div>
							</div>
							<!---------------------------------->


						</div>
						<div class="col-sm-2 col-md-8">

							<div class="panel">

								<div class="panel-body">
									<div class="row" style="margin-bottom: 20px">
										<button class="btn btn-default" id="add1">新增</button>
										<button class="btn btn-primary">删除</button>


									</div>
									<div class="row">
										<table id="demo-dt-basic"
											class="table table-striped table-bordered  table-hover"
											style="width: 100%">
											<thead>
												<tr>
													<th>序号</th>
													<th>资源名称</th>
													<th>资源链接</th>
													<th>资源代码</th>

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



			<!--ASIDE-->
			<!--===================================================-->
			<jsp:include page="comment/nav_right.jsp"></jsp:include>
			<!--===================================================-->
			<!--END ASIDE-->


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
	<!-- 修改内容弹出框内容 -->
	<div class="modal" id="xiugai" role="dialog" tabindex="-1"
		aria-labelledby="demo-default-modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<!--Modal header-->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<i class="pci-cross pci-circle"></i>
					</button>
					<h4 class="modal-title">用户数据修改界面</h4>
				</div>


				<!--Modal body-->
				<form class="form-horizontal" id="form1">
					<input type="hidden" name="uid">
					<div class="modal-body">
						<div class="panel-body">
							<div class="form-group">
								<label class="col-sm-3 control-label">用户名：</label>
								<div class="col-sm-6">
									<input type="text" placeholder="请输入用户名" class="form-control"
										id="demo-is-inputnormal1" name="username">
								</div>
							</div>
							<div class="form-group">
								<label for="demo-is-inputnormal2" class="col-sm-3 control-label">密码：</label>
								<div class="col-sm-6">
									<input type="text" placeholder="请输入用户名" class="form-control"
										id="demo-is-inputnormal2" name="password">
								</div>
							</div>
							<div class="form-group">
								<label for="demo-is-inputnormal3" class="col-sm-3 control-label">邮箱：</label>
								<div class="col-sm-6">
									<input type="text" placeholder="请输入邮箱" class="form-control"
										id="demo-is-inputnormal3" name="email">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">手机号：</label>
								<div class="col-sm-3">
									<input type="text" placeholder="请输入手机号" class="form-control"
										id="demo-is-inputnormal4" name="phone">
								</div>
							</div>

						</div>
					</div>
					<div class="modal-footer">
						<div class="panel-footer">
							<div class="row">
								<div class="col-sm-9 col-sm-offset-3">
									<button data-dismiss="modal" class="btn btn-default"
										type="button">Close</button>
									<input class="btn btn-primary" id="baocun" type="button"
										value="保存">
								</div>
							</div>
						</div>
					</div>
				</form>
				<!--===================================================-->
				<!--End Input Size-->

			</div>
		</div>
	</div>


	<!--===================================================-->
	<!-- 新增内容弹出框内容 -->
	<div class="modal" id="xinzeng" role="dialog" tabindex="-1"
		aria-labelledby="demo-large-modal" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<!--Modal header-->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<i class="pci-cross pci-circle"></i>
					</button>
					<h4 class="modal-title">添加权限页面</h4>
				</div>
				<input type="hidden" name="rid" value="" id="rid"> <input
					type="hidden" name="organizeid" value="" id="oid">
				<!--Modal body-->
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-6 table-toolbar-left">
							<button id="add" class="btn btn-purple">
								<i class="demo-pli-add"></i> 添加
							</button>

						</div>
						<div class="col-sm-6 table-toolbar-right">
							<div class="form-group">
								<input id="demo-input-search2" type="text" placeholder="Search"
									class="form-control" autocomplete="off">
							</div>

						</div>
					</div>

					<div class="table-responsive">
						<table class="table table-striped table-bordered  table-hove" id="resourcetable" style="width: 100%">
							<thead>
								<tr>
									<th>资源名称</th>
									<th>资源链接</th>
									<th>资源类型</th>
									<th>资源编号</th>
									<th>操作</th>
								</tr>
							</thead>
						
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<div class="row">
						<div class="col-sm-9 col-sm-offset-3">选择资源进行添加授权</div>
					</div>
				</div>
			</div>
			<!--===================================================-->
			<!--End Input Size-->
		</div>
	</div>






	<!--JAVASCRIPT-->

	<!--jQuery [ REQUIRED ]-->
	<script src="js/jquery.min.js"></script>
	<!--Modals [ SAMPLE ]-->
	<script src="js/demo/ui-modals.js"></script>

	<!--BootstrapJS [ RECOMMENDED ]-->
	<script src="js/bootstrap.min.js"></script>


	<!--NiftyJS [ RECOMMENDED ]-->
	<script src="js/nifty.min.js"></script>



	<!--zTree [ OPTIONAL ]-->
	<script src="plugins/zTree/js/jquery.ztree.core.js"></script>

	<!--弹框样式插件-->
	<script src="plugins/bootbox/bootbox.min.js"></script>

	<!--DataTables [ OPTIONAL ]-->
	<script src="plugins/datatables/media/js/jquery.dataTables.js"></script>
	<script src="plugins/datatables/media/js/dataTables.bootstrap.js"></script>

	<script>
	var resourcetable = function() {
	
		$('#resourcetable').dataTable({
				destroy : true, /*允许重新构建datatable  */
				processing : true,//功能控制处理指标
				//serverSide: true,//启动服务器模式，会向后台传递值
				paging : true,//是否分页
				lengthMenu : [ 10, 25, 50, 75, 100 ],//指定显示数据长度	
				"scrollX" : true,
				//获取数据源 
				
				ajax : {
					url : "../system/sysresource", //请求地址
					dataSrc : "", //默认为data,这里定义为空，则只需要传不带属性的数据       
					
				},
				
				ordering : false,//启动排序
				columns : [
							{
								data : 'reid',//接收数据字段名
							},
							{
								data : 'rename',
								orderable : false,//制定是否排序
							},
							{
								data : 'relink',
								orderable : false,//制定是否排序
								render : function(data, type, row,meta) {
									if (data != null && data != "") {
									var newdate = '<a style="color:red" href="'+data+'">'
													+ data + '</a>'
									return newdate
									} else {
										return data
									}
								}
							},
							{
								data : 'rebianhao',
								orderable : false,//制定是否排序
							},
							{
								data : null,
								orderable : false,//制定是否排序
								//也可以这样添加自己想要的列data-target="#xiugai" data-toggle="modal"
								defaultContent : '<a href="javascript::##" data-target="#xiugai" data-toggle="modal" title="修改"> <i class="iconfont icon-tianxie"></i></a>'
									
							} 
						],
							

							/*语言处理  */
							language : {
								"sProcessing" : "处理中...",
								"sLengthMenu" : "显示 _MENU_ 项结果",
								"sZeroRecords" : "没有匹配结果",
								"sInfo" : "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
								"sInfoEmpty" : "显示第 0 至 0 项结果，共 0 项",
								"sInfoFiltered" : "(由 _MAX_ 项结果过滤)",
								"sInfoPostFix" : "",
								"sSearch" : "搜索:",
								"sUrl" : "",
								"sEmptyTable" : "暂未匹配到相应的数据",
								"sLoadingRecords" : "载入中...",
								"sInfoThousands" : ",",
								"oPaginate" : {
									"sFirst" : "首页",
									"sPrevious" : "上页",
									"sNext" : "下页",
									"sLast" : "末页"
								},
								"oAria" : {
									"sSortAscending" : ": 以升序排列此列",
									"sSortDescending" : ": 以降序排列此列"
								},
								"decimal" : ','
							},

						});

	}
	</script>
	<script>
		var datats = function(rid) {

			$('#demo-dt-basic')
					.dataTable(
							{
								destroy : true, /*允许重新构建datatable  */
								processing : true,//功能控制处理指标
								//serverSide: true,//启动服务器模式，会向后台传递值
								paging : true,//是否分页
								lengthMenu : [ 10, 25, 50, 75, 100 ],//指定显示数据长度
								/* "autoWidth": true, */
								"scrollX" : true,
								/* "scrollCollapse": true,  *///表格高度随内容自适应
								//获取数据源 
								ajax : {

									url : "../system/syspower?rid=" + rid, //请求地址
									dataSrc : "", //默认为data,这里定义为空，则只需要传不带属性的数据              
								},
								ordering : false,//启动排序

								columns : [

										{
											data : 'reid',//接收数据字段名

										},
										{
											data : 'rename',

											orderable : false,//制定是否排序
										},
										{
											data : 'relink',

											orderable : false,//制定是否排序
											render : function(data, type, row,
													meta) {
												if (data != null && data != "") {
													var newdate = '<a style="color:red" href="'+data+'">'
															+ data + '</a>'
													return newdate
												} else {
													return data
												}

											}
										},
										{
											data : 'rebianhao',

											orderable : false,//制定是否排序

										},

										{
											data : null,
											orderable : false,//制定是否排序
											//也可以这样添加自己想要的列data-target="#xiugai" data-toggle="modal"
											defaultContent : '<a href="javascript::##" data-target="#xiugai" data-toggle="modal" title="修改"> <i class="iconfont icon-tianxie"></i></a>'
													+ '<a href="javascript::##"  title="删除" id="shanchu" > <i class="iconfont icon-shanchu"></i></a>'
										} ],
								/*通过该属性可以制定columns中的各种属性，包括添加列和字段属性变换等，当然也可以在columns中实现  */
								columnDefs : [
								/* {
								"targets": -1,
								"data": null,
								"defaultContent": '<a href="javascript::##" data-target="#demo1" data-toggle="modal"> <i class="iconfont icon-tianxie"></i></a>'
								}, */

								],

								/*语言处理  */
								language : {
									"sProcessing" : "处理中...",
									"sLengthMenu" : "显示 _MENU_ 项结果",
									"sZeroRecords" : "没有匹配结果",
									"sInfo" : "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
									"sInfoEmpty" : "显示第 0 至 0 项结果，共 0 项",
									"sInfoFiltered" : "(由 _MAX_ 项结果过滤)",
									"sInfoPostFix" : "",
									"sSearch" : "搜索:",
									"sUrl" : "",
									"sEmptyTable" : "暂未匹配到相应的数据",
									"sLoadingRecords" : "载入中...",
									"sInfoThousands" : ",",
									"oPaginate" : {
										"sFirst" : "首页",
										"sPrevious" : "上页",
										"sNext" : "下页",
										"sLast" : "末页"
									},
									"oAria" : {
										"sSortAscending" : ": 以升序排列此列",
										"sSortDescending" : ": 以降序排列此列"
									},
									"decimal" : ','
								},

							});

		}

		window.onload = datats(1111111);

		//修改方法，注意datatable返回的数据和字段都是动态元素，只能通过jquery的on方法进行绑定
		$('#demo-dt-basic tbody').on('click', 'tr', function() {

			var this1 = $(this);
			$(this).siblings().removeClass('tog')
			$(this).addClass('tog')
			$(this).children().children("a").css("color", "inherit")

			var uid = $(this).children(":eq(0)").text();
			var username = $(this).children(":eq(1)").text();
			var password = $(this).children(":eq(2)").text();
			var email = $(this).children(":eq(3)").text();
			var phone = $(this).children(":eq(4)").text();
			/* var registerAddress=$(this).children(":eq(5)").text();
			var registerTime=$(this).children(":eq(6)").text();
			var loginTime=$(this).children(":eq(7)").text();
			var lastLoginTime=$(this).children(":eq(8)").text();
			var registerAddress=$(this).children(":eq(9)").text();
			var registerTime=$(this).children(":eq(10)").text();
			var loginCount=$(this).children(":eq(11)").text();
			var signed=$(this).children(":eq(12)").text();
			var registerTime=$(this).children(":eq(10)").text();
			var loginCount=$(this).children(":eq(11)").text();
			var signed=$(this).children(":eq(12)").text(); */

			$("#xiugai input[name=uid]").val(uid)
			$("#xiugai input[name=username]").val(username)
			$("#xiugai input[name=password]").val(password)
			$("#xiugai input[name=email]").val(email)
			$("#xiugai input[name=phone]").val(phone)
			$("#baocun").click(function() {
				$.ajax({
					type : 'post',
					url : '../system/systemUser',
					data : $('#form1').serialize(),
					success : function(data) {
						$("#xiugai").modal('hide');
						this1.children(":eq(1)").text(data.username)
						this1.children(":eq(2)").text(data.password)
						this1.children(":eq(3)").text(data.email)
						this1.children(":eq(4)").text(data.phone)
						console.log(this1);
						this1.animate({
							backgroundColor : '#25476a !important',
							opacity : '0.5'
						}, 200);

						this1.animate({
							backgroundColor : '#25476a !important',
							opacity : '1'
						}, 200);
						this1 = '';

					}
				})
			})

		});

		//删除，注意datatable返回的数据和字段都是动态元素，只能通过jquery的on方法进行绑定
		$('#demo-dt-basic tbody').on(
				'click',
				'#shanchu',
				function() {

					var thisis = $(this);
					var uid = $(this).parent().parent().children(":eq(0)")
							.text();
					console.log(uid)
					bootbox.confirm({
						message : "确认要删除该条数据吗？",
						size : "small",
						callback : function(deletemess) {
							if (deletemess == true) {
								$.ajax({
									url : '../system/deleteOrgUser',
									datatype : 'boolean',
									data : 'uid=' + uid,
									context : document.body,
									success : function(data) {
										console.log(data)
										if (data == true) {
											thisis.parent().parent().hide(
													1000,
													function() {
														thisis.parent()
																.parent()
																.remove();
														thisis = '';
													})

										}
									}
								})
							}
						}
					});

				})

		//新增判断
		$("#add1").click(function() {

			var opd = $("#oid").val();

			var rid = $("#rid").val();

			if ((opd != null && opd !== "") && (rid != null && rid !== "")) {
				$('#xinzeng').modal()
				resourcetable();
				
			} else {
				alert("请先选择角色！！")
			}

		})
		//新增数据
		
		$("#add").click(function() {
			
		})
	</script>
	<!--zTree [ OPTIONAL ]-->
	<SCRIPT type="text/javascript">
	
		$("#oid").val("")
		$("#rid").val("")	
        var setting = {
            data: {
                simpleData: {
                    enable: true,
                    rootPId:0//修正父节点的默认值，默认treeNode中父节点的pid为null
                }
            },
      		/*回调函数，onclick点击菜单是触发事件  */
        	callback: {
        		onClick: function (event, treeId, treeNode) {  
        			//把角色id复制到隐藏变量中
        			$("#oid").val(treeNode.id)	
					tree1(treeNode.id);
					
       			
        		}
        	}
        
        };
       
        /*获取ztree的数据源  */
        $.ajax({
            type: "GET",
            url: "../system/sysorg",
            dataType: "json",
            async: true,
            success: function(data){
            	//异步加载完成调用初始化tree	
            	inittree(data)
            }

        });
		function inittree(zNodes){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			
		}
       
    </SCRIPT>

	<script type="text/javascript">
    function tree1(oid){
    	var setting = {
			data: {
				simpleData: {
					enable: true
				}
			},
        	async: {
    			enable: true,
    			url:"../system/syspowerrole?oid="+oid,
    			
    		},
    		/*回调函数，onclick点击菜单是触发事件  */
        	callback: {
        		onClick: function (event, treeId, treeNode) {  
        			//把角色id复制到隐藏变量中
        			$("#rid").val(treeNode.id)	
        			datats(treeNode.id);
       			
        		},
    		 //一次性加载所有数据，父节点不需要再异步加载，否则就会造成循环加载
	    		beforeAsync: function (treeId, treeNode) {
					if(treeNode!=null){
						return !treeNode.isParent
					}
		        	return true;
				}, 
        	}
		};
			$.fn.zTree.init($("#treeDemo1"), setting);
		}
			
		
		//-->
    
    </script>


</body>
</html>

