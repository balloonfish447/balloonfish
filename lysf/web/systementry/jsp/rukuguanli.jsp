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

<title>已加入社团管理</title>

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
<link id="theme" href="css/themes/type-c/theme-navy.min.css" rel="stylesheet">
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
						<h1 class="page-header text-overflow">社团管理管理</h1>
					</div>
					<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
					<!--End page title-->
					<ol class="breadcrumb">
						<li><i class="demo-pli-home"></i></li>
						<li>我的社团</li>
						<li class="active">已加入的</li>
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
										<%--<button class="btn btn-primary"  id="add1">新增</button>
										<button class="btn btn-danger" id="batchdelete">导出excel</button>

										<button class="btn btn-danger" id="batchupdateyinjia">修改全部银价</button>--%>

									</div>
									<div class="row">
									<div class="alert alert-mint" style="text-align: center;display: none" id="quanxuantishi">
					                    
					                    <strong>已选择本页的<span id="pagesize"></span>条数据,  <a href="#" class="alert-link" style="font-weight: 400" id="quanbuxuanze">勾选全部的 <span id="totalsize"></span> 数据</a></strong>
					                </div>
										<table id="chanpinruku"
											class="table table-striped table-bordered  table-hover" style="width: 100%">
											<thead>
												<tr>	
													<%--<th><input type="checkbox" name="allusers" id="checkAll" ></th>--%>
													<th>社团ID</th>
													<th>社团名称</th>
													<th>社长ID</th>

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



	


	<!-- 构建datatable -->
	<script> 
   	$(function (){
    	//构建新table时提示不显示
    	$("#quanxuantishi").hide();
    	
    	$('#chanpinruku').dataTable({
        	//destroy:true,    /*允许重新构建datatable  */
        	//processing: true,//功能控制处理指标
        	serverSide: true,//启动服务器模式，会向后台传递值
        	//paging : true,//是否分页
            searching: false,
            // lengthMenu: [ 10, 25, 50, 75, 100 ],//指定显示数据长度
            // "autoWidth": true,
        	 // "scrollX": true,
            // ordering:true,//启动排序
            // order: [[ 10, "desc" ]],
        	/* "scrollCollapse": true,  */ //表格高度随内容自适应
        	//获取数据源 
        	ajax:{
        		
        		url:"../chanpinguanli/getrukuinfos",	//请求地址
                dataSrc: "data",	//默认为data,这里定义为空，则只需要传不带属性的数据              
        	}, 

            columns: [

                { data: 'tid',

                    orderable: false,//制定是否排序

                },

                { data: 'tname',
                	
                	 orderable: false,//制定是否排序
                },
                { data: 'uid' ,
                	
                	 orderable: false,//制定是否排序
                },


                { data: null,
                  orderable: false,//制定是否排序
                  //也可以这样添加自己想要的列data-target="#xiugai" data-toggle="modal"
                  defaultContent: '<a href="javascript::##"  title="删除"  class="shanchu"> <i class="iconfont icon-shanchu"></i></a>'

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
           				 var shuliang=$('#chanpinruku').DataTable().row(rowIndex).data().shuliang;

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
            			$("#xiugai input[name=shuliang]").val(shuliang)

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
                                        /*this1.children(":eq(1)").children().attr("src",data.logopath)
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
                                        this1.children(":eq(12)").text(data.shuliang)
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
                                        $('#chanpinruku').DataTable().row(rowIndex).data().shuliang=data.shuliang;*/
                                        this1.animate({backgroundColor: '#294f75 !important', opacity: '0.5'}, 1000);

                                        this1.animate({backgroundColor: '#294f75 !important', opacity: '1'}, 1000);
                                        datats.draw();


										$.niftyNoty({
											type: 'success',
											icon: 'pli-like-2 icon-2x',
											message: '修改成功',
											container: 'floating',
											timer: 2000
										});

                                        this1=""
									}
								})
							}
						})



				});

		//删除，注意datatable返回的数据和字段都是动态元素，只能通过jquery的on方法进行绑定
		$('#chanpinruku tbody').on('click','.shanchu', function() {

				var thisis = $(this).parent().parent();
				 // thisis.siblings().removeClass('tog')
				 // thisis.toggleClass('tog')
				 // thisis.children().children("a").css("color","inherit")
				 //获取点击的行号
				 var rowIndex = $('#chanpinruku').DataTable().row(thisis).index();
				 //通过dataTable获取隐藏的值
				 var tid=$('#chanpinruku').DataTable().row(rowIndex).data().tid;

				  bootbox.confirm({
					  animateIn:'',
					  animateOut: '',
					  message:"确认要退出该社团吗？",
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
							url:'../chanpinguanli/deleteTeamXinXi',
							datatype:'boolean',
							data:'tid='+tid,
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




		//新增判断
		$("#add1").click(function(){

			$('#xinzeng').modal();

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

