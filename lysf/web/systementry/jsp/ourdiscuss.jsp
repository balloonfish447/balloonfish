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

    <title>评论留言</title>


    <!--Bootstrap Stylesheet [ REQUIRED ]-->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!--Nifty Stylesheet [ REQUIRED ]-->
    <link href="css/nifty.min.css" rel="stylesheet">
    <!--Nifty Premium Icon [ DEMONSTRATION ]-->
    <link href="css/demo/nifty-demo-icons.min.css" rel="stylesheet">
    <link href="css/demo/iconfont.css" rel="stylesheet">
    <!--加载进度线插件-->
    <link href="plugins/pace/pace.min.css" rel="stylesheet">
    <script src="plugins/pace/pace.min.js"></script>
    <!--Demo [ DEMONSTRATION ]-->
    <link href="css/demo/nifty-demo.min.css" rel="stylesheet">
    <link id="theme" href="css/themes/type-c/theme-navy.min.css" rel="stylesheet">
</head>
<body>
<div id="container" class="effect aside-float aside-bright mainnav-lg navbar-fixed mainnav-fixed ">

    <jsp:include page="comment/header.jsp"></jsp:include>

    <div class="boxed">

        <!--CONTENT CONTAINER-->
        <!--===================================================-->
        <div id="content-container">
            <div id="page-head">

                <div class="pad-all text-center">
                    <h3>评论板块</h3>
                    <p>大家畅所欲言，留下你的评论吧！</p>
                </div>
            </div>


            <!--Page content-->
            <!--===================================================-->
            <div id="page-content">

                <div class="row">

                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-sm-12 col-lg-12">

                                <!--Sparkline Area Chart-->
                                <div class="panel panel-success panel-colorful">
                                    <div class="pad-all" id="liuyanban">

                                    </div>


                                </div>
                            </div>

                        </div>


                        <!--Extra Small Weather Widget-->
                        <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                        <div class="panel">
                            <div class="panel-body text-center clearfix">
                                <div class="col-sm-4 pad-top">
                                    <div id="bingtu" style="height: 5px;width: 900px"></div>
                                    <%-- <div class="text-lg">
                                         <p class="text-5x text-thin text-main">2019</p>
                                     </div>
                                     <p class="text-sm text-bold text-uppercase">开始使用</p>--%>
                                      <button id="pinglun">评论</button>
                                    <button id="sixin">私信</button>
                                </div>
                                <div class="col-sm-8">



                                </div>
                            </div>
                        </div>

                        <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                        <!--End Extra Small Weather Widget-->


                    </div>
                </div>





            </div>
            <!--===================================================-->
            <!--End page content-->

        </div>
        <!--===================================================-->
        <!--END CONTENT CONTAINER-->
        <div class="modal" id="addsixin" role="dialog" tabindex="-1"
             aria-labelledby="demo-default-modal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!--Modal header-->
                    <div class="modal-header" style="border-bottom: 1px solid #e5e5e5;">
                        <button type="button" class="close" data-dismiss="modal">
                            <i class="pci-cross pci-circle"></i>
                        </button>
                        <h4 class="modal-title">私信管理员</h4>
                    </div>


                    <!--Modal body-->
                    <form class="form-horizontal"  id="form1"  method="post">

                        <div class="modal-body">

                            <div class="form-group">
                                <label class="col-sm-3 control-label"><span style="color: red">*</span>私信：</label>
                                <div class="col-sm-6">
                                    <input type="text" placeholder="请输入内容" class="form-control"
                                           id="demo-is-inputnormal3" name="phone" flag="xinzeng">
                                </div>
                            </div>


                        </div>
                        <div class="modal-footer">

                            <div class="row">
                                <div class="col-sm-9 col-sm-offset-3">
                                    <button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
                                    <button class="btn btn-primary" id="addsi" type="button" value="添加">发送</button>
                                </div>
                            </div>

                        </div>
                    </form>
                    <!--===================================================-->
                    <!--End Input Size-->

                </div>
            </div>
        </div>

        <div class="modal" id="addpinglun" role="dialog" tabindex="-1"
             aria-labelledby="demo-default-modal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!--Modal header-->
                    <div class="modal-header" style="border-bottom: 1px solid #e5e5e5;">
                        <button type="button" class="close" data-dismiss="modal">
                            <i class="pci-cross pci-circle"></i>
                        </button>
                        <h4 class="modal-title">发表评论吧</h4>
                    </div>


                    <!--Modal body-->
                    <form class="form-horizontal"  id="form2"  method="post">

                        <div class="modal-body">

                            <div class="form-group">
                                <label class="col-sm-3 control-label"><span style="color: red">*</span>评论：</label>
                                <div class="col-sm-6">
                                    <input type="text" placeholder="请输入评论" class="form-control"
                                           id="demo-is-inputnormal4" name="phone" flag="xinzeng">
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

        <jsp:include page="comment/nav_left.jsp"></jsp:include>




    </div>
    <jsp:include page="comment/footer.jsp"></jsp:include>

</div>
<!--===================================================-->
<!-- END OF CONTAINER -->


<!--JAVASCRIPT-->
<!--=================================================-->

<!--jQuery [ REQUIRED ]-->
<script src="js/jquery.min.js"></script>
<script src="js/echarts.js"></script>

<!--BootstrapJS [ RECOMMENDED ]-->
<script src="js/bootstrap.min.js"></script>


<!--NiftyJS [ RECOMMENDED ]-->
<script src="js/nifty.min.js"></script>


<!--=================================================-->

<!--布局修改js-->
<!-- <script src="js/demo/nifty-demo.min.js"></script>-->

<script>

    $(function () {
    $.ajax(
    {
        url:"../system/getdiscuss",//url地址
        dataType:"json",//返回的数据类型
        type:"post",//发起请求的方式
        success:function(data) {
            for(var i=0;i<data.length;i++) {
                $("#liuyanban").append(
                    '<p class="text-lg text-semibold"><i class="demo-pli-data-storage icon-fw"></i>'+data[i].text+'</p>'
                )
            }
        }
    }
       );
        $("#pinglun").click(function(){
            $("#addpinglun").modal();
        });
        $("#sixin").click(function(){
            $("#addsixin").modal();
        });
         //新增评论
        $("#add").click(function(){

            var text=$("#demo-is-inputnormal4").val();
                $.ajax({
                    type: 'post',
                    url: '../system/addpinglun',
                    data: "text="+text,
                    success: function (data) {

                        $("#addpinglun").modal('hide');
                        $("#demo-is-inputnormal4").val("");
                        window.location.reload(true);
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
        //新增私信
        $("#addsi").click(function(){

            var text=$("#demo-is-inputnormal3").val();
            $.ajax({
                type: 'post',
                url: '../system/addsixin',
                data: "text="+text,
                success: function (data) {

                    $("#addsixin").modal('hide');
                    $("#demo-is-inputnormal3").val("");
                    $.niftyNoty({
                        type: 'success',
                        icon: 'pli-like-2 icon-2x',
                        message: '发送成功',
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
