<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath(); //  path = "/travel"
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
		<base href=" <%=basePath%>">
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>九星除甲醛|甲醛检测|甲醛知识</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" href=" assets/img/bg/lyjxing.ico" />
		<!-- all css here -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <link rel="stylesheet" href="assets/css/ionicons.min.css">
        <link rel="stylesheet" href="assets/css/headline.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="assets/css/meanmenu.css">
        <link rel="stylesheet" href="assets/css/bundle.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/responsive.css">
		<link rel="stylesheet" href="assets/css/pagination.css">
        <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
	</head>
	<body>
	<header>
		<!-- 头部信息 -->
		<div class="header-top-area blue-bg">
			<div class="container">
				<div class="row logorow">
					<div class="col-lg-3 col-md-3 col-sm-3 site-branding col-xs-12">
						<div class="header-logo">
							<a href="index.html"><img src="assets/img/logo/logo.png" alt="" /></a>
						</div>
					</div>
					<div class="col-lg-9 col-md-9 col-sm-9 hidden-xs">
						<div class="header-left">
							<div class="header-text">
								<div class="header-icon">
									<i class="fa fa-phone"></i>
									<i class="paint-roller"></i>
								</div>
								<div class="header-info">
									<span class="phone">+13608658866</span>
									<span class="gmail">张先生</span>
								</div>
							</div>
							<div class="header-text">
								<div class="header-icon">
									<i class="fa fa-home"></i>
								</div>
								<div class="header-info">
									<span class="phone">河南洛阳洛龙区</span>
									<span class="gmail">开元大道以南宝龙城市广场3幢2单元27层2-2710 </span>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- 导航栏 -->
		<div id="header-sticky" class="main-menu-area  gray-bg ">
			<div class="container">
				<div class="row">
					<div class=" col-lg-10 col-md-10  col-xs-7">
						<div class="main-menu">
							<nav>
								<ul>
									<li class="active"><a href="index.html">主页</a>
									</li>
									<li><a href="about-us.html">公司简介</a></li>
									<li><a href="service.html">主营业务</a>

									</li>
									<li><a href="project.html">工程展示</a>

									</li>
									<li><a href="hpe/index">最新动态</a>

									</li>
									<li><a href="contact.html">联系我们</a></li>
								</ul>
							</nav>
						</div>
					</div>
					<div class=" col-lg-2 col-md-2 col-xs-12">
						<div class="make-appointment">

							<a href="#">CMA认证企业</a>

						</div>
					</div>
					<div class="col-xs-12"><div class="mobile-menu"></div></div>
				</div>
			</div>
		</div>
		<!-- 导航结束 -->
	</header>
		<!-- header-top-area-start -->
		<!-- breadcrumb-banner-area -->
		<div class="breadcrumb-banner-area ptb-160 " style="background-image:url(assets/img/bg/5.jpg);background-size: 100% 100%">
			<%--<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="breadcrumb-text text-center">
							<h2>洛阳九星环保科技有限责任公司</h2>
							<p>原创文章，请勿抄袭</p>
						</div>
					</div>
				</div>
			</div>--%>
		</div>
		<!-- breadcrumb-banner-area-end -->
		<!-- blog-right-area-start -->

		<div class="blog-area pt-30 pb-90">
			<div class="container">
				<div class="row">
					<div class="section-title mb-60 text-center" >
						<h3>洛阳九星环保科技有限责任公司</h3>
						<h4>原创文章，请勿抄袭</h4>
					</div>
					<div class="col-md-8 mb-30">

					<c:if test="${requestScope.wenzhanglist!=null }">
						<c:forEach var="wzls" items="${requestScope.wenzhanglist }">
							<article class="blog-post mb-20 clearfix ptb-10">
								<%--文章图片处理--%>
								<c:if test="${wzls.wenzhangTupianlink!=''&& wzls.wenzhangTupianlink!=null }">
									<div class="col-md-4 blog-img">
										<a href="${wzls.wenzhangLink }"><img src="${wzls.wenzhangTupianlink }" alt="">
										</a>
									</div>
								</c:if>
								<div class="col-md-8">
									<div class="blog-content">
										<h2 class="post-title" style="font-size: 20px;"><a href="${wzls.wenzhangLink }">${wzls.wenzhangTitle }</a></h2>
										<p><a href="${wzls.wenzhangLink }" style="color: #999">${wzls.wenzhangZhaiyao }</a></p>
										<div class="blog-meta">
											<span>${wzls.wenzhangUser }</span>
											<span><fmt:formatDate value="${wzls.createTime }" pattern="yyyy-MM-dd"/></span>

										</div>


									</div>
								</div>
							</article>
						</c:forEach>
					</c:if>
					<c:if test="${empty requestScope.wenzhanglist}">
							<h2>暂无内容，敬请期待</h2>
					</c:if>
						<ul id="pageLimit" class="m-style M-box2"></ul>
					</div>
					<div class="col-md-4 mb-30">
						<div class="widget mb-60">
							<div class="blog-widget-img">
								<img src="assets/img/service/6.jpg" alt="" />
							</div>
							<div class="blog-widget-title">
								<p>洛阳九星环保科技有限责任公司 专业甲醛检测机构专业除甲醛</p>
								<h4>联系人张先生</h4>
								<span>13608658866</span>
								<div class="blog-widget-icon">

							</div>
							</div>
						</div>



					</div>
				</div>
			</div>
		</div>
		<!-- blog-right-area-start -->
		<footer>

		<!-- footer-bottom-area-start -->
		<div class="footer-bottom-area gray-bg-1 ptb-20">
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-sm-12">
						<div class="copyright">
							<p>Copyright © 2019 <a href="http://www.lyjxing.com">洛阳九星环保科技有限责任公司</a> 欢迎访问.<span>豫ICP备19021524号</span></p>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- footer-bottom-area-end -->
	</footer>
		<!-- all js here -->
        <script src="assets/js/vendor/jquery-1.12.0.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/headline.js"></script>
        <script src="assets/js/jquery.magnific-popup.min.js"></script>
        <script src="assets/js/jquery.scrollUp.min.js"></script>
        <script src="assets/js/isotope.pkgd.min.js"></script>
        <script src="assets/js/imagesloaded.pkgd.min.js"></script>
        <script src="assets/js/jquery.counterup.min.js"></script>
        <script src="assets/js/waypoints.min.js"></script>
        <script src="assets/js/jquery.parallax-1.1.3.js"></script>
        <script src="assets/js/owl.carousel.min.js"></script>
        <script src="assets/js/jquery.meanmenu.js"></script>
		<script src="assets/js/jquery.pagination.js"></script>

        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>
	<script>
        $('#pageLimit').pagination({
            current: ${pageNum},//当前的请求页面。
            pageCount: ${totalPage},//一共多少页。

            coping: true,
            homePage: '首页',
            endPage: '末页',
            prevContent: '上页',
            nextContent: '下页',
            callback: function (api) {

                location.href = 'hpe/index?page='+api.getCurrent()+'&leibie='+"";
            },

        });
	</script>

	<script>
        var hrefv=window.location.pathname;

        /*焦点定位*/
        $(".main-menu nav ul li a").each(function(){
            var spanv=$(this).attr('href');
            if(hrefv.indexOf(spanv)!=-1){
                $(".main-menu nav ul li").siblings().removeClass('active');
                $(this).parent().addClass('active');
            }
        });
	</script>
    </body>
</html>
