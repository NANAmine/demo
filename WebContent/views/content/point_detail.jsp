<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
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
  <style>
    .get {
      background: #1E5B94;
      color: #fff;
      text-align: center;
      padding: 100px 0;
    }

    .get-title {
      font-size: 200%;
      border: 2px solid #fff;
      padding: 20px;
      display: inline-block;
    }

    .get-btn {
      background: #fff;
    }

    .detail {
      background: #fff;
    }

    .detail-h2 {
      text-align: center;
      font-size: 150%;
      margin: 40px 0;
    }

    .detail-h3 {
      color: #1f8dd6;
    }

    .detail-p {
      color: #7f8c8d;
    }

    .detail-mb {
      margin-bottom: 30px;
    }

    .hope {
      background: #0bb59b;
      padding: 50px 0;
    }

    .hope-img {
      text-align: center;
    }

    .hope-hr {
      border-color: #149C88;
    }

    .hope-title {
      font-size: 140%;
    }

    .about {
      background: #fff;
      padding: 40px 0;
      color: #7f8c8d;
    }

    .about-color {
      color: #34495e;
    }

    .about-title {
      font-size: 180%;
      padding: 30px 0 50px 0;
      text-align: center;
    }

    .footer p {
      color: #7f8c8d;
      margin: 0;
      padding: 15px 0;
      text-align: center;
      background: #2d3e50;
    }
     .header {
      text-align: center;
      background-color: #0c68A7;
    }
    .header h1 {
      font-size: 200%;
      color: #333;
      margin-top: 30px;
    }
    .header p {
      font-size: 14px;
    }
    .banner {
	with:100%;height:79px;
	max-width: 1120px;
	margin: 0 auto;
	background:#0c68A7 url(img/banner.jpg) no-repeat top left;
  </style>
</head>
<body>
<div class="header">
  <div class="banner">

  </div>
</div>


<div class="detail">
  <div class="am-g am-container">
    <div class="am-u-lg-12">
      	<form class="am-form am-form-horizontal">
      	<input type="hidden" name="id" id="id" value="${content.id}">
      		 <div class="am-u-sm-5 am-u-sm-centered">
      		 	<h3>${content.point.source.name}--${content.point.name}--${content.score}分</h3>
      		 </div>
      	
	      	<div class="am-form-group">
		      <label for="doc-ta-1">文字描述</label>
		      <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${content.description}</p>
		    </div>
		    
		    <div class="am-form-group">
		    <label for="doc-ta-1">视频列表</label>
		    <video id="my-video" class="video-js" controls preload="auto" width="920" height="500" poster="m.png" data-setup="{}">
				<source src="fileUpload/video/11_1524677515266.mp4" type="video/mp4">
		 	</video>
		    </div>
		    
		
		    <div class="am-form-group">
		    <label for="doc-ta-1">图片列表</label>
	        <ul class="am-avg-sm-2 am-avg-md-4 am-avg-lg-6 am-margin gallery-list">
	        	<c:forEach var="image" items="${image_list}" varStatus="s">
	        	<li>
		            <a href="${image.path}" target="_blank"><img class="am-img-thumbnail am-img-bdrs" src="${image.path}" alt=""/></a>
		        </li>
		        </c:forEach>
	        </ul>
		    </div>
		    
		    <div class="am-form-group">
		    <label for="doc-ta-1">文件列表</label>
	          	<c:forEach var="file" items="${file_list}" varStatus="s">
	        	<li>
		            <a href="${file.path}">${file.file_name}</a>
		        </li>
		        </c:forEach>
		    </div>

		</form>
      </div>
  </div>
</div>

<footer>
  <hr>
  <p class="am-padding-left">© 2016 AllMobilize, Inc. Licensed under MIT license.</p>
</footer>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="assets/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/video.min.js"></script>
<script type="text/javascript">
	var myPlayer = videojs('my-video');
</script>
</body>
</html>
