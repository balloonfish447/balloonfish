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

<title>资源管理页面</title>

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
<link rel="stylesheet"
	href="plugins/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">


<%--样式风格--%>
<link id="theme" href="css/themes/type-d/theme-navy.min.css" rel="stylesheet">

<!--DataTables [ OPTIONAL ]-->
<link href="plugins/datatables/media/css/dataTables.bootstrap.css" rel="stylesheet">
<!--表单验证  -->
<link href="plugins/bootstrap-validator/bootstrapValidator.css" rel="stylesheet">

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
						<h1 class="page-header text-overflow">资源管理</h1>
					</div>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End page title-->


					<!--Breadcrumb-->
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<ol class="breadcrumb">
						<li><a href="javascript::#"><i class="demo-pli-home"></i></a></li>
						<li><a href="javascript::#">系统管理</a></li>
						<li class="active">资源管理</li>
					</ol>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End breadcrumb-->

				</div>

				<!--Page content-->
				<!--===================================================-->
				<div id="page-content">
					<div class="row">

						<div class="col-sm-4 col-md-12">

							<div class="panel">

								<div class="panel-body">
									<div class="row">
										<p class="text-danger">该页面涉及系统运行所需要的配置，非系统操作人员，请互操作该页面内容.</p>
									</div>
									<div class="row">
										<p>
										<button class="btn btn-primary"  id="add1">新增</button>

										</p>

									</div>
									<div class="row">
										<table id="sysresource"
											class="table table-striped table-bordered  table-hover" style="width: 100%">
											<thead>
												<tr>
													<th>序号</th>
													<th>资源名称</th>
													<th>资源链接</th>
													<th>资源级别</th>
													<th>上级菜单单名称</th>
													<th>上上级菜单名称</th>
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
					<h4 class="modal-title">资源修改界面</h4>
				</div>


				<!--Modal body-->
				<form class="form-horizontal"  id="form1">
					<input type="hidden" name="reid">
					<input type="hidden" name="rejigouid">
					<input type="hidden" name="reopjigouid">

					<div class="modal-body">
					<div class="panel-body">
						<div class="form-group">
							<label class="col-sm-3 control-label">资源名称：</label>
							<div class="col-sm-6">
								<input type="text" placeholder="请输入资源名称" class="form-control"
									id="demo-is-inputnormal1" name="rename" >
							</div>
						</div>

						<div class="form-group">
							<label for="demo-is-inputnormal3" class="col-sm-3 control-label">资源链接：</label>
							<div class="col-sm-6">
								<input type="text" placeholder="请输入该资源的链接地址" class="form-control"
									id="demo-is-inputnormal3" name="relink">
							</div>
						</div>
						
						
					</div>
					</div>
					<div class="modal-footer">
					<div class="panel-footer">
						<div class="row">
							<div class="col-sm-9 col-sm-offset-3">
								<button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
								<input class="btn btn-primary" id="baocun" type="button" value="保存">
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
		aria-labelledby="demo-default-modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<!--Modal header-->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<i class="pci-cross pci-circle"></i>
					</button>
					<h4 class="modal-title">资源添加页面</h4>
				</div>


				<!--Modal body-->
				<form class="form-horizontal"  id="form2" method="post" >
					

					<div class="modal-body">
					<div class="panel-body">
						<div class="form-group">
							<label class="col-sm-3 control-label">资源名称：</label>
							<div class="col-sm-6">
								<input type="text" placeholder="请输入用户名" class="form-control"
									 name="rename">
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-3 control-label">资源链接：</label>
							<div class="col-sm-6">
								<input type="text" placeholder="请输入资源链接" class="form-control"
									 name="relink"  >
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-3 control-label">资源级别：</label>
							<div class="col-sm-6">
								<select class="form-control" name="rejigouid" id="reopjigouid1">
									<option value="" selected>请选择资源级别</option>
									<option value="0">一级菜单</option>
									<option value="1">二级菜单</option>
									<option value="2">三级菜单</option>

								</select>
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-3 control-label">父菜单名称：</label>
							<div class="col-sm-6">
								<select  class="form-control" name="reopjigouid" id="reopjigouid2" disabled>
									<option value="" selected>不是一级菜单可以选择</option>
								</select>
							</div>
						</div>
						
						
					</div>
					</div>
					<div class="modal-footer">
					<div class="panel-footer">
						<div class="row">
							<div class="col-sm-9 col-sm-offset-3">
								<button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
								<input class="btn btn-primary" id="add" type="button" value="添加">
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

	<!--表单验证的js  -->
	<script src="plugins/bootstrap-validator/bootstrapValidator.js"></script>

	<%--表单验证--%>
	<script type="text/javascript">

        $(function () {
            var bootstrapValidator =$('#form2,#form1').bootstrapValidator({
                trigger: 'focus blur',
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh',
                },

                fields: {
                    rename: {
                        validators: {
                            notEmpty: {
                                message: '资源名称不能为空'
                            },
                        }
                     },
                    relink: {
                        validators: {
                            notEmpty: {
                                message: '资源链接不能为空'
                            },
                        }
                    },
                 },

            })

        });
	</script>
	<script>
        var datats="";
   		var sysresourcedata=function (){
    	
    		$('#sysresource').dataTable({
        	destroy:true,    /*允许重新构建datatable  */   
        	processing: true,//功能控制处理指标
        	//serverSide: true,//启动服务器模式，会向后台传递值
        	paging : true,//是否分页
        	lengthMenu: [ 10, 25, 50, 75, 100 ],//指定显示数据长度
        	/* "autoWidth": true, */
        	"scrollX": true,
        	/* "scrollCollapse": true,  */ //表格高度随内容自适应
        	//获取数据源 
        	ajax:{
        		
        		url:"../system/sysresourceinfo",	//请求地址
                dataSrc: "",	//默认为data,这里定义为空，则只需要传不带属性的数据              
        	}, 
        	ordering:false,//启动排序
        	
            columns: [
            	
                { data: 'reid' ,//接收数据字段名
                	visible:false,
                	
                },
                { data: 'resourcename',
                	
                	 orderable: false,//制定是否排序
                },
                { data: 'relink' ,
                	
                	 orderable: false,//制定是否排序

                },
                { data: 'rejigouid' ,

                    orderable: false,//制定是否排序
                    render: function (data, type, row, meta) {

                       if(data==0){

                          return "一级菜单"

                       }else if(data==1){
                          return "二级菜单"
					   }else if(data==2){
                           return "三级菜单"
					   }
                      }
                },
                { data: 'fucaidan' ,
                    orderable: false,//制定是否排序

                },
                { data: 'zicaidan' ,
                    orderable: false,//制定是否排序

                },

                { data: null,
                  orderable: false,//制定是否排序
                  //也可以这样添加自己想要的列data-target="#xiugai" data-toggle="modal"
                  defaultContent: '<a href="javascript::##" data-target="#xiugai" data-toggle="modal" title="修改" class="xiugai"> <i class="iconfont icon-tianxie"></i></a>'+
                	  '<a href="javascript::##"  title="删除"  class="shanchu"> <i class="iconfont icon-shanchu"></i></a>'
                }
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
            //获取datatable对象
             datats=$('#sysresource').DataTable();
        }
        sysresourcedata();



       //修改方法，注意datatable返回的数据和字段都是动态元素，只能通过jquery的on方法进行绑定
       $('#sysresource tbody').on('click','.xiugai', function() {

           var this1=$(this).parent().parent();
           this1.siblings().removeClass('tog')
           this1.addClass('tog')
           this1.children().children("a").css("color","inherit")

           //获取点击的行号
           var rowIndex = $('#sysresource').DataTable().row(this1).index();
           //通过dataTable获取隐藏的值
           var reid=$('#sysresource').DataTable().row(rowIndex).data().reid;
           var rename=$('#sysresource').DataTable().row(rowIndex).data().resourcename;
           var relink=$('#sysresource').DataTable().row(rowIndex).data().relink;
           var rejigouid=$('#sysresource').DataTable().row(rowIndex).data().rejigouid;
           var reopjigouid=$('#sysresource').DataTable().row(rowIndex).data().reopjigouid;
           //把页面上去到的值放入到弹出框中
           $("#xiugai input[name=reid]").val(reid)
           $("#xiugai input[name=rename]").val(rename)
           $("#xiugai input[name=relink]").val(relink)
           $("#xiugai input[name=rejigouid]").val(rejigouid)
           $("#xiugai input[name=reopjigouid]").val(reopjigouid)

           $("#baocun").off().click(function(){
               $('#form1').data('bootstrapValidator').validate();
               if ($("#form1").data('bootstrapValidator').isValid()) {
                   $.ajax({
                       type: 'post',
                       url: '../system/updateresource',
                       data: $('#form1').serialize(),
                       success: function (data) {
                           console.log(data)
                           $("#xiugai").modal('hide');
                           this1.children(":eq(0)").text(data.rename)
                           this1.children(":eq(1)").text(data.relink)
                           //把修改后的值放入到datatable中
                           datats.row(rowIndex).data().rename=data.rename;
                           datats.row(rowIndex).data().relink=data.relink;

                           this1.animate({backgroundColor: '#25476a !important', opacity: '0.5'}, 200);

                           this1.animate({backgroundColor: '#25476a !important', opacity: '1'}, 200);
                           this1 = '';
                           $.niftyNoty({
                               type: 'success',
                               icon: 'pli-like-2 icon-2x',
                               message: '修改成功',
                               container: 'floating',
                               timer: 2000
                           });
                       }
                   })
               }
           })



       });

       //删除，注意datatable返回的数据和字段都是动态元素，只能通过jquery的on方法进行绑定
       $('#sysresource tbody').on('click','.shanchu', function() {
           var thisis = $(this).parent().parent();
           thisis.siblings().removeClass('tog')
           thisis.toggleClass('tog')
           thisis.children().children("a").css("color","inherit")

           //获取点击的行号
           var rowIndex = $('#sysresource').DataTable().row(thisis).index();
           //通过dataTable获取隐藏的值
           var reid=$('#sysresource').DataTable().row(rowIndex).data().reid;
           console.log(datats);
           bootbox.confirm({
               message:"确认要删除该条数据吗？",
               size:"small",
               buttons: {
                   confirm: {
                       label: '确定',
                       className: 'btn-danger'
                   },
                   cancel: {
                       label: '取消',

                   }
               },
               callback:function(deletemess){
                   if(deletemess==true){
                       $.ajax({
                           url:'../system/deleteresource',
                           datatype:'boolean',
                           data:'reid='+reid,
                           context: document.body,
                           success:function(data){

                               if(data==true){
                                   thisis.hide(1000,function(){
                                       thisis.remove();
                                       thisis='';
                                       $.niftyNoty({
                                           type: 'success',
                                           icon : 'pli-like-2 icon-2x',
                                           message : '删除成功',
                                           container : 'floating',
                                           timer : 2000
                                       });
                                   })
                               }else{
                                   $.niftyNoty({
                                       type: 'success',
                                       icon : 'pli-like-2 icon-2x',
                                       message : '删除失败',
                                       container : 'floating',
                                       timer : 3000
                                   });
                               }
                           }
                       })
                   }
               }
           });

       })

       //新增判断
       $("#add1").click(function(){
           $('#xinzeng').modal()
       })
		//动态绑定下拉列表事件
		$("#reopjigouid1").off().on("click","option",function () {
            //获取下拉列表中的值，一级菜单默认为888不需要子菜单，二级菜单展开子菜单，三级菜单展开二级菜单

			var thisis=$(this);
			if(thisis.val()==888){
				$("#reopjigouid2").attr("disabled","disabled");
                $("#reopjigouid2").empty();
			}else{
                $("#reopjigouid2").removeAttr("disabled");
                $("#reopjigouid2").empty();
                $.ajax({
                    type: 'post',
                    url: '../system/selectresourcenameinfo',
                    data: $('#form2').serialize(),
                    success: function (datas) {
                        if(datas==null){
                            bootbox.alert("查询数据异常");
                        }else{

                            var select = $("#reopjigouid2");
                            for(var i=0;i<datas.length;i++){
								select.append("<option value='" + datas[i].reid + "' >" +  datas[i].rename + "</option>")
                            }


                        }
                    }
                })
			}

        })
       //新增数据
       $("#add").click(function(){

           $('#form2').data('bootstrapValidator').validate();
           if ($("#form2").data('bootstrapValidator').isValid()) {
               $.ajax({
                   type: 'post',
                   url: '../system/addresource',
                   data: $('#form2').serialize(),
                   success: function (data) {

                       $("#xinzeng").modal('hide');
                       //重绘表格
                       sysresourcedata();
                       $.niftyNoty({
                           type: 'success',
                           icon: 'pli-like-2 icon-2x',
                           message: '添加资源链接成功',
                           container: 'floating',
                           timer: 2000
                       });

                   }
               })
           }
       })


</script>

</body>
</html>

