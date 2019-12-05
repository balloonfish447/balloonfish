<!DOCTYPE html>
<html xmlns:wb="http://open.weibo.com/wb">
<head>
  <meta charset="utf-8">
  <title>${title !}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="java,spring,源码,技术,
  							hibernate,html,css,javascript,springboot,springMvc,大数据,AI,人工智能,hadoop,linux,storm,spark,python">
  <meta name="description" content="${zhaiyao1 !}">
  <link rel="stylesheet" href="../res/layui/css/layui.css">
  <link rel="stylesheet" href="../res/css/global.css">
  <link rel="icon" type="image/png" href="/HPECODE/hpecode/favicon1.png">
  <script src="../res/js/jquery-1.7.min.js"></script>
  <script src="../res/layui/layui.js"></script>
  <link rel="stylesheet" type="text/css" href="../styles/atom-one-light.css">
	<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js" type="text/javascript" charset="utf-8"></script>
    <script src="../highlight.pack.js"></script>
    <script>hljs.initHighlightingOnLoad();</script>
  <script type="text/javascript">
  layui.use('layer', function(){
	  var layer = layui.layer;
	 
  });
  $(function(){
  //查询推荐文章
  $.ajax({
	  type: 'POST',
	  url: '../../html/right',
	  dataType: 'json',
	  success:function(data){
		  for(var i=0;i<data.length;i++){
			  $("#wenzhang").append('<dd><a href="'+data[i].name+
					  '" title="'+data[i].title+'">'+data[i].title+'</a><span><i class="iconfont">&#xe60b;</i> 访问 '
					 	+data[i].fangwen+
					  '</span></dd>');
		  }
		  
		  
	  },
	  
	});
  //获取隐藏变量link的值
  var link =$("#biaoti").html();
  //查询文章的访问量和推荐次数
  $.ajax({
	  type: 'post',
	  url: '../../fangwen/gettongjicishu?link='+link,
	  dataType: 'json',
	  success: function(data){
			  $("#fangwen").text(data[0][0]);
			  $("#tuijian").text(data[0][1])
		 
	  
	  } ,
	
	  
	});
  //处理文章的推荐次数
  $("#button1").click(function(){
	 
		$.ajax({
			url:'../../fangwen/tuijiancishu?link='+link,
			dataType:'text',
			success:function(data){
				if(data=='你以推荐成功，请忽重复推荐！'||data=='登录以后才能推荐奥！'){
					
					layer.msg(data);
				}else{
					layer.msg("推荐成功，感谢您的推荐");
					$("#tuijian").text(data);
				}
				
			}
		})
	})
  })
  </script>

</head>
<body>

	 <iframe src="../jsp/common/header_ftl.jsp" height="57px" width="100%" style="
		position: absolute;
		z-index: 10000;
		left: 0;
		top: 0;
		width: 100%;
		height: 57px;
		background-color:#000;
		border:none;
		scrolling:no;"
	></iframe>




<div class="main layui-clear">
  <div class="wrap">
    <div class="content detail">
      <div class="fly-panel detail-box">
      <span hidden="hidden" id="biaoti">${wenzhangLink !}</span>
        <h1 style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap; font-size: 32px;" >${title !}</h1>
        <div class="fly-tip fly-detail-hint" data-id="{{rows.id}}">
       	 所属类别：
       	 <#list spanall as span>
       	  <span class="fly-tip-jing">${span}</span>
       	 </#list>
        <!--
          <span class="fly-tip-stick">置顶帖</span>
          <span class="fly-tip-jing">精帖</span>
          
          
         
        
          <span class="jie-admin" type="set" field="stick" rank="1">置顶</span> 
          <span class="jie-admin" type="set" field="stick" rank="0" style="background-color:#ccc;">取消置顶</span>
          <span class="jie-admin" type="set" field="status" rank="1">加精</span> 
          <span class="jie-admin" type="set" field="status" rank="0" style="background-color:#ccc;">取消加精</span> -->
          
          <div class="fly-list-hint layui-hide-xs"> 
            <i class="iconfont" title="访问">&#xe60b;</i>访问：<b id="fangwen"></b> 
              <i class="iconfont icon-zan" title="推荐"></i>推荐：<b id="tuijian"></b>
          </div>
        </div>
        <div class="detail-about">
          <a class="jie-user" href="javascript:##">
            <img src="${touxiang ! }" alt="木有头像">     
            <cite>
          	  作者： ${username !}  
            </cite>
          </a>
          <div class="detail-hits">
            
            <span class="layui-btn layui-btn-mini jie-admin" >创建时间：</span>
            <span style="color:black;margin-left: 10px;">${fabutime !}</span>
            <!--<span class="layui-btn layui-btn-mini jie-admin  layui-btn-danger" type="collect" data-type="add">取消收藏</span>-->
          </div>
        </div>
        
        <div class="detail-body photos" style="margin-bottom: 20px;font-size: 16px;">
        	${textarea !}
        </div>
        <!--点赞按钮  -->
        <div style="margin: auto; text-align: center;font-size:12px">
        <div style="margin-bottom: 20px">
        <span style="font-size: 14px"><span style="color: #9B9EA0">--</span>THE END<span style="color: #9B9EA0">--</span></span><br>
        <span style="color: #9B9EA0">欢迎分享和点赞，如转载请注明文章出处</span>
        </div>
		<button class="layui-btn layui-btn-radius layui-btn-primary btn1" id="button1"
			style="width: 4.5em; height: 4.5em; border: 1px solid #e45153">
			<i class="iconfont icon-zan" style="font-size: 2em; color: #e45153;" id="con1"></i>
		</button>
		<a id="shareBtn" href="javascript:void(0)"  target="_blank">
		<button class="layui-btn layui-btn-radius layui-btn-primary btn1" id="button2"
			style="width: 4.5em; height: 4.5em; border: 1px solid #e45153;" >
			<i class="iconfont icon-weibo" style="font-size: 2em; color: #e45153;" id="con_weibo"></i>
		</button>
		</a>
					
		</div>        
      </div>
    </div>
  </div>
  
  <div class="edge">
    <dl class="fly-panel fly-list-one" id="wenzhang"> 
      <dt class="fly-panel-title" >最近热文</dt>
      
      
    </dl>
    
    <dl class="fly-panel fly-list-san"> 
      <dt class="fly-panel-title">近期标签</dt>
      <dd> 
       	  <span  class="spanxuanzhong1"><a href="../../hpe/index?leibie=Hadoop">Hadoop</a></span>
          <span  class="spanxuanzhong1"><a href="../../hpe/index?leibie=Spark">Spark</a></span>
          <span  class="spanxuanzhong1"><a href="../../hpe/index?leibie=Python">Python</a></span>   
        <span  class="spanxuanzhong1"><a href="../../hpe/index?leibie=Java">Java</a></span>		
          <span  class="spanxuanzhong1"><a href="../../hpe/index?leibie=Spring">Spring</a></span>        
          <span  class="spanxuanzhong1"><a href="../../hpe/index?leibie=Mybatis">Mybatis</a></span>     
       	  <span  class="spanxuanzhong1"><a href="../../hpe/index?leibie=Hibernate">Hibernate</a></span>
          <span  class="spanxuanzhong1"><a href="../../hpe/index?leibie=Mysql">Mysql</a></span>
          <span  class="spanxuanzhong1"><a href="../../hpe/index?leibie=Oracle">Oracle</a></span>    
       	  <span  class="spanxuanzhong1"><a href="../../hpe/index?leibie=SpringMvc">SpringMvc</a></span>
          <span  class="spanxuanzhong1"><a href="../../hpe/index?leibie=SpringBoot">SpringBoot</a></span>
          <span  class="spanxuanzhong1"><a href="../../hpe/index?leibie=Linux">Linux</a></span>
       </dd>
    </dl>
  </div>

</div>


<div class="footer">
  <p><a href="javascript::#">MagicCode社区</a> 2017 &copy; <a href="http://www.hnzydsj.com/">MagicCode.com</a></p>
  <p>
    工业和信息化部 版权所有:<a href="http://www.miibeian.gov.cn" target="_blank">豫ICP备18014433</a>
    <a href="javascript::#" target="_blank">欢迎获取文档知识</a>
    <a href="javascript::#" target="_blank">微信公众号</a>
  </p>
</div>


<script>
layui.cache.page = 'jie';

layui.config({
  version: "3.0.0"
  ,base: '../res/mods/'
}).extend({
  fly: 'index'
}).use(['fly', 'face'], function(){
  var $ = layui.$
  ,fly = layui.fly;
  
});
</script> 

<!--微博分享  -->
<script type="text/javascript">
	var weiboimgs="";
	$(".photos img").each(function(){
		var weiboimg = $(this).prop("src");	
		
		weiboimgs+=weiboimg+"||";
	})
	weiboimgs=weiboimgs.substring(0,weiboimgs.length-2);
	
  	$(function(){
  		$(".btn1").mouseover(function(){
  			$(this).children().css("color","#ffffff");
  			$(this).css("background-color","#e45153");
  		})
  		$(".btn1").mouseout(function(){
  			$(this).children().css("color","#e45153");
  			$(this).css("background-color","#ffffff");
  		})
  		
  		
  	})
	function weiboShare(){ 
  		var wb_shareBtn = document.getElementById("shareBtn") 
  		wb_url = document.URL, //获取当前页面地址
  		
  		wb_appkey = "68425335",//你的app key 
  		wb_title = document.title, 
  		//wb_ralateUid = "5936412667",//微博id，获得你的用户名
  		 
  		wb_pic = weiboimgs,
  		wb_language = "zh_cn"; 
  		wb_shareBtn.setAttribute("href","http://service.weibo.com/share/share.php?url="+wb_url+"&appkey="+wb_appkey+"&title="+wb_title+"&pic="+wb_pic+"&language="+wb_language+""); 
  		
  	} weiboShare()
  	

  </script>
  
 <script>
//右下角小图标
layui.use('util', function(){
	  var util = layui.util;
	  
	  //执行
	  util.fixbar({
		  bgcolor:"#009688",
		  bar1: '&#xe770'
			    ,click: function(type){
			      if(type === 'bar1'){
			    	  layer.confirm('即将前往登录页面？', {
			    		  btn: ['去登录','还是不去吧'] //按钮
			    		}, function(){
			    		  window.location.href="/HPECODE/link/login";
			    		}, function(){
			    		  layer.msg('貌似你错过了好多',{icon: 5}, {
			    		    time: 2000, //2s后自动关闭
			    		    
			    		  });
			    		});
			      }
			    }
		  });
		});
</script>

<!--百度自动推送源码  -->
<script>
(function(){
    var bp = document.createElement('script');
    var curProtocol = window.location.protocol.split(':')[0];
    if (curProtocol === 'https'){
   bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
  }
  else{
  bp.src = 'http://push.zhanzhang.baidu.com/push.js';
  }
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(bp, s);
})();
</script>
<!--百度统计  -->
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?26cc45d45510ad9cadd806f336e09d01";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>



</body>
</html>