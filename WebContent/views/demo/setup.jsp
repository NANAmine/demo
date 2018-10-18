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
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">视频抓取设置</strong> / <small>setup</small></div>
  </div>
  <div class="am-g">
      <div class="am-u-sm-12">
      		<form class="am-form">
				 <fieldset>
				   <legend>参数设置</legend>
						    
		    <div class="am-form-group">
		      <label for="doc-ta-1">帧间隔</label><input type="text" class="" id="doc-ipt-email-1">
		    </div>
		     <div class="am-form-group">
		      <label for="doc-ta-1">宽度</label> <input type="text" class="" id="doc-ipt-email-1">
		    </div>
		     <div class="am-form-group">
		      <label for="doc-ta-1">长度</label> <input type="text" class="" id="doc-ipt-email-1">
		    </div>
		     <div class="am-form-group">
		      <label for="doc-ta-1">最多截取张数</label> <input type="text" class="" id="doc-ipt-email-1">
		    </div>
		   </fieldset>
			</form>
		    
		    <br>
		    <div class="am-form-group" id="save_div">
			    <div class="am-u-sm-8 am-u-sm-offset-4">
			      <button type="button" id="save_button" class="am-btn am-btn-primary am-btn-lg">保存</button>
			      <br>
			    </div>
			</div>
      </div>
    </div>
    <div class="am-g">
    &nbsp;
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