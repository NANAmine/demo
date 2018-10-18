<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title>登录 |login</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="format-detection" content="telephone=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="alternate icon" type="image/png" href="assets/i/favicon.png">
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <style>
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
}
  </style>
</head>
<body>
<div class="header">
  <div class="banner">

  </div>
</div>
<div class="am-g">
  <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">  
    <br>  
     <div id="error" class="${mes}" align="center"></div>
    <form action="dologin.do" method="post" class="am-form" id="loginForm">
    <input type="hidden" name="area" value="${area}">
      <label for="email">用户名:</label>
      <input type="text" name="name" id="name" value="">
      <br>
      <label for="password">密码:</label>
      <input type="password" name="password" id="password" value="">
      <br>
      
      <br />
      <div class="am-cf">
        <input type="submit" name="" value="登 录" class="am-btn am-btn-primary am-btn-sm am-fl">
      </div>
    </form>

    <hr>
    <p>© 2016 IFS, Inc. Licensed under MIT license.</p>
  </div>
</div>

	<script src="assets/js/jquery.min.js"></script>
	<!--<![endif]-->
	<script src="assets/js/amazeui.min.js"></script>
	<script src="assets/js/app.js"></script>
<script type="text/javascript">
  var mes=$("#error").attr("class");
  if(mes==1)
	  {
	  $("#error").html("<font color='red'>用户名错误</font>");
	  }
  else if(mes==2)
	  {
	  $("#error").html("<font color='red'>密码错误</font>");
	  }
</script>
</body>
</html>
