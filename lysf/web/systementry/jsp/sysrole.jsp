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

<title>角色管理</title>

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
<link id="theme" href="css/themes/type-c/theme-navy.min.css" rel="stylesheet">

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
						<h1 class="page-header text-overflow">角色管理</h1>
					</div>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End page title-->


					<!--Breadcrumb-->
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<ol class="breadcrumb">
						<li><i class="demo-pli-home"></i></li>
						<li>系统管理</li>
						<li class="active">角色管理</li>
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
									<div class="row" style="margin-bottom: 20px">
										<button class="btn btn-primary"  id="add1">新增</button>

										

									</div>
									<div class="row">
										<table id="sysrole"
											class="table table-striped table-bordered  table-hover" style="width: 100%">
											<thead>
												<tr>
													<th>序号</th>
													<th>角色名称</th>
													<%--<th>所属机构</th>--%>
													
													<%--<th>角色关联人员数</th>--%>
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
	<!-- 修改内容弹出框内容 -->
	<div class="modal" id="xiugai" role="dialog" tabindex="-1"
		aria-labelledby="demo-default-modal" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<!--Modal header-->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<i class="pci-cross pci-circle"></i>
					</button>
					<h4 class="modal-title">角色修改界面</h4>
				</div>


				<!--Modal body-->


				<div class="modal-body">
					<form class="form-horizontal"  id="form1">
						<input type="hidden" name="rid">
						<input type="hidden" name="rbianma">
						<div class="form-group">
							<label class="control-label">:角色名称</label>
							<div class="col-sm-3">
								<input type="text" placeholder="请输入角色名称" class="form-control"
									id="demo-is-inputnormal1" name="rname" >
							</div>
						</div>

					</form>

					<h5  class="modal-title" style="color: red">该角色下人员详情</h5>
					<table id="sysroleuser"
						   class="table table-striped table-bordered  table-hover" style="width: 100%">
						<thead>
						<tr>
							<th>用户名</th>
							<th>手机号</th>
							<th>邮箱</th>
						</tr>
						</thead>

					</table>


				</div>
				<div class="modal-footer">

					<div class="row">
						<div class="col-sm-9 col-sm-offset-3">
							<button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
							<input class="btn btn-primary" id="baocun" type="button" value="保存">
						</div>
					</div>
				</div>

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
					<h4 class="modal-title">角色添加页面</h4>
				</div>


				<!--Modal body-->
				<form class="form-horizontal"  id="form2" method="post" action="../system/addrole">
					

					<div class="modal-body">
					<div class="panel-body">
						<div class="form-group">
							<label class="col-sm-3 control-label">角色名称：</label>
							<div class="col-sm-6">
								<input type="text" placeholder="请输入用户名" class="form-control"
									 name="rname">
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-3 control-label">所属机构：</label>
							<div class="col-sm-6">
								<input type="text" placeholder="请输入用户名" class="form-control"
									 name="rbianma" value="洛阳师范" readonly>
							</div>
						</div>
						
						
						
					</div>
					</div>
					<div class="modal-footer">
					<div class="panel-footer">
						<div class="row">
							<div class="col-sm-9 col-sm-offset-3">
								<button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
								<input class="btn btn-primary" id="add" type="submit" value="添加">
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
                    rname: {

                        validators: {
                            notEmpty: {
                                message: '角色名不能为空'
                            },
                            /*remote: {//ajax验证。server result:{"valid",true or false}
                                url: "../system/checkphone",
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

                            }*/
                        }

                        }
                    },

            })

        });
	</script>
	<script>
	 
    var datats=function (){
    	
    	 $('#sysrole').dataTable({    	
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
        		
        		url:"../system/sysroleinfo",	//请求地址
                dataSrc: "",	//默认为data,这里定义为空，则只需要传不带属性的数据              
        	}, 
        	ordering:false,//启动排序
        	
            columns: [
            	
                { data: 'rid' ,//接收数据字段名
                	visible:false,
                	
                },
                { data: 'rname',
                	
                	 orderable: false,//制定是否排序
                },

               /* { data: 'ruser' ,
                	
                	 orderable: false,//制定是否排序
                    render: function (data, type, row, meta) {
                    	if(data>0){
							return "该角色关联了"+data+"人，不能删除该角色"
						}else{
                            return "<span style='color:red'>该角色关联了"+data+"人，可以删除该角色</span>";
						}

                    }
                },*/
                
              
                { data: null,
                  orderable: false,//制定是否排序
                  //也可以这样添加自己想要的列data-target="#xiugai" data-toggle="modal"
                  defaultContent: '<a href="javascript::##" data-target="#xiugai" data-toggle="modal" title="修改" class="xiugai"> <i class="iconfont icon-tianxie"></i></a>'+
                	  '<a href="javascript::##"  title="删除"  class="shanchu"> <i class="iconfont icon-shanchu"></i></a>'
                }
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
             
    }
  	datats();

    //删除，注意datatable返回的数据和字段都是动态元素，只能通过jquery的on方法进行绑定
    $('#sysrole tbody').on('click','.shanchu', function() {
        var thisis = $(this).parent().parent();
        thisis.siblings().removeClass('tog')
        thisis.toggleClass('tog')
        thisis.children().children("a").css("color","inherit")

        //获取点击的行号
        var rowIndex = $('#sysrole').DataTable().row(thisis).index();
        //通过dataTable获取隐藏的值
        var rid=$('#sysrole').DataTable().row(rowIndex).data().rid;

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
                        url:'../system/deleterole',
                        datatype:'boolean',
                        data:'rid='+rid,
                        context: document.body,
                        success:function(data){

                            if(data==0){
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
                                    message : '该角色尚有关联的用户，请先删除用户',
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
    //新增数据
    /*$("#add").click(function(){
        $.ajax({
         type:'post',
         url:'../system/addrole',
         data: $('#form2').serialize(),
         success:function(data){
             console.log(data)
             $("#xinzeng").modal('hide');
             var newtr='<tr role="row" class="odd tog">'+
             '<td>'+data.rid+'</td>'+
             '<td>'+data.rname+'</td>'+
             '<td>'+data.rbianma+'</td>'+
             '<td>'+data.rquanxian+'</td>'+

             '<td><a href="javascript::##" data-target="#xiugai" data-toggle="modal" title="修改" style="color: inherit; " class="xiugai"> <i class="iconfont icon-tianxie"></i></a><a href="javascript::##" title="删除"  style="color: inherit;" class="shanchu"> <i class="iconfont icon-shanchu"></i></a></td></tr>'
             $('#sysrole tbody tr:eq(0)').before(newtr);


         }
     })
    })*/


    //修改方法，注意datatable返回的数据和字段都是动态元素，只能通过jquery的on方法进行绑定
    $('#sysrole tbody').on('click','.xiugai', function() {

        var this1=$(this).parent().parent();
        this1.siblings().removeClass('tog')
        this1.addClass('tog')
        this1.children().children("a").css("color","inherit")

        //获取点击的行号
        var rowIndex = $('#sysrole').DataTable().row(this1).index();
        //通过dataTable获取隐藏的值
        var rid=$('#sysrole').DataTable().row(rowIndex).data().rid;
        var rname=$('#sysrole').DataTable().row(rowIndex).data().rname;
        var ruser=$('#sysrole').DataTable().row(rowIndex).data().ruser;
        var rbianma=$('#sysrole').DataTable().row(rowIndex).data().rbianma;
        //把页面上去到的值放入到弹出框中
        $("#xiugai input[name=rid]").val(rid)
        $("#xiugai input[name=rname]").val(rname)
        $("#xiugai input[name=rbianma]").val(rbianma)

        //查询角色相关人员信息
        $.ajax({
            type: 'post',
            url: '../system/getroleuser',
            data: "rid="+rid,
            success: function (data) {
                sysroleuser(data);
            }
        })

        $("#baocun").off().click(function(){
            $('#form1').data('bootstrapValidator').validate();
            if ($("#form1").data('bootstrapValidator').isValid()) {
                $.ajax({
                    type: 'post',
                    url: '../system/updaterolename',
                    data: $('#form1').serialize(),
                    success: function (data) {
                        $("#xiugai").modal('hide')
                        datats();
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

    function sysroleuser(roleuser) {
            $('#sysroleuser').dataTable({
                destroy:true,    /*允许重新构建datatable  */
                processing: true,//功能控制处理指标
                //serverSide: true,//启动服务器模式，会向后台传递值
                paging : true,//是否分页
                lengthMenu: [ 10, 25, 50, 75, 100 ],//指定显示数据长度
                /* "autoWidth": true, */
                "scrollX": true,
                /* "scrollCollapse": true,  */ //表格高度随内容自适应

                ordering:false,//启动排序
				data:roleuser,
                columns: [

                    { data: 'username' ,//接收数据字段名
                        orderable: false,//制定是否排序

                    },
                    { data: 'phone',

                        orderable: false,//制定是否排序
                    },

                    { data: 'email' ,

                        orderable: false,//制定是否排序
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

        }
   		
   			
</script>
	<%--新增消息提示--%>
<script>
		$(function () {
			var addrole_mess='${requestScope.addrole_mess}'
			if(addrole_mess!=null&&addrole_mess!=""){
                $.niftyNoty({
                    type: 'success',
                    icon: 'pli-like-2 icon-2x',
                    message: addrole_mess,
                    container: 'floating',
                    timer: 2000
                });
			}
            addrole_mess="";
        })
	</script>

</body>
</html>

