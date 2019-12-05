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

<title>用户管理</title>

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
<link href="plugins/animate-css/animate.min.css" rel="stylesheet">

<!--表单验证  -->
<link href="plugins/bootstrap-validator/bootstrapValidator.css" rel="stylesheet">
<style type="text/css">
.tog {
	background-color: #294f75 !important;
	color: #ffffff ;
}
#demo_dt-basic{
	min-width: 100%
}
#demo-dt-basic tr{
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	
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
						<h1 class="page-header text-overflow">用户管理</h1>
					</div>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End page title-->
					<ol class="breadcrumb">
						<li><a href="javascript::#"><i class="demo-pli-home"></i></a></li>
						<li><a href="javascript::#">系统管理</a></li>
						<li class="active">用户管理</li>
					</ol>
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
										<button class="btn btn-danger" id="batchdelete">批量删除</button>


									</div>
									<div class="row">
									<div class="alert alert-mint" style="text-align: center;display: none" id="quanxuantishi">
					                    
					                    <strong>已选择本页的<span id="pagesize"></span>条数据,  <a href="#" class="alert-link" style="font-weight: 400" id="quanbuxuanze">勾选全部的 <span id="totalsize"></span> 数据</a></strong>
					                </div>
										<table id="demo-dt-basic"
											class="table table-striped table-bordered  table-hover" style="width: 100%">
											<thead>
												<tr>	
													<th><input type="checkbox" name="allusers" id="checkAll" ></th>											

													<th>用户名</th>
													<th>密码</th>
													<th>用户邮箱</th>
													<th>手机号</th>
													<th>注册时间</th>
													<th>角色名称</th>
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
		<div class="modal-dialog">
			<div class="modal-content">

				<!--Modal header-->
				<div class="modal-header" style="border-bottom: 1px solid #e5e5e5;">
					<button type="button" class="close" data-dismiss="modal">
						<i class="pci-cross pci-circle"></i>
					</button>
					<h4 class="modal-title">用户数据修改界面</h4>
				</div>


				<!--Modal body-->
				<form class="form-horizontal"  id="form1" method="post">
					<input type="hidden" name="uid">
					<div class="modal-body">
					
						<div class="form-group">
							<label class="col-sm-3 control-label"><span style="color: red">*</span>用户名：</label>
							<div class="col-sm-6">
								<input type="text" placeholder="请输入用户名" class="form-control"
									name="username">
							</div>
						</div>
						<div class="form-group">
							<label for="demo-is-inputnormal2" class="col-sm-3 control-label"><span style="color: red">*</span>密码：</label>
							<div class="col-sm-6">
								<input type="text" placeholder="请输入用户名" class="form-control"
									 name="password">
							</div>
						</div>
						<div class="form-group">
							<label for="demo-is-inputnormal3" class="col-sm-3 control-label"><span style="color: red">*</span>邮箱：</label>
							<div class="col-sm-6">
								<input type="text" placeholder="请输入邮箱" class="form-control"
									 name="email">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label"><span style="color: red">*</span>手机号：</label>
							<div class="col-sm-6">
								<input type="text" placeholder="请输入手机号" class="form-control"
									 name="phone" flag="xiugai">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label"><span style="color: red">*</span>角色：</label>
							<div class="col-sm-6">
								<select class="form-control" name="roleid" id="roleid1">

								</select>
							</div>
						</div>
						
					
					</div>
					<div class="modal-footer">
					
						<div class="row">
							<div class="col-sm-9 col-sm-offset-3">
								<button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
								<input class="btn btn-primary" id="baocun" type="button" value="保存">
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
				<div class="modal-header" style="border-bottom: 1px solid #e5e5e5;">
					<button type="button" class="close" data-dismiss="modal">
						<i class="pci-cross pci-circle"></i>
					</button>
					<h4 class="modal-title">用户数据添加界面</h4>
				</div>


				<!--Modal body-->
				<form class="form-horizontal"  id="form2"  method="post">

					<div class="modal-body">
					
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
								<input type="text" placeholder="请输入用户名" class="form-control"
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
								<button class="btn btn-primary" id="add" type="button" value="添加">添加</button>
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

    });
	</script>
	<!--格式化时间的函数  -->
	<script type="text/javascript">
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
	<script type="text/javascript">
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
    	  totalsize=$('#demo-dt-basic').DataTable().page.info().recordsTotal;
    	 $("#totalsize").text(totalsize);
    	 //获取当前页数据
    	  pagesize=$('#demo-dt-basic').DataTable().page.info().length;
    	 $("#pagesize").text(pagesize);
    	 if($(this).is(':checked')){
    		 checkedIds=[];
				$('input[name="checkusers"]').each(function(){
					$(this).prop("checked",true);
					$("#demo-dt-basic tbody tr").addClass('tog')
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
					$("#demo-dt-basic tbody tr").removeClass('tog')
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
	 $("#demo-dt-basic tbody").on("click",'[name=checkusers]:checkbox',function(){
		
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
    	 var oid=$("#oid").val();
    	 tempcheckedIds=checkedIds;
    	 checkedIds=[];
    	 //放入一个all作为判断的依据
    	 checkedIds.push('all');
    	 checkedIds.push(oid);
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
  $('#demo-dt-basic').on('draw.dt',function() {
	//判断chekedIds的第一个值是否为all，是的话默认页面跳转后复选框选中
	   	 if(checkedIds[0]!=null&&checkedIds[0]=="all"){
	   		
	   	 		$("input[name='checkusers']").each(function(){
	   	 		
	   	 			$(this).prop("checked", true)
	   	 			
	   				$("#demo-dt-basic tbody tr").addClass('tog')
	   				
	   				
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
    	
    	$('#demo-dt-basic').dataTable({
        	destroy:true,    /*允许重新构建datatable  */   
        	processing: true,//功能控制处理指标
        	serverSide: true,//启动服务器模式，会向后台传递值
        	paging : true,//是否分页
        	lengthMenu: [ 10, 25, 50, 75, 100 ],//指定显示数据长度
        	"autoWidth": true, 
        	 "scrollX": true,
            ordering:false,//启动排序
        	/* "scrollCollapse": true,  */ //表格高度随内容自适应
        	//获取数据源 
        	ajax:{
        		
        		url:"../system/sysorgour",	//请求地址
                dataSrc: "data",	//默认为data,这里定义为空，则只需要传不带属性的数据              
        	}, 

            columns: [
            	{ data: 'uid',
                    orderable: false,//制定是否排序
                  //数据渲染
                	render: function (data, type, row, meta) {
                		return '<input type="checkbox" name="checkusers" id='+data+' value='+data+'>'
                	}
        	  
                  },
            	

                { data: 'username',
                	
                	 orderable: false,//制定是否排序
                },
                { data: 'password' ,
                	
                	 orderable: false,//制定是否排序
                },
                { data: 'email' ,
                	
                	 orderable: false,//制定是否排序
                },
                { data: 'phone',
                	
                	 orderable: false,//制定是否排序	
                },

                { data: 'registerTime', 
					render:function(data, type, row, meta){
						if(data!=null&&data!=""){
							var newdate=timeStamp2String(data)
	                		return newdate
						}else{
							return data
						}
                		
                		
                	}
                	
                },



                { data: 'rname',
                	//数据渲染
                	render: function (data, type, row, meta) {
                		
                		if(data!=null&&data!=""){
                			
                			if(data=='总经理'){
                				return '<span style="color:red">'+data+'</span>'
                			}else{
                				return data
                			}
                			
                		}else{
                			return data
                		}
                	}
                },
                { data: null,
                  orderable: false,//制定是否排序
                  //也可以这样添加自己想要的列data-target="#xiugai" data-toggle="modal"
                  defaultContent: '<a href="javascript::##" data-target="#xiugai" data-toggle="modal" title="修改" class="xiugai"> <i class="iconfont icon-tianxie"></i></a>'+
                	  '<a href="javascript::##"  title="删除" id="shanchu" class="shanchu"> <i class="iconfont icon-shanchu"></i></a>'
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



    var datats=$('#demo-dt-basic').DataTable();

   	//修改方法，注意datatable返回的数据和字段都是动态元素，只能通过jquery的on方法进行绑定
    $('#demo-dt-basic tbody').on('click','.xiugai', function() {

			 		var this1=$(this).parent().parent();

             		this1.siblings().removeClass('tog')
             		this1.toggleClass('tog')
             		this1.children().children("a").css("color","inherit")
    				//$(this).children().first().children().prop("checked",true)
    				//获取点击的行号
    				var rowIndex =$('#demo-dt-basic').DataTable().row(this1).index();
    		 		//通过dataTable获取隐藏的值
    				var uid=$('#demo-dt-basic').DataTable().row(rowIndex).data().uid;
    				 /* var uid=$(this).children(":eq(0)").text();  */
    		 		
    				var username=$('#demo-dt-basic').DataTable().row(rowIndex).data().username;
    				var password=$('#demo-dt-basic').DataTable().row(rowIndex).data().password;
    				var email=$('#demo-dt-basic').DataTable().row(rowIndex).data().email;
    				var phone=$('#demo-dt-basic').DataTable().row(rowIndex).data().phone;
             		var rolename=$('#demo-dt-basic').DataTable().row(rowIndex).data().rname;

             $("#roleid1").empty();

             $.ajax({
                 type: 'post',
                 url: '../system/sysroleinfo',
                 success: function (datas) {
                     if(datas==null){
                         bootbox.alert("还没有创建角色，请先创建角色");
                     }else{

                         var select = $("#roleid1");
                         for(var i=0;i<datas.length;i++){
                             if(datas[i].rname==rolename){
                                 select.append("<option value='" + datas[i].rid + "' selected>" +  datas[i].rname + "</option>")
							 }else{
                                 select.append("<option value='" + datas[i].rid + "'>" +  datas[i].rname + "</option>")
							 }


                         }


                     }
                 }
             })


    				//把页面上去到的值放入到弹出框中
    				$("#xiugai input[name=uid]").val(uid)
    				$("#xiugai input[name=username]").val(username)
    				$("#xiugai input[name=password]").val(password)
    				$("#xiugai input[name=email]").val(email)
    				$("#xiugai input[name=phone]").val(phone)

    				$("#baocun").off().click(function(){
                        $('#form1').data('bootstrapValidator').validate();
                        if ($("#form1").data('bootstrapValidator').isValid()) {
                            $.ajax({
                                type: 'post',
                                url: '../system/systemUser',
                                data: $('#form1').serialize(),
                                context: document.body,
                                success: function (data) {

                                    $("#xiugai").modal('hide');
                                    console.log($(this))
                                    this1.children(":eq(1)").text(data.username)
                                    this1.children(":eq(2)").text(data.password)
                                    this1.children(":eq(3)").text(data.email)
                                    this1.children(":eq(4)").text(data.phone)
                                    this1.children(":eq(6)").text(data.rname)
									//把修改后的值放入到datatable中
                                    $('#demo-dt-basic').DataTable().row(rowIndex).data().username = data.username;
                                    $('#demo-dt-basic').DataTable().row(rowIndex).data().password = data.password;
                                    $('#demo-dt-basic').DataTable().row(rowIndex).data().email = data.email;
                                    $('#demo-dt-basic').DataTable().row(rowIndex).data().phone = data.phone;
                                    $('#demo-dt-basic').DataTable().row(rowIndex).data().rname = data.rname;
                                    this1.animate({backgroundColor: '#25476a !important', opacity: '0.5'}, 200);

                                    this1.animate({backgroundColor: '#25476a !important', opacity: '1'}, 200);

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
   	$('#demo-dt-basic tbody').on('click','.shanchu', function() {
   			
   		 	var thisis = $(this).parent().parent();
             thisis.siblings().removeClass('tog')
             thisis.toggleClass('tog')
             thisis.children().children("a").css("color","inherit")
             //获取点击的行号
             var rowIndex = $('#demo-dt-basic').DataTable().row(thisis).index();
             //通过dataTable获取隐藏的值
             var uid=$('#demo-dt-basic').DataTable().row(rowIndex).data().uid;
   			 
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
   	   						console.log(data)
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
   		
   	//新增判断
   	$("#add1").click(function(){

            $("#roleid").empty();
            //查询角色列表下面的角色信息
            $.ajax({
                type: 'post',
                url: '../system/sysroleinfo',
                success: function (datas) {
                    if(datas==null){
                        bootbox.alert("还没有创建角色，请先创建角色");
                    }else{
                        var select = $("#roleid");
                        for(var i=0;i<datas.length;i++){

                            select.append("<option value='" + datas[i].rid + "'>" +  datas[i].rname + "</option>")
                        }


                    }
                }
            })

            $('#xinzeng').modal()
   		})

    //新增数据
    $("#add").click(function(){

        $('#form2').data('bootstrapValidator').validate();
        if ($("#form2").data('bootstrapValidator').isValid()) {
            $.ajax({
                type: 'post',
                url: '../system/addOrgUser',
                data: $('#form2').serialize(),
                success: function (data) {

                    $("#xinzeng").modal('hide');
                    //重绘表格
                    datats.draw();
                    $.niftyNoty({
                        type: 'success',
                        icon: 'pli-like-2 icon-2x',
                        message: '添加用户成功',
                        container: 'floating',
                        timer: 3000
                    });
                }
            })
        }
    })

    //批量删除
    $("#batchdelete").click(function(){
            if(checkedIds==""||checkedIds.length==0){
                bootbox.alert("没有选中数据，请选择要删除的数据");
            }else{
                $.ajax({
                    type:'post',
                    url:'../system/deleteBatchOrgUser',
                    data:{'idList':checkedIds},
                    success:function(data){
                        //重绘表格
                        datats.draw();
                        $.niftyNoty({
                            type: 'success',
                            icon : 'pli-like-2 icon-2x',
                            message : '批量删除成功',
                            container : 'floating',
                            timer : 3000
                        });

                    }

                })
            }
        })

    })

</script>

    
</body>
</html>

