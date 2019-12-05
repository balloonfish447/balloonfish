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
    <title>动态信息发布页面</title>


    <!--Bootstrap Stylesheet [ REQUIRED ]-->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!--Nifty Stylesheet [ REQUIRED ]-->
    <link href="css/nifty.min.css" rel="stylesheet">

    <link href="css/nifty/nifty-demo.min.css" rel="stylesheet">
    <!--ico小图标-->
    <link href="css/demo/nifty-demo-icons.min.css" rel="stylesheet">
    <%--加载主题--%>
    <link id="theme" href="css/themes/type-d/theme-navy.min.css" rel="stylesheet">
    <!--加载进度线插件-->
    <link href="plugins/pace/pace.min.css" rel="stylesheet">
    <script src="plugins/pace/pace.min.js"></script>

    <link href="plugins/summernote/summernote.min.css" rel="stylesheet">
    <link href="plugins/bootstrap-validator/bootstrapValidator.min.css" rel="stylesheet">
        
</head>
<body>
    <%--其中navbar-fixed代表头部导航固定，mainnav-fixed 代表左侧导航固定--%>
    <div id="container" class="effect aside-float aside-bright mainnav-lg navbar-fixed mainnav-fixed ">
        
        <%--头部导航--%>
        <jsp:include page="comment/header.jsp"></jsp:include>


        <div class="boxed">
            <div id="content-container">
                <div id="page-head">
                    <div class="text-center">
                        <h3>欢迎使用文章发布系统</h3>
                        <p>请在下面输入文章标题和文章内容 </p>
                    </div>

                </div>
                <!--Page content-->
                <!--===================================================-->
                <div id="page-content">
                    <div class="fixed-fluid">

                        <div class="fluid">
                            <form action="../freemarker/createBlog" method="post" id="from1">
                                <input type="hidden" name="textarea1"id="textarea1">
                                <input type="hidden" name="textarea2"id="textarea2">
                                <div class="form-group">
                                <input type="text" placeholder="请输入文章标题" class="form-control input-lg" autofocus name="title">
                            </div>
                            <div class="panel">
                                <div class="panel-body texteero">
                                    <div id="demo-summernote"><h2><span >请再此处，填写文章内容</span><br></h2>

                                    </div>
                                </div>

                            </div>
                            <div class="form-group">
                                <input class="btn btn-primary btn-lg" type="submit" id="fbwz" value="发表文章">
                            </div>
                            </form>
                        </div>
                    </div>

                </div>
                <!--===================================================-->
                <!--End page content-->

            </div>
            <!--===================================================-->
            <!--END CONTENT CONTAINER-->
            <%--左侧导航--%>
            <jsp:include page="comment/nav_left.jsp"></jsp:include>
            <%--右侧导航--%>
            <jsp:include page="comment/nav_right.jsp"></jsp:include>
        </div>



        <!-- FOOTER -->
        <jsp:include page="comment/footer.jsp"></jsp:include>

        <!-- 右下角按钮 -->
            <button class="scroll-top btn">
                <i class="pci-chevron chevron-up"></i>
            </button>

    </div>



    <!--jQuery [ REQUIRED ]-->
    <script src="js/jquery.min.js"></script>
    <!--BootstrapJS [ RECOMMENDED ]-->
    <script src="js/bootstrap.min.js"></script>
    <!--NiftyJS [ RECOMMENDED ]-->
    <script src="js/nifty.min.js"></script>

    <!--富文本编辑器 [ OPTIONAL ]-->
    <script src="plugins/summernote/summernote.min.js"></script>
    <script src="plugins/summernote/lang/summernote-zh-CN.js"></script>
    <%--表单验证插件--%>
    <script src="plugins/bootstrap-validator/bootstrapValidator.min.js"></script>
    <script>
        $(function () {
            $('#demo-summernote').summernote({
                height : '500px',
                lang: 'zh-CN',
                dialogsInBody: true,
                //调用图片上传
                callbacks: {
                    onImageUpload: function (files,editor, $editable) {
                        console.log(files)
                        sendFile( files[0]);
                    }
                }
            });


        });




        //ajax上传图片
        function sendFile( file,editor, $editable) {

            var formData = new FormData();
            formData.append("file", file);
            $.ajax({
                url: "../upload/uploadImages",//路径是你控制器中上传图片的方法，下面controller里面我会写到
                data: formData,
                processData: false,
                contentType: false,
                type: 'POST',
                dataType:'json',
                success: function (data) {

                    $('#demo-summernote').summernote('insertImage', data.path,"hhhh");
                }
            });
        }
    </script>

    <script>
        var faIcon = {
            valid: 'fa fa-check-circle fa-lg text-success',
            invalid: 'fa fa-times-circle fa-lg',
            validating: 'fa fa-refresh'
        }
        $('#from1').bootstrapValidator({
            live: 'submitted',
            excluded: [':disabled'],
            feedbackIcons: faIcon,
            fields: {
                title: {
                    validators: {
                        notEmpty: {
                            message: '文章标题不能为空'
                        }

                    }
                },
                textarea1: {
                    /*错误信息提示位置*/
                    container:'.texteero',
                    validators: {
                        notEmpty: {
                            message: '文章内容不能为空'
                        },
                        stringLength: {
                            min: 150,
                            message: '文章最少不能少于150个字奥'
                        }


                    }
                }
            }

        });
        $("#from1").click(function () {
            var markupStr = $('#demo-summernote').summernote('code');
            var textarea2=$($("#demo-summernote").summernote("code")).text();
            $("#textarea1").val(markupStr);
            $("#textarea2").val(textarea2);
            //$("#from1").data("bootstrapValidator").validate();
            $("#form1").bootstrapValidator('validate');
        })
    </script>
</body>
</html>
