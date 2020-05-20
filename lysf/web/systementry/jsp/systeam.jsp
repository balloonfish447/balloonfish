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
                    <li class="active">社团管理</li>
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
                                    <button class="btn btn-primary"  id="addteam">新增</button>
                                    <button class="btn btn-primary"  id="doexcel">导出</button>
                                </div>
                                <div class="row">
                                    <div class="alert alert-mint" style="text-align: center;display: none" id="quanxuantishi">

                                        <strong>已选择本页的<span id="pagesize"></span>条数据,  <a href="#" class="alert-link" style="font-weight: 400" id="quanbuxuanze">勾选全部的 <span id="totalsize"></span> 数据</a></strong>
                                    </div>
                                    <table id="chanpinruku"
                                           class="table table-striped table-bordered  table-hover" style="width: 100%">
                                        <thead>
                                        <tr>
                                            <th>社团ID</th>
                                            <th>社团名称</th>
                                            <th>社长ID</th>
                                            <th>社长姓名</th>
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
                <h4 class="modal-title">社团数据修改界面</h4>
            </div>


            <!--Modal body-->
            <form class="form-horizontal"  id="form1" method="post">

                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-3 control-label"><span style="color: red">*</span>社团ID：</label>
                        <div class="col-sm-6">
                            <input type="text" placeholder="请输入社团ID" class="form-control"
                                   name="tid" flag="xiugai">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label"><span style="color: red">*</span>社团名：</label>
                        <div class="col-sm-6">
                            <input type="text" placeholder="请输入社团名" class="form-control"
                                   name="tname">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label"><span style="color: red">*</span>社长ID：</label>
                        <div class="col-sm-6">
                            <input type="text" placeholder="请输入社长ID" class="form-control"
                                   name="uid" flag="xiugai">
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
<%--新增弹出框--%>
<div class="modal" id="xinzengteam" role="dialog" tabindex="-1"
     aria-labelledby="demo-default-modal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <!--Modal header-->
            <div class="modal-header" style="border-bottom: 1px solid #e5e5e5;">
                <button type="button" class="close" data-dismiss="modal">
                    <i class="pci-cross pci-circle"></i>
                </button>
                <h4 class="modal-title">社团新增界面</h4>
            </div>


            <!--Modal body-->
            <form class="form-horizontal"  id="form2" method="post">

                <div class="modal-body">

                    <div class="form-group">
                        <label class="col-sm-3 control-label"><span style="color: red">*</span>社团名：</label>
                        <div class="col-sm-6">
                            <input type="text" placeholder="请输入社团名" class="form-control"
                                   name="tname">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label"><span style="color: red">*</span>社长ID：</label>
                        <div class="col-sm-6">
                            <input type="text" placeholder="请输入社长ID" class="form-control"
                                   name="uid" flag="xiugai">
                        </div>
                    </div>



                </div>
                <div class="modal-footer">

                    <div class="row">
                        <div class="col-sm-9 col-sm-offset-3">
                            <button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
                            <input class="btn btn-primary" id="addt" type="button" value="保存">
                        </div>
                    </div>

                </div>
            </form>
            <!--===================================================-->
            <!--End Input Size-->

        </div>
    </div>
</div>
<!-- 社团详情弹出框内容 -->
<div class="modal" id="teamxiangqing" role="dialog" tabindex="-1"
     aria-labelledby="demo-default-modal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <!--Modal header-->
            <div class="modal-header" style="border-bottom: 1px solid #e5e5e5;">
                <button type="button" class="close" data-dismiss="modal">
                    <i class="pci-cross pci-circle"></i>
                </button>
                <h4 class="modal-title">社团详情界面</h4>
            </div>

            <div id="teamthead"></div>


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

                url:"../chanpinguanli/getadminallteams",	//请求地址
                dataSrc: "",	//默认为data,这里定义为空，则只需要传不带属性的数据
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
                { data: 'username' ,

                    orderable: false,//制定是否排序
                },

                { data: null,
                    orderable: false,//制定是否排序
                    //也可以这样添加自己想要的列data-target="#xiugai" data-toggle="modal"
                    defaultContent: '<a href="javascript::##" data-target="#xiugai" data-toggle="modal"title="修改" class="xiugai"> <i class="iconfont icon-tianxie"></i></a>'+
                    '<a href="javascript::##"  title="删除"  class="shanchu"> <i class="iconfont icon-shanchu"></i></a>'
                    +'<a href="javascript::##"  title="查看详情" class="chakanx"> <i class="iconfont icon-sousuo"></i></a>'
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
        $("#doexcel").click(function(){
                window.location.href='../chanpinguanli/excelteamsc'


        })

        //管理员删除社团
        $('#chanpinruku tbody').on("click",".shanchu",function () {
            var this1 = $(this).parent().parent();
            this1.siblings().removeClass('tog')
            this1.toggleClass('tog')
            this1.children().children("a").css("color", "inherit")
            //$(this).children().first().children().prop("checked",true)
            //获取点击的行号
            var rowIndex = $('#chanpinruku').DataTable().row(this1).index();
            //通过dataTable获取隐藏的值
            tid = $('#chanpinruku').DataTable().row(rowIndex).data().tid;
            bootbox.confirm({
                animateIn:'',
                animateOut: '',
                message:"确认要删除该社团吗？",
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
                            url:'../chanpinguanli/deleteteam',
                            datatype:'boolean',
                            data:"tid="+tid,
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
       //修改社团信息
        $('#chanpinruku tbody').on("click",".xiugai",function () {

            var this1=$(this).parent().parent();

            this1.siblings().removeClass('tog')
            this1.toggleClass('tog')
            this1.children().children("a").css("color","inherit")
            //$(this).children().first().children().prop("checked",true)
            //获取点击的行号
            var rowIndex =$('#chanpinruku').DataTable().row(this1).index();
            //通过dataTable获取隐藏的值

            /* var uid=$(this).children(":eq(0)").text();  */

            var teamname=$('#chanpinruku').DataTable().row(rowIndex).data().tname;
            var userid=$('#chanpinruku').DataTable().row(rowIndex).data().uid;
            var teamid=$('#chanpinruku').DataTable().row(rowIndex).data().tid;



            //把页面上去到的值放入到弹出框中
            $("#xiugai input[name=tid]").val(teamid)
            $("#xiugai input[name=tname]").val(teamname)
            $("#xiugai input[name=uid]").val(userid)


            $("#baocun").off().click(function(){
    //            $('#form1').data('bootstrapValidator').validate();
  //              if ($("#form1").data('bootstrapValidator').isValid()) {

                    $.ajax({
                        type: 'post',
                        url: '../system/updateteam',
                        data: $('#form1').serialize(),
                        context: document.body,
                        success: function (data) {
                            if (data == true) {
                                $("#xiugai").modal('hide');
                                window.location.reload(true);
                                $.niftyNoty({
                                    type: 'success',
                                    icon: 'pli-like-2 icon-2x',
                                    message: '修改成功',
                                    container: 'floating',
                                    timer: 2000
                                });

                            }
                        }
                    })
  //              }
            })
        })

        //社团详情
        $('#chanpinruku tbody').on('click','.chakanx', function(){
            $("#teamthead").empty();
            var this1 = $(this).parent().parent();
            this1.siblings().removeClass('tog')
            this1.toggleClass('tog')
            this1.children().children("a").css("color", "inherit")
            //$(this).children().first().children().prop("checked",true)
            //获取点击的行号
            var rowIndex = $('#chanpinruku').DataTable().row(this1).index();
            //通过dataTable获取隐藏的值
            var tid = $('#chanpinruku').DataTable().row(rowIndex).data().tid;
            $.ajax(
                {
                    url:"../system/getteaminfos",//url地址
                    dataType:"json",//返回的数据类型
                    data:'tid='+tid,
                    type:"post",//发起请求的方式
                    success:function(data) {
                        if(data==null&&data==""){
                            $("#teamthead").append(
                                '未录入相关信息'
                            )
                        }
                        else{
                            $("#teamthead").append(
                                '<div>详情编号：'+data.id+'</div>'+
                                '<div>社团编号：'+data.tid+'</div>'+
                                '<div>创建时间：'+data.founttime+'</div>'+
                                '<div>创始人ID：'+data.fountuserid+'</div>'+
                                '<div>社团人数：'+data.count+'</div>'+
                                '<div>活动地点：'+data.dress+'</div>'
                            )
                        }

                    }
                }
            );

            $('#teamxiangqing').modal()
        })

        $("#addteam").click(function () {
         $("#xinzengteam").modal();
        })

        $("#addt").off().click(function () {
            $.ajax({
                type: 'post',
                url: '../system/addteam',
                data: $('#form2').serialize(),
                context: document.body,
                success: function (data) {
                    if (data == true) {
                        $("#xinzengteam").modal('hide');
                        window.location.reload(true);
                        $.niftyNoty({
                            type: 'success',
                            icon: 'pli-like-2 icon-2x',
                            message: '新增成功',
                            container: 'floating',
                            timer: 2000
                        });

                    }
                }
            })
        })


    })

</script>



</body>
</html>

