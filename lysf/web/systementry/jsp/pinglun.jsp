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

    <title>社团管理</title>

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
                    <h1 class="page-header text-overflow">社团管理</h1>
                </div>
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <!--End page title-->
                <ol class="breadcrumb">
                    <li><i class="demo-pli-home"></i></li>
                    <li>系统管理</li>
                    <li class="active">评论管理</li>
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
                                    <button class="btn btn-primary"  id="notice">发布公告</button>
                                </div>
                                <div class="row">
                                    <div class="alert alert-mint" style="text-align: center;display: none" id="quanxuantishi">

                                        <strong>已选择本页的<span id="pagesize"></span>条数据,  <a href="#" class="alert-link" style="font-weight: 400" id="quanbuxuanze">勾选全部的 <span id="totalsize"></span> 数据</a></strong>
                                    </div>
                                    <table id="chanpinruku"
                                           class="table table-striped table-bordered  table-hover" style="width: 100%">
                                        <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>内容</th>
                                            <th>评论人ID</th>
                                            <th>评论人姓名</th>
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
    <div class="modal" id="addgonggao" role="dialog" tabindex="-1"
         aria-labelledby="demo-default-modal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">

                <!--Modal header-->
                <div class="modal-header" style="border-bottom: 1px solid #e5e5e5;">
                    <button type="button" class="close" data-dismiss="modal">
                        <i class="pci-cross pci-circle"></i>
                    </button>
                    <h4 class="modal-title">发布公告</h4>
                </div>


                <!--Modal body-->
                <form class="form-horizontal"  id="form2"  method="post">

                    <div class="modal-body">

                        <div class="form-group">
                            <label class="col-sm-3 control-label"><span style="color: red">*</span>公告：</label>
                            <div class="col-sm-6">
<%--                                <input type="text" placeholder="请输入评论" class="form-control"--%>
<%--                                       id="demo-is-inputnormal4" name="phone" flag="xinzeng">--%>
                                        <textarea class="form-control" rows="3" id="demo-is-inputnormal4"></textarea>
                            </div>
                        </div>


                    </div>
                    <div class="modal-footer">

                        <div class="row">
                            <div class="col-sm-9 col-sm-offset-3">
                                <button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
                                <button class="btn btn-primary" id="add" type="button" value="添加">发表</button>
                            </div>
                        </div>

                    </div>
                </form>
                <!--===================================================-->
                <!--End Input Size-->

            </div>
        </div>
    </div>

    <!-- SCROLL PAGE BUTTON -->
    <!--===================================================-->
    <button class="scroll-top btn">
        <i class="pci-chevron chevron-up"></i>
    </button>
    <!--===================================================-->


</div>

<!--===================================================-->
<










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

<!-- 构建datatable -->
<script>
    $(function (){
        //构建新table时提示不显示
        $("#quanxuantishi").hide();

        $('#chanpinruku').dataTable({
            // destroy:true,    /*允许重新构建datatable  */
            // processing: true,//功能控制处理指标
            serverSide: false,//启动服务器模式，会向后台传递值
            //paging : true,//是否分页
            searching: true,
            // lengthMenu: [ 10, 25, 50, 75, 100 ],//指定显示数据长度
            // "autoWidth": true,
            //  "scrollX": true,
            // ordering:true,//启动排序
            // order: [[ 10, "desc" ]],
            // /* "scrollCollapse": true,  */ //表格高度随内容自适应
            // //获取数据源
            ajax:{

                url:"../system/getpingluns",	//请求地址
                dataSrc: "",	//默认为data,这里定义为空，则只需要传不带属性的数据
            },

            columns: [
                { data: 'id',

                    orderable: false,//制定是否排序

                },

                { data: 'text',

                    orderable: false,//制定是否排序
                },
                { data: 'uid' ,

                    orderable: false,//制定是否排序
                },
                { data: 'username' ,

                    orderable: false,//制定是否排序
                },

                { data: null,
                    orderable: false,//制定是否排序
                    //也可以这样添加自己想要的列data-target="#xiugai" data-toggle="modal"
                    defaultContent: //'<a href="javascript::##" data-target="#xiugai" data-toggle="modal"title="修改" class="xiugai"> <i class="iconfont icon-tianxie"></i></a>'+
                    '<a href="javascript::##"  title="删除"  class="shanchu"> <i class="iconfont icon-shanchu"></i></a>'
                    // +'<a href="javascript::##"  title="查看详情" class="chakan"> <i class="iconfont icon-sousuo"></i></a>'
                    // + '<a href="javascript::##" title="加入" class="jiaru"> <i class="iconfont icon-fabu"></i></a>'
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
        var qjtid=null;



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

        //管理员删除评论
        $('#chanpinruku tbody').on("click",".shanchu",function () {
            var this1 = $(this).parent().parent();
            this1.siblings().removeClass('tog')
            this1.toggleClass('tog')
            this1.children().children("a").css("color", "inherit")
            //$(this).children().first().children().prop("checked",true)
            //获取点击的行号
            var rowIndex = $('#chanpinruku').DataTable().row(this1).index();
            //通过dataTable获取隐藏的值
            var id = $('#chanpinruku').DataTable().row(rowIndex).data().id;
            bootbox.confirm({
                animateIn:'',
                animateOut: '',
                message:"确认要删除该评论吗？",
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
                            url:'../chanpinguanli/deletediscuss',
                            datatype:'boolean',
                            data:"id="+id,
                            context: document.body,
                            success:function(data){

                                if(data==true){
                                    window.location.reload(true);

                                    $.niftyNoty({
                                        type: 'success',
                                        icon : 'pli-like-2 icon-2x',
                                        message : '删除成功',
                                        container : 'floating',
                                        timer : 2000
                                    });




                                }
                                if(data==false){



                                    $.niftyNoty({
                                        type: 'success',
                                        icon : 'pli-like-2 icon-2x',
                                        message : '删除失败',
                                        container : 'floating',
                                        timer : 2000
                                    });




                                }

                            }
                        })
                    }
                }
            });
        })


        $("#notice").click(function(){
            $("#addgonggao").modal();
        });

        $("#add").click(function(){

            var text=$("#demo-is-inputnormal4").val();
            $.ajax({
                type: 'post',
                url: '../system/addgonggao',
                data: "text="+text,
                success: function (data) {

                    $("#addgonggao").modal('hide');
                    $("#demo-is-inputnormal4").val("");
                    $.niftyNoty({
                        type: 'success',
                        icon: 'pli-like-2 icon-2x',
                        message: '发表成功',
                        container: 'floating',
                        timer: 3000
                    });
                }
            })

        })



    })

</script>



</body>
</html>

