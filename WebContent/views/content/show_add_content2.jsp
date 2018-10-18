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
  <link rel="stylesheet" href="assets/css/webuploader.css">
<style>
.wu-example {
    position: relative;
    padding: 45px 15px 15px;
    margin: 15px 0;
    background-color: #fafafa;
    box-shadow: inset 0 3px 6px rgba(0, 0, 0, .05);
    border-color: #e5e5e5 #eee #eee;
    border-style: solid;
    border-width: 1px 0;
}
.wu-example:after {
    position: absolute;
    top: 15px;
    left: 15px;
    font-size: 12px;
    font-weight: bold;
    color: #bbb;
    text-transform: uppercase;
    letter-spacing: 1px;
}

#picker {
    display: inline-block;
    line-height: 1.428571429;
    vertical-align: middle;
    margin: 0 12px 0 0;
}
#picker .webuploader-pick {
    padding: 6px 12px;
    display: block;
}

#picker_file {
    display: inline-block;
    line-height: 1.428571429;
    vertical-align: middle;
    margin: 0 12px 0 0;
}
#picker_file .webuploader-pick {
    padding: 6px 12px;
    display: block;
}

#picker_video {
    display: inline-block;
    line-height: 1.428571429;
    vertical-align: middle;
    margin: 0 12px 0 0;
}
#picker_video .webuploader-pick {
    padding: 6px 12px;
    display: block;
}

.uploader-list {
    width: 100%;
    overflow: hidden;
}
.file-item {
    float: left;
    position: relative;
    margin: 0 20px 20px 0;
    padding: 4px;
}
.file-item .error {
    position: absolute;
    top: 4px;
    left: 4px;
    right: 4px;
    background: red;
    color: white;
    text-align: center;
    height: 20px;
    font-size: 14px;
    line-height: 23px;
}
.file-item .info {
    position: absolute;
    left: 4px;
    bottom: 4px;
    right: 4px;
    height: 20px;
    line-height: 20px;
    text-indent: 5px;
    background: rgba(0, 0, 0, 0.6);
    color: white;
    overflow: hidden;
    white-space: nowrap;
    text-overflow : ellipsis;
    font-size: 12px;
    z-index: 10;
}
.upload-state-done:after {
    content:"\f00c";
    font-family: FontAwesome;
    font-style: normal;
    font-weight: normal;
    line-height: 1;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    font-size: 32px;
    position: absolute;
    bottom: 0;
    right: 4px;
    color: #4cae4c;
    z-index: 99;
}
.file-item .progress {
    position: absolute;
    right: 4px;
    bottom: 4px;
    height: 3px;
    left: 4px;
    height: 4px;
    overflow: hidden;
    z-index: 15;
    margin:0;
    padding: 0;
    border-radius: 0;
    background: transparent;
}
.file-item .progress span {
    display: block;
    overflow: hidden;
    width: 0;
    height: 100%;
    background: #d14 url(../images/progress.png) repeat-x;
    -webit-transition: width 200ms linear;
    -moz-transition: width 200ms linear;
    -o-transition: width 200ms linear;
    -ms-transition: width 200ms linear;
    transition: width 200ms linear;
    -webkit-animation: progressmove 2s linear infinite;
    -moz-animation: progressmove 2s linear infinite;
    -o-animation: progressmove 2s linear infinite;
    -ms-animation: progressmove 2s linear infinite;
    animation: progressmove 2s linear infinite;
    -webkit-transform: translateZ(0);
}
</style>
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
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">材料录入</strong> / <small>insert</small></div>
  </div>
  <div class="am-g">
      <div class="am-u-sm-12">
      	<form class="am-form">
      	<input type="hidden" name="id" id="id" value="${content.id}">
	      	<div class="am-form-group">
		      <label for="doc-ta-1">文字描述</label>
		      <textarea class="" rows="5" id="description">${content.description}</textarea>
		    </div>
		    <div class="am-margin am-text-right">
		     	<button type="button" id="save_button" class="am-btn am-btn-primary am-btn-xs">保存</button>
			</div>
		</form>
		    <div class="am-form-group">
		    <label for="doc-ta-1">图片上传</label>
		    <a href="show_image.do?content_id=${content.id}">图片上传详细页面</a>
		    <ul class="am-avg-sm-2 am-avg-md-4 am-avg-lg-6 am-margin gallery-list">
	        	<c:forEach var="image" items="${image_list}" varStatus="s">
	        	<li id="upload_file_${image.id}">
		            <img class="am-img-thumbnail am-img-bdrs" width="200" src="${image.path}" alt=""/><br>
		            <a href="##" class="am-icon-btn am-icon-remove" onclick="remove(${image.id})"></a>
		        </li>
		        </c:forEach>
	        </ul>
	          	<div id="uploader" class="wu-example">
				    <!--用来存放文件信息-->
				    <div id="thelist" class="uploader-list"></div>
				    <div class="btns">
				        <div id="picker">选择图片</div>
				        <button id="ctlBtn" class="btn btn-default">开始上传</button>
				    </div>
				</div>
		    </div>
		    
		    <div class="am-form-group">
		    <label for="doc-ta-1">视频上传</label>
		    	<c:forEach var="video" items="${video_list}" varStatus="s">
		    	<li id="upload_file_${video.id}">
		            <a href="${video.path}">${video.file_name}</a>&nbsp;&nbsp;<a href="##" class="am-icon-remove" onclick="remove(${video.id})"></a>
		        </li>
		        </c:forEach>
	          	<div id="uploader_video" class="wu-example">
				    <!--用来存放文件信息-->
				    <div id="thelist_video" class="uploader-list"></div>
				    <div class="btns">
				        <div id="picker_video">选择视频</div>
				        <button id="ctlBtn_video" class="btn btn-default">开始上传</button>
				    </div>
				</div>
		    </div>

		    <label for="doc-ta-1">风险评估：</label>
		    <a href="show_word.do?content_id=${content.id}">自动评估</a>
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
<script type="text/javascript">
function remove(id){
	$.ajax({
		contentType:"application/json",
	    type : "get",
	    url : "<%=request.getContextPath()%>/delete_file.do?id="+id,
	    dataType: "json",
	    success : function(data) {
	        if(data.flag=="1"){
	            alert("删除成功！");
	            $("#upload_file_"+id).remove();
	        }
	        else{
	            alert("删除失败！");
	        }
	    },
	    error :function(){
	        alert("网络连接出错！");
	    }
	});
}
//删除图片事件
function remove(id){
	var saveData={"id":id};
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
	}

$(function(){ 
	var $list=$("#thelist");   //这几个初始化全局的百度文档上没说明，好蛋疼。  
	var $btn =$("#ctlBtn");   //开始上传
	state = 'pending';
	var uploader = WebUploader.create({
	
	    // swf文件路径
	    swf: 'assets/js/Uploader.swf',
	    
	    formData: {
	        file_type: 1,
	        content_id: '${content.id}'
	    },
	
	    // 文件接收服务端。
	    server: '<%=request.getContextPath()%>/upload_file.do',
	
	    // 选择文件的按钮。可选。
	    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
	    pick: '#picker',
	
	    // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
	    resize: false,
	    accept: {
	        title: 'Images',
	        extensions: 'jpg,jpeg,png',
	        mimeTypes: 'image/jpg,image/jpeg,image/png'
	    },
	    method:'POST'
	});
	
	//当有文件被添加进队列的时候
	uploader.on( 'fileQueued', function( file ) {
		$list.append( '<div id="' + file.id + '" class="item">' +
	        '<h4 class="info">' + file.name + '</h4>' +
	        '<p class="state">等待上传...</p>' +
	    '</div>' );
	});
	
	//文件上传过程中创建进度条实时显示。
	uploader.on( 'uploadProgress', function( file, percentage ) {
	    var $li = $( '#'+file.id ),
	        $percent = $li.find('.progress .progress-bar');
	
	    // 避免重复创建
	    if ( !$percent.length ) {
	        $percent = $('<div class="progress progress-striped active">' +
	          '<div class="progress-bar" role="progressbar" style="width: 0%">' +
	          '</div>' +
	        '</div>').appendTo( $li ).find('.progress-bar');
	    }
	
	    $li.find('p.state').text('上传中');
	
	    $percent.css( 'width', percentage * 100 + '%' );
	});
	
	uploader.on( 'uploadSuccess', function( file,response) {
	    $( '#'+file.id ).find('p.state').text('已上传');
	});
	
	uploader.on( 'uploadError', function( file ) {
	    $( '#'+file.id ).find('p.state').text('上传出错');
	});
	
	uploader.on( 'uploadComplete', function( file ) {
	    $( '#'+file.id ).find('.progress').fadeOut();
	});
	
	uploader.on( 'all', function( type ) {
        if ( type === 'startUpload' ) {
            state = 'uploading';
        } else if ( type === 'stopUpload' ) {
            state = 'paused';
        } else if ( type === 'uploadFinished' ) {
            state = 'done';
        }

        if ( state === 'uploading' ) {
            $btn.text('暂停上传');
        } else {
            $btn.text('开始上传');
        }
    });

    $btn.on( 'click', function() {
        if ( state === 'uploading' ) {
            uploader.stop();
        } else {
            uploader.upload();
        }
    });
    
    //----------------video----------------
     
	var $list_video=$("#thelist_video");   //这几个初始化全局的百度文档上没说明，好蛋疼。 
	var $btn_video =$("#ctlBtn_video");   //开始上传
    var uploader_video = WebUploader.create({
		
	    // swf文件路径
	    swf: 'assets/js/Uploader.swf',
	    formData: {
	        file_type: 3,
	        content_id: '${content.id}'
	    },
	
	    // 文件接收服务端。
	    server: '<%=request.getContextPath()%>/upload_file.do',
	
	    // 选择文件的按钮。可选。
	    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
	    pick: '#picker_video',
	
	    // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
	    resize: false,
	    accept: {
	        title: 'Videos',
	        extensions: 'mp4',
            mimeTypes: '.mp4'
	    },
	    method:'POST'
	});
  	//当有文件被添加进队列的时候
	uploader_video.on( 'fileQueued', function( file ) {
		$list_video.append( '<div id="' + file.id + '" class="item">' +
	        '<h4 class="info">' + file.name + '</h4>' +
	        '<p class="state">等待上传...</p>' +
	    '</div>' );
	});
    
  	//文件上传过程中创建进度条实时显示。
	uploader_video.on( 'uploadProgress', function( file, percentage ) {
	    var $li = $( '#'+file.id ),
	        $percent = $li.find('.progress .progress-bar');
	
	    // 避免重复创建
	    if ( !$percent.length ) {
	        $percent = $('<div class="progress progress-striped active">' +
	          '<div class="progress-bar" role="progressbar" style="width: 0%">' +
	          '</div>' +
	        '</div>').appendTo( $li ).find('.progress-bar');
	    }
	
	    $li.find('p.state').text('上传中');
	
	    $percent.css( 'width', percentage * 100 + '%' );
	});
	
	uploader_video.on( 'uploadSuccess', function( file,response) {
	    $( '#'+file.id ).find('p.state').text('已上传');
	});
	
	uploader_video.on( 'uploadError', function( file ) {
	    $( '#'+file.id ).find('p.state').text('上传出错');
	});
	
	uploader_video.on( 'uploadComplete', function( file ) {
	    $( '#'+file.id ).find('.progress').fadeOut();
	});
	
	uploader_video.on( 'all', function( type ) {
        if ( type === 'startUpload' ) {
            state = 'uploading';
        } else if ( type === 'stopUpload' ) {
            state = 'paused';
        } else if ( type === 'uploadFinished' ) {
            state = 'done';
        }

        if ( state === 'uploading' ) {
            $btn_file.text('暂停上传');
        } else {
            $btn_file.text('开始上传');
        }
    });

    $btn_video.on( 'click', function() {
        if ( state === 'uploading' ) {
            uploader_video.stop();
        } else {
            uploader_video.upload();
        }
    });
    
  	//保存按钮点击事件
	$("#save_button").click(function() {
		var saveData={"id":$("#id").val(),"description":$("#description").val()};
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
</script>
</body>
</html>