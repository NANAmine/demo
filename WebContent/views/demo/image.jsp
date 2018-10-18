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
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">图片材料 </strong> / <small>grade</small></div>
  </div>
  <div class="am-g">
      <div class="am-u-sm-12">
      		 <legend>驻在国安全形势--恐怖主义影响</legend>
		    
		    <div class="am-form-group" id="image_div">
		    <label for="doc-ta-1">图片列表</label>
	        <ul class="am-avg-sm-2 am-avg-md-4 am-avg-lg-6 am-margin gallery-list">
	        	<!-- <li>
		            <a href="fileUpload/image/demo/01.jpg" target="_blank"><img class="am-img-thumbnail am-img-bdrs" src="fileUpload/image/demo/01.jpg" alt=""/></a>
		        </li>
		        <li>
		            <a href="fileUpload/image/demo/02.jpg" target="_blank"><img class="am-img-thumbnail am-img-bdrs" src="fileUpload/image/demo/02.jpg" alt=""/></a>
		        </li>
		        <li>
		            <a href="fileUpload/image/demo/03.jpg" target="_blank"><img class="am-img-thumbnail am-img-bdrs" src="fileUpload/image/demo/03.jpg" alt=""/></a>
		        </li>
		        <li>
		            <a href="fileUpload/image/demo/04.jpg" target="_blank"><img class="am-img-thumbnail am-img-bdrs" src="fileUpload/image/demo/04.jpg" alt=""/></a>
		        </li>
		        <li>
		            <a href="fileUpload/image/demo/05.jpg" target="_blank"><img class="am-img-thumbnail am-img-bdrs" src="fileUpload/image/demo/05.jpg" alt=""/></a>
		        </li> -->
		        <c:forEach var="image" items="${image_list}" varStatus="s">
	        	<li id="upload_file_${image.id}">
		            <img class="am-img-thumbnail am-img-bdrs" width="200"  src="${image.path}" alt=""/><br>
		            <a href="##" class="a am-icon-btn am-icon-remove" id="${image.id}" onclick="remove(${image.id})"></a>
		        </li>
		        </c:forEach>
		        
	        </ul>
		    </div>
		    
		    <div class="am-form-group" id="word_div">
		      <label for="doc-ta-1">文字描述</label>
		      <br>
		      <textarea id="description" rows="10" cols="200">${image_content}</textarea>
		    </div>
		    
		    <br>
		    <div class="am-form-group" id="save_div">
			    <div class="am-u-sm-8 am-u-sm-offset-4">
			      <button type="button" id="save_button" class="am-btn am-btn-primary am-btn-xl">保存描述</button>
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
//删除图片事件
$(".a").click(function() {
		console.log("开始删除"+$(this).attr("id"));
		var saveData={"id":$(this).attr("id")};
		$.ajax({
			contentType:"application/x-www-form-urlencoded",
		    type : "POST",
		    url : "<%=request.getContextPath()%>/delete_file.do",
		    data : saveData,
		    dataType: "json",
		    success : function(data) {
		        if(data.flag=="1"){
		            alert("删除成功！");
		            location.reload();s
		        }
		        else{
		            alert(data+"删除失败！");
		        }
		    },
		    error :function(){
		        alert("网络连接出错！");
		    }
		});
	});

$(function(){ 
	//description
  	//保存按钮点击事件
	$("#save_button").click(function() {
		var saveData={"id":'${id}',"score":$("#score").val(),"description":$("#description").val()};
		$.ajax({
			contentType:"application/x-www-form-urlencoded",
		    type : "POST",
		    url : "<%=request.getContextPath()%>/save_image_content.do",
		    data : saveData,
		    dataType: "json",
		    success : function(data) {
		        if(data.flag=="1"){
		            alert("保存成功！");
		        }
		        else{
		            alert(data+"保存失败！");
		        }
		    },
		    error :function(){
		        alert("网络连接出错！");
		    }
		});
	});
  });

</script>
</body>
</html>