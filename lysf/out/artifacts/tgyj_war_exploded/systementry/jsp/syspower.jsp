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

<title>权限管理</title>

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
						<h1 class="page-header text-overflow">权限管理</h1>
					</div>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End page title-->


					<!--Breadcrumb-->
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<ol class="breadcrumb">
						<li><a href="#"><i class="demo-pli-home"></i></a></li>
						<li><a href="#">系统管理</a></li>
						<li class="active">权限管理</li>
					</ol>

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
									<h3 class="panel-title">角色列表</h3>
								</div>
								<div class="panel-body">
									<div class="list-group bord-no" id="roleinfos">
                                    </div>
                                    <span hidden id="rid"></span>
								</div>
							</div>
							<!---------------------------------->


						</div>
						<div class="col-sm-4 col-md-10">

							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">权限结构树</h3>
								</div>
								<div class="panel-body">

									<div class="row">
										<ul id="ziyuantree" class="ztree">

										</ul>
									</div>
                                    <div class="row">
                                        <input class="btn btn-primary" id="baocun" value="保存" type="button">
                                    </div>
								</div>

							</div>
						</div>
					</div>


				</div>
				<!--===================================================-->
				<!--End page content-->

			</div>

			<jsp:include page="comment/nav_left.jsp"></jsp:include>

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
	<script  src="plugins/zTree/js/jquery.ztree.excheck.js"></script>

	<!--弹框样式插件-->
	<script src="plugins/bootbox/bootbox.min.js"></script>

	<!--DataTables [ OPTIONAL ]-->
	<script src="plugins/datatables/media/js/jquery.dataTables.js"></script>
	<script src="plugins/datatables/media/js/dataTables.bootstrap.js"></script>

    <script>

        $(function (){
            //获取角色列表信息
            var rid="";
            $.ajax({
                type: 'post',
                url: '../system/syspowerrole',
                data: $('#form1').serialize(),
                success: function (data) {
                    for(var i=0;i<data.length;i++){
                        if(i==0){

                            $("#roleinfos").append('<a class="list-group-item active" href="javascript::#" id="'+data[i].rid+'">'+data[i].rname +'</a>')
                        }else{
                            $("#roleinfos").append('<a class="list-group-item " href="javascript::#" id="'+data[i].rid+'">'+data[i].rname+'</a>')
                        }
                    }
                },
                //ajax处理完成后加载执行ztree
                complete:function () {
                    rid=$("#roleinfos a[class*=active]").attr("id");

                    ztree();
                }
            })
        })

        //给角色列表信息添加点击事件
        $("#roleinfos").off().on("click","a",function () {

            var thisis=$(this);
            thisis.attr("class","list-group-item active").siblings().attr("class","list-group-item");
            //获取当前激活的角色rid
            rid=$("#roleinfos a[class*=active]").attr("id");

            ztree();
        })


    </script>
	<%--构建资源列表树--%>
	<script>
        //获取所有点击的资源id
        var checkziyuanid=[];


        var setting = {
            check: {
                enable: true
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
            /*获取ztree的数据源  */

            async: {
                enable: true,
                url:"../system/sysresoucetree?",
                otherParam:["rid",function () {return $("#roleinfos a[class*=active]").attr("id");}]
            },
            /*回调函数，onclick点击菜单是触发事件  */
            callback: {
                onCheck: onCheck
            },


        };


        //点击复选框时触发
        function onCheck(e, treeId, treeNode) {
            checkziyuanid=[];
            var zTree = $.fn.zTree.getZTreeObj("ziyuantree");

            var  checkCount = zTree.getCheckedNodes(true)
            for(var i=0;i<checkCount.length;i++){
                checkziyuanid[i]=checkCount[i].id

            }
            console.log(checkziyuanid.toString());
            console.log(checkCount.length);

        }


        //默认展开树形菜单
        var curStatus = "init", curAsyncCount = 0, goAsync = false;
        function expandAll() {
            if (!check()) {
                return;
            }
            var zTree = $.fn.zTree.getZTreeObj("ziyuantree");
            expandNodes(zTree.getNodes());
            if (!goAsync) {
                curStatus = "";
            }
        }

        function expandNodes(nodes) {
            if (!nodes) return;
            curStatus = "expand";
            var zTree = $.fn.zTree.getZTreeObj("ziyuantree");
            for (var i=0, l=nodes.length; i<l; i++) {
                zTree.expandNode(nodes[i], true, false, false);//展开节点就会调用后台查询子节点
                if (nodes[i].isParent && nodes[i].zAsync) {
                    expandNodes(nodes[i].children);//递归
                } else {
                    goAsync = true;
                }
            }
        }
        function check() {
            if (curAsyncCount > 0) {
                return false;
            }
            return true;
        }

        function ztree(){
            $.fn.zTree.init($("#ziyuantree"), setting);
            setTimeout(function(){
                expandAll("ziyuantree");
            },500);//延迟加载
        }

	</script>

    //保存对象
    <script>

        $(function () {
            $("#baocun").click(function () {
                console.log(checkziyuanid)

                $.ajax({
                    type: 'post',
                    url: '../system/savepower',
                    data: { 'reids':checkziyuanid,'rid':$("#roleinfos a[class*=active]").attr("id") },
                    traditional:true,
                    success: function (data) {
                        if(data==true){
                            $.niftyNoty({
                                type: 'success',
                                icon: 'pli-like-2 icon-2x',
                                message: '保存权限成功',
                                container: 'floating',
                                timer: 2000
                            });
                        }
                    },
                })
            })
        })


    </script>


</body>
</html>

