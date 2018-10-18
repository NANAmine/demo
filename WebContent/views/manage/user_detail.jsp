<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Amaze UI Admin user Examples</title>
  <meta name="description" content="这是一个 user 页面">
  <meta name="keywords" content="user">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->

	<jsp:include page="/manage_header.do" flush="true" />

<div class="am-cf admin-main">
  <!-- sidebar start -->
	<jsp:include page="/manage_tree.do" flush="true" ><jsp:param name="user_id" value="${user.id}"/></jsp:include>
  <!-- sidebar end -->

  <!-- content start -->
  <div class="admin-content">

     <div class="am-cf am-padding">
				<div class="am-fl am-cf">
					<strong class="am-text-primary am-text-lg">个人资料</strong> / <small>adminuser_detail</small>
				</div>
			</div>
      <hr/>

      
          <form class="am-form am-form-horizontal" action="update_adminuser.do" method="post">
          <input type="hidden" id="id" name="id" value="${user.id }"/>
            <div class="am-form-group">
              <label for="user-name" class="am-u-sm-3 am-form-label">姓名 / Name</label>
              <div class="am-u-sm-9">
                <input type="text" id="name" name="name" placeholder="姓名 / Name" value="${user.name}">
              </div>
            </div>

            <div class="am-form-group">
          
              <label for="user-phone" class="am-u-sm-3 am-form-label">电话 / Telephone</label>
              
              <div class="am-u-sm-9">
                <input type="tel" id="phone" name="phone" placeholder="输入你的电话号码 / Telephone" value="${user.phone }">
                <small>使用手机号登录</small>
              </div>
            </div>
            <hr>
             <div class="am-form-group">
              <div class="am-u-sm-10 am-u-sm-push-2">
             <a  id="pwdbutton">修改密码</a>
            </div>
             </div>
             <div class="am-form-group" id="update_pwd">
             
            
               <div class="am-form-group">
                 <label for="user-pwd" class="am-u-sm-3 am-form-label"></label>
                <div class="am-u-sm-9">
                <input type="password" id="oldpwd" name="oldpwd" placeholder="输入当前密码"><div id="checkoldpwd"></div>
                </div>
                </div>
                 <div class="am-form-group">
                   <label for="user-pwd" class="am-u-sm-3 am-form-label"></label>
                 <div class="am-u-sm-9">
                <input type="password" id="newpwd" name="newpwd" placeholder="输入新密码">
                </div>
                </div>
                 <div class="am-form-group">
                   <label for="user-pwd" class="am-u-sm-3 am-form-label"></label>
                <div class="am-u-sm-9">
                <input type="password" id="esurepwd" name="esurepwd" placeholder="确认密码与新密码一致">  <div id="check"></div>
               
                </div>
     
              </div>
            </div>
            <div class="am-form-group">
              <div class="am-u-sm-9 am-u-sm-push-3">
                <button type="button" class="am-btn am-btn-primary" id="update_button">更新</button>
              </div>
            </div>
          </form>
    

  </div>
  <!-- content end -->

</div>

<a href="#" class="am-show-sm-only admin-menu"
		data-am-offcanvas="{target: '#admin-offcanvas'}"> <span
		class="am-icon-btn am-icon-th-list"></span>
	</a>

	<jsp:include page="/manage_foot.do" flush="true" />


<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="assets/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="assets/js/amazeui.min.js">
</script>

<script src="assets/js/app.js"></script>
<script type="text/javascript">
$(function() {	
	$("#update_pwd").hide();
   $("#pwdbutton").click(function(){
	   $("#update_pwd").show();
   });
   $("#update_button").click(function(){
	   if($("#newpwd").val()==$("#esurepwd").val())
		   {
	   var saveData={"id":$("#id").val(),"name":$("#name").val(),"phone":$("#phone").val(),"status":1};
		
		$.ajax({
			contentType:"application/json",
		    type : "POST",
		    url : "<%=request.getContextPath()%>/update_adminuser.do?password="+$("#newpwd").val()+"&oldpwd="+$("#oldpwd").val()+"",
		    data : JSON.stringify(saveData),
		    dataType: "json",
		    success : function(data) {
		        if(data.flag=="1"){
		        	 location.href="<%=request.getContextPath()%>/manage_user_detail.do?user_id="+$("#id").val()+"";
		            alert("修改成功！");
		        }
		        else if(data.flog=="3"){
		         $("#checkoldpwd").html("<font color='red'>输入的密码不正确</font>")
		        } else {
		            alert("修改失败！");
		        }
		    },
		    error :function(){
		        alert("网络连接出错！");
		    }
		}); 
		   }else{
			   $("#check").html("<font color='red'>确认密码与新密码不一致</font>")
		   }
   });
});
</script>
</body>
</html>
