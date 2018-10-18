<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>联合国维和行动风险评估系统</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
  <link rel="stylesheet" href="assets/css/video-js.css" type="text/css">
</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->

<jsp:include page="/manage_header.do" flush="true"/>

<div class="am-cf admin-main">
  <!-- sidebar start -->
  <jsp:include page="/manage_tree.do" flush="true"></jsp:include>
  <!-- sidebar end -->

<!-- content start -->
<div class="admin-content">

  <div class="am-cf am-padding">
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">风险评估</strong> / <small>grade</small></div>
  </div>
  <div class="am-g">
      <div class="am-u-sm-12">
      		 <legend>驻在国安全形势--恐怖主义影响</legend>
      		 <div class="am-form-group">
		      <label for="doc-ta-1">文字描述</label>
		      <p>${content}
		      </p>
		    </div>
      		 <!-- 图片显示 -->
      		 <ul class="am-avg-sm-2 am-avg-md-4 am-avg-lg-6 am-margin gallery-list">
	        	<c:forEach var="image" items="${image_list}" varStatus="s">
	        	<li id="upload_file_${image.id}">
		            <img class="am-img-thumbnail am-img-bdrs" width="200" src="${image.path}" alt=""/><br>
		            <a href="##" class="am-icon-btn am-icon-remove" onclick="remove(${image.id})"></a>
		        </li>
		        </c:forEach>
	        </ul>
	        <div class="am-form-group">
		      <label for="doc-ta-1">照片描述</label>
		      <p>${content}
		      </p>
		    </div>
	        <!-- 视频显示 -->
		    <c:forEach var="video" items="${video_list}" varStatus="s">
		    	<li id="upload_file_${video.id}">
		            <a href="${video.path}">${video.file_name}</a>&nbsp;&nbsp;<a href="##" class="am-icon-remove" onclick="remove(${video.id})"></a>
		        </li>
		        </c:forEach>
		    <div class="am-form-group">
		      <label for="doc-ta-1">视频描述</label>
		      <p>${content}
		      </p>
		    </div>
		    
		    <div class="am-form-group">
		      <label for="doc-ta-1">关键字</label>
		      <br>
		       <%-- <c:forEach items="${lf2list1}" var="gc" varStatus="sindex">
	                <p>${gc.name}</p>
	                <ul>
		                <c:forEach items="${lf2list2[sindex.index]}" var="goodsCategory">
		                    <li>
		                    	<a href="${pageContext.request.contextPath}/goods/showGoods.do?categoryId=${goodsCategory.id}">
		                    		${goodsCategory.name}
		                    	</a>
		                    </li>
		                </c:forEach>
		                
	                </ul>
                
                </c:forEach> --%>
		      <span class="am-badge am-badge-danger am-text-lg">战乱</span>
		      <span class="am-badge am-badge-danger am-text-lg">危险</span>
		      <span class="am-badge am-badge-danger am-text-lg">对抗</span>
		      <span class="am-badge am-badge-danger am-text-lg">谈判</span>
		      <span class="am-badge am-badge-danger am-text-lg">局势</span>
		    </div>
		    
		    <div class="am-form-group" id="word_div">
		      <label for="doc-ta-1">评分</label>
		      <br>
		      <span class="am-badge am-badge-danger am-text-xl">5分</span>
		    </div>
		    
		    <br>
		    <div class="am-form-group" id="save_div">
			    <div class="am-u-sm-8 am-u-sm-offset-4">
			      <button type="button" id="save_button" class="am-btn am-btn-primary am-btn-xl">自动分析</button>
			    </div>
			</div>
      </div>
    </div>
</div>

<!-- content end -->

</div>

<a href="#" class="am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}">
  <span class="am-icon-btn am-icon-th-list"></span>
</a>

<jsp:include page="/manage_foot.do" flush="true"/>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="assets/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>
<script src="assets/js/webuploader.nolog.js"></script>
<script src="assets/js/video.min.js"></script>
<script type="text/javascript">
$(function(){ 
    $("#word_div").hide();
  	//保存按钮点击事件
	$("#save_button").click(function() {
		$("#word_div").show();
	});
});
</script>
</body>
</html>