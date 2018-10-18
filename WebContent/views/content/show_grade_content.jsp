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
      	<form class="am-form am-form-horizontal">
      	<input type="hidden" name="id" id="id" value="${content.id}">
      		 <legend>${province.en_name}--${point.source.name}--${point.name}</legend>
      	
	      	<div class="am-form-group">
		      <label for="doc-ta-1">文字描述</label>
		      <p>${content.description}</p>
		    </div>
		    
		
		    <div class="am-form-group">
		    <label for="doc-ta-1">图片列表</label>
	        <ul class="am-avg-sm-2 am-avg-md-4 am-avg-lg-6 am-margin gallery-list">
	        	<c:forEach var="image" items="${image_list}" varStatus="s">
	        	<li>
		            <img class="am-img-thumbnail am-img-bdrs" src="${image.path}" alt=""/>
		        </li>
		        </c:forEach>
	        </ul>
	        <p>${content.image_description}</p>
		    </div>
		    
		    <div class="am-form-group">
		    <label for="doc-ta-1">视频列表</label>
		    <video id="my-video" class="video-js" controls preload="auto" width="920" height="500" poster="m.png" data-setup="{}">
		    	<c:forEach var="video" items="${video_list}" varStatus="s">
	        	<source src="${video.path}" type="video/mp4">
		        </c:forEach>
		 	</video>
		 	<p>${content.video_description}</p>
		    </div>
		    
		    <div class="am-form-group">
		    	<div class="am-u-sm-1"><label>分数</label></div>
			    <div class="am-u-sm-3">
				    <select id="score">
				    	<option value="0" <c:if test="${content.score==0}">selected</c:if>>0</option>
				    	<option value="1" <c:if test="${content.score==1}">selected</c:if>>1</option>
				    	<option value="2" <c:if test="${content.score==2}">selected</c:if>>2</option>
				    	<option value="3" <c:if test="${content.score==3}">selected</c:if>>3</option>
				    	<option value="4" <c:if test="${content.score==4}">selected</c:if>>4</option>
				    	<option value="5" <c:if test="${content.score==5}">selected</c:if>>5</option>
				    </select>
			    </div>
			    <div class="am-u-sm-8"></div>
		    </div>
		    <br>
		    <div class="am-form-group">
			    <div class="am-u-sm-8 am-u-sm-offset-4">
			      <button type="button" id="save_button" class="am-btn am-btn-primary am-btn-xl">保存评分</button>
			    </div>
			</div>
		</form>
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
    
  	//保存按钮点击事件
	$("#save_button").click(function() {
		var saveData={"id":$("#id").val(),"score":$("#score").val()};
		$.ajax({
			contentType:"application/x-www-form-urlencoded",
		    type : "POST",
		    url : "<%=request.getContextPath()%>/save_content.do",
		    data : saveData,
		    dataType: "json",
		    success : function(data) {
		        if(data.flag=="1"){
		            alert("保存成功！");
		        }
		        else{
		            alert("保存失败！");
		        }
		    },
		    error :function(){
		        alert("网络连接出错！");
		    }
		});
	});
});

var myPlayer = videojs('my-video');
</script>
</body>
</html>