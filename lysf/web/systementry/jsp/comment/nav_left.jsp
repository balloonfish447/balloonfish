<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!--MAIN NAVIGATION-->
<!--===================================================-->
<nav id="mainnav-container">
    <div id="mainnav">

        <!--Menu-->
        <!--================================-->
        <div id="mainnav-menu-wrap">
            <div class="nano">
                <div class="nano-content">

                    <!--用户信息设定-->
                    <!--================================-->
                    <div id="mainnav-profile" class="mainnav-profile">
                        <div class="profile-wrap text-center">
                            <div class="pad-btm">
                                <img class="img-circle img-md" src="img/profile-photos/33.png" alt="Profile Picture">
                            </div>
                            <a href="#profile-nav" class="box-block" data-toggle="collapse" aria-expanded="false">
                                            <span class="pull-right dropdown-toggle">
                                                <i class="dropdown-caret"></i>
                                            </span>
                                <p class="mnp-name">${sessionScope.USERINFO.username}</p>
                                <span class="mnp-desc">${sessionScope.USERINFO.email}</span>
                            </a>
                        </div>
                        <div id="profile-nav" class="collapse list-group bg-trans">

                            <a href="jsp/userset.jsp" class="list-group-item">
                                <i class="demo-pli-gear icon-lg icon-fw"></i> 个人中心
                            </a>

                            <a href="jsp/login.jsp" class="list-group-item">
                                <i class="demo-pli-unlock icon-lg icon-fw"></i> 退出
                            </a>
                        </div>
                    </div>

                    <ul id="mainnav-menu" class="list-group">

                        <li class="active-sub active" id="shouye">
                            <a href="jsp/index.jsp" >
                                <i class="demo-pli-home"></i>
                                <span class="menu-title">首页</span>
                            </a>
                        </li>

                        <li  id="discuss">
                            <a href="jsp/ourdiscuss.jsp" >
                                <i></i>
                                <span class="menu-title">评论留言</span>
                            </a>
                        </li>
                        <li class="list-divider"></li>

                    </ul>

                </div>
            </div>
        </div>
        <!--================================-->
        <!--End menu-->

    </div>
</nav>
<!--jQuery [ REQUIRED ]-->
<script src="js/jquery.min.js"></script>
    <script>

        $(function () {
            var powerdata=${sessionScope.USERPOWER}
            sessionStorage.setItem("USERPOWER",JSON.stringify(powerdata));
            var data=JSON.parse(sessionStorage.getItem("USERPOWER"));

            //定义一个一级菜单的数组，看看有多少个一级菜单
            var yiji=[];
            var j=0;

            //通过循环遍历一级菜单
            for(var i=0;i<data.length;i++){
                if(data[i].rejigouid==0){
                    yiji[j]=data[i].reid;
                    j++;
                    $("#mainnav-menu").append(
                        '<li id="' + data[i].reid + '">'+
                            '<a href="' + data[i].relink + '" >'+
                                '<i class="' +data[i].rebianhao+ '"></i>'+
                                '<span class="menu-title">' + data[i].resourcename + '</span>'+
                                '<i class="arrow"></i>'+
                            '</a>'+
                        '</li>'+
                        '<li class="list-divider"></li>'
                    )
                }
            }

            //通过循环遍历二级菜单
            for(var k=0;k<yiji.length;k++){
                $("#" + yiji[k]+ "").append(
                    '<ul class="collapse in" id=""></ul>'
                )
                for(var i=0;i<data.length;i++){
                    if(data[i].rejigouid==1&&data[i].reopjigouid==yiji[k]){
                        $("#" + yiji[k]+ " ul ").append(
                            '<li><a href="' + data[i].relink + '">' + data[i].resourcename+ '</a></li>'
                        )
                    }
                }
            }

            //点击事件获取鼠标焦点
            $("#mainnav-menu a").each(function () {
                var ahref=$(this).attr("href").substring($(this).attr("href").lastIndexOf("/"));


                if(ahref.indexOf("index.jsp")!=-1){
                    $("#shouye").attr("class","active-sub active");
                    return
                }
                var lhref1=window.location.href;
                var lhref=lhref1.substring(lhref1.lastIndexOf("/"))

                if(lhref==ahref){
                    $(this).parent().attr("class","active-link");
                    $(this).parent().parent().parent().attr("class","active-sub active");
                    $("#shouye").removeAttr("class");
                    return;
                }
            })
        })

           /* $.ajax({
                type: 'post',
                url: '../userpower',
                traditional:true,
                success: function (data) {
                    console.log(data);
                    if(data!=null){
                        for(var i=0;i<data.length;i++){

                            if(data[i].rejigouid==0){
                                $("#mainnav-menu a span").each(function () {
                                    if($(this).text()==data[i].resourcename){
                                        $(this).parent().parent().removeAttr("hidden")
                                    }

                                });
                            }else{
                                $("#mainnav-menu li ul li a").each(function () {
                                    if($(this).text()==data[i].resourcename){
                                        $(this).parent().removeAttr("hidden")
                                    }
                                    if(location.href.indexOf($(this).attr("href").substring(2))!=-1){

                                        $(this).parent().attr("class","active-link");
                                        $(this).parent().parent().parent().attr("class","active-sub active");
                                        $("#shouye").attr("class","")

                                    }
                                })
                            }


                        }

                    }
                },

            })*/

    </script>
</body>
</html>
