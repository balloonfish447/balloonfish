<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <title>用户发布文章管理</title>

    <!--Bootstrap Stylesheet [ REQUIRED ]-->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!--Nifty Stylesheet [ REQUIRED ]-->
    <link href="css/nifty.min.css" rel="stylesheet">

    <!--Nifty Premium Icon [ DEMONSTRATION ]-->
    <link href="css/demo/nifty-demo-icons.min.css" rel="stylesheet">
    <%--样式风格--%>
    <link id="theme" href="css/themes/type-c/theme-navy.min.css"
          rel="stylesheet">

    <!--Pace - Page Load Progress Par [OPTIONAL]-->
    <link href="plugins/pace/pace.min.css" rel="stylesheet">
    <script src="plugins/pace/pace.min.js"></script>

    <!--Demo [ DEMONSTRATION ]-->
    <link href="css/demo/nifty-demo.min.css" rel="stylesheet">

        
</head>

<body>
    <div id="container" class="effect aside-float aside-bright mainnav-lg navbar-fixed mainnav-fixed">

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
                        <h1 class="page-header text-overflow">文章管理页面</h1>
                    </div>
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <!--End page title-->


                    <!--Breadcrumb-->
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <ol class="breadcrumb">
					<li><a href="#"><i class="demo-pli-home"></i></a></li>
					<li><a href="javascript::##">文章</a></li>
					<li class="active">文章列表</li>
                    </ol>
                    <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                    <!--End breadcrumb-->

                </div>

                
                <!--Page content-->
                <!--===================================================-->
                <div id="page-content">
                    
					     <!-- Search -->
					     <!--===================================================-->
					    <div class="row pad-btm">
					        <form action="../set/user_index" method="post" class="col-xs-12 col-sm-10 col-sm-offset-1 pad-hor">
					            <div class="input-group mar-btm">
					                 <input type="text" placeholder="请输入文章标题" class="form-control input-lg" name="title" id="title" value="${requestScope.title}">
					                 <span class="input-group-btn">
					                     <button class="btn btn-primary btn-lg" type="submit">搜索</button>
					                 </span>
					            </div>
					        </form>
					    </div>
					

					    <hr class="new-section-xs bord-no">
					
					    <div class="panel">
					
					        <!--Posts Table-->
					        <!--===================================================-->
					        <div class="panel-body">
					            <div class="table-responsive">
					                <table class="table table-striped table-vcenter">
					                    <thead>
					                        <tr>
					                            <th></th>
					                            <th>文章标题</th>
					                            <th>发布时间</th>
					                            <th>发布人</th>
					                            <th>文章链接</th>
					                            <th>文章内容</th>
					                            <th class="text-center">操作</th>
					                        </tr>
					                    </thead>
					                    <tbody>
										<c:forEach items="${hwzs}" var="hwzs1">
											<tr>
												<td></td>
												<td>
													${hwzs1.wenzhangTitle}
												</td>

												<td>${hwzs1.createTime}</td>
												<td>${hwzs1.wenzhangUser}</td>

												<td><a href="../${hwzs1.wenzhangLink}" class="btn-link">${hwzs1.wenzhangLink}</a></td>
												<td>
														${hwzs1.wenzhangZhaiyao}
												</td>
												<td class="min-width">
													<div class="btn-groups">
														 <a wenzhangId="${hwzs1.tieId}" href="javascript::#"  class="btn btn-icon demo-pli-trash icon-lg add-tooltip deleteUserBlog" data-original-title="删除" data-container="body"></a>
													</div>
												</td>
											</tr>

										</c:forEach>

					                    </tbody>
					                </table>
					            </div>
					            <div class="row">
					                <div class="col-sm-5">

					                </div>
					                <div class="col-sm-7 text-right">
										<%--分页控件--%>
					                    <ul class="pagination" id="pageButton">

					                    </ul>
					                </div>
					            </div>
					        </div>
					        
                </div>

            </div>
			</div>



            <jsp:include page="comment/nav_left.jsp"></jsp:include>


        </div>

        <jsp:include page="comment/footer.jsp"></jsp:include>


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
	<script src="plugins/bootstrap-paginator.js"></script>
		<!--弹框样式插件-->
	<script src="plugins/bootbox/bootbox.min.js"></script>


		<script>

            $('#pageButton').bootstrapPaginator({
                bootstrapMajorVersion: 4,//bootstrap版本
                currentPage: ${pageNum},//当前的请求页面。
                totalPages: ${totalPage},//一共多少页。
                numberOfPages: 5,//一页显示几个按钮
                itemTexts: function (type, page, current) {

                    switch (type) {

                        case "first":
                            return "首页";

                        case "prev":
                            return "上一页";

                        case "next":
                            return "下一页";

                        case "last":
                            return "末页";

                        case "page":
                            return page;

                    }
                },//改写分页按钮字样
                onPageClicked: function (event,type,originalEvent,page) {
                    var title=$("#title").val();

                    location.href = '../set/user_index?page='+page+'&title='+title;
                },

            });
		</script>

		<%--删除文章按钮--%>
		<script>
			$(function () {
				$(".deleteUserBlog").on("click",function () {
				    /*放置ajax后调用不到this*/
				    var thisis=$(this)
				    var wenzhangId=thisis.attr("wenzhangId");

				    var wenzhangTitle=thisis.parent().parent().parent().children(":eq(1)").text().trim();

                    bootbox.confirm({message:"确认要删除该条数据吗？",size:"small",callback:function(deletemess){
                            if(deletemess==true){
                                $.ajax({
                                    url:'../set/deleteUserBlog',
                                    datatype:'boolean',
                                    data:{'wenzhangId':wenzhangId,'wenzhangTitle':wenzhangTitle},
                                    context: document.body,
                                    success:function(data){
                                        console.log(data)
                                        if(data==true){
                                            thisis.parent().parent().parent().hide(1000,function(){
                                                thisis.parent().parent().parent().remove();
                                                thisis='';
                                            })



                                        }
                                    }
                                })
                            }
                        }
                    })
                })
            })
		</script>

</body>
</html>
