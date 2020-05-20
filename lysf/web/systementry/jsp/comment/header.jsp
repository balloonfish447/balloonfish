<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="icon" type="image/png" href="/tgyj/systementry/img/favicon.png">
<%--    <!--Bootstrap Stylesheet [ REQUIRED ]-->--%>
<%--    <link href="css/bootstrap.min.css" rel="stylesheet">--%>
</head>
<body>

<%--<!--jQuery [ REQUIRED ]-->--%>
<script src="/tgyj/systementry/js/jquery.min.js"></script>
<%--<!--BootstrapJS [ RECOMMENDED ]-->--%>
<script src="/tgyj/systementry/js/bootstrap.min.js"></script>
<!--NAVBAR-->
<!--===================================================-->
<header id="navbar">
    <div id="navbar-container" class="boxed">

        <!--Brand logo & name-->
        <!--================================-->
        <div class="navbar-header">
            <a href="jsp/index.jsp" class="navbar-brand">
                <img src="img/untitled.png" alt="Nifty Logo" class="brand-icon">
                <div class="brand-title">
                    <span class="brand-text">校园社团</span>
                </div>
            </a>
        </div>
        <!--================================-->
        <!--End brand logo & name-->


        <!--Navbar Dropdown-->
        <!--================================-->
        <div class="navbar-content">
            <ul class="nav navbar-top-links">

                <!--Navigation toogle button-->
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <li class="tgl-menu-btn">
                    <a class="mainnav-toggle" href="#">
                        <i class="demo-pli-list-view"></i>
                        <span>  隐藏显示</span>
                    </a>

                </li>
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <!--End Navigation toogle button-->



                <!--Search-->
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <li>
                    <div class="custom-search-form">
                        <label class="btn btn-trans" for="search-input" data-toggle="collapse" data-target="#nav-searchbox">
                            <i class="demo-pli-magnifi-glass"></i>
                        </label>
                        <%--<form>
                            <div class="search-container collapse" id="nav-searchbox">
                                <input id="search-input" type="text" class="form-control" placeholder="Type for search...">
                            </div>
                        </form>--%>

                    </div>
                </li>
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <!--End Search-->

            </ul>
            <ul class="nav navbar-top-links">

                <!--User dropdown-->
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <li id="dropdown-user" class="dropdown">
                    <a href="#" data-toggle="dropdown" class="dropdown-toggle text-right">
                                <span class="ic-user pull-right">
                                      <button type="button" id="gonggao" class="btn btn-success" title="公告"
                                              data-container="body" data-toggle="popover" data-placement="bottom"
                                              data-content="">
		                                       公告
	                                   </button>
                                      欢迎：${sessionScope.USERINFO.username}
                                    <img class="img-circle img-sm" src="img/profile-photos/33.png" >
                                </span>

                    </a>



                </li>
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <!--End user dropdown-->


            </ul>
        </div>
        <!--================================-->
        <!--End Navbar Dropdown-->

    </div>
</header>
<!--===================================================-->
<!--END NAVBAR-->

<script>
    $(function () {

        $.ajax(
            {
                url:"../system/getgonggao",//url地址
                dataType:"json",//返回的数据类型
                type:"post",//发起请求的方式
                success:function(data) {
                    $('#gonggao').attr('data-content',data.text+'--'+data.time);
                }
            }
        );

        // $("#gonggao").append(
        //     "1111111111111111111111111"
        //     //'<p class="text-lg text-semibold"><i class="demo-pli-data-storage icon-fw"></i>'+data[i].text+'</p>'
        // )

        $("[data-toggle='popover']").popover();


    })
</script>
</body>
</html>
