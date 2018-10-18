<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>lagou manage</title>
  <meta name="description" content="拉勾数据">
  <meta name="keywords" content="二手房 房产经济 房企 开发商 拉勾数据 IFS">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="eosms for IFS" />
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
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
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">角色</strong> / <small>role</small></div>
  </div>
<form id="date_form" class="am-form" action="show_add_role.do" method="post" data-am-validator>
<input type="hidden" name="id" id="id" value="0">
<input type="hidden" name="page_num" id="page_num" value="0">
<input type="hidden" name="menus_id" id="menus_id" value="0">
  <div class="am-tabs am-margin" data-am-tabs>
    <ul class="am-tabs-nav am-nav am-nav-tabs">
      <li class="am-active"><a href="#tab1">基本信息</a></li>
    </ul>


    <div class="am-tabs-bd">
      <div class="am-tab-panel am-fade am-in am-active" id="tab1">
          <div class="am-g am-margin-top">
            <div class="am-u-sm-2 am-u-lg-2 am-text-right">
              	角色名称
            </div>
            <div class="am-u-sm-2 am-u-lg-2">
            	<input type="text" class="am-input-sm" name="name" id="name" value="${name}">
            </div>
            <div class="am-u-sm-2 am-u-lg-2 am-text-right">
              	编码
            </div>
            <div class="am-u-sm-2 am-u-lg-2">
            	<input type="text" class="am-input-sm" name="code" id="code" value="${code}">
            </div>
            	<div id="div_status">
									<div class="am-u-sm-2 am-u-md-2 am-text-right">状态</div>
									<div class="am-u-sm-2 am-u-md-2 am-text-right">
										<select class="selector1" id="status" name="status">
											<option value="">请选择状态</option>
											<option value="1">可用</option>
											<option value="0">禁用</option>
										</select>

									</div>
								</div>
          </div>
          <br>
          <c:set var="sm_width"/>
          <c:forEach var="menus" items="${all_m}" varStatus="s">
			<c:if test="${(s.index+1)%4==1}">
			  <div class="am-g">
			</c:if>
			<c:set var="sm_width" value="3"/>
			<c:if test="${fn:length(all_m) == s.index+1}">
          	  	<c:remove var="sm_width"/>
          	  	<c:set var="sm_width" value="${(5-(s.index+1)%4)*3}"/>
          	</c:if>
			  	<div class="am-u-sm-${sm_width}">
			 		<c:forEach var="menu" items="${menus}" varStatus="i">
			 		
			 		<c:if test="${i.index == 0}">
				 		<c:if test="${fn:length(menus) == 1}">
				 			<label class="am-checkbox">
					      		<input type="checkbox" name="menu_id" id="checkbox_${menu.id}" value="${menu.id}" data-am-ucheck><b>${menu.name}</b>
					    </label>
				 		</c:if>
				 		<c:if test="${fn:length(menus) > 1}">
				 			<label class="am-checkbox">
					      	<b>${menu.name}</b>
					    	</label>
				 		</c:if>
					</c:if>
					
					<c:if test="${i.index > 0}">
					    <label class="am-checkbox">
				      		&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="menu_id" id="checkbox_${menu.id}" value="${menu.id}" data-am-ucheck> ${menu.name}
				    	</label>
					</c:if>
			    </c:forEach>
			  	</div>
			 <c:if test="${(s.index+1)%4==0 || fn:length(all_m)==s.index+1}">
				</div>
       		</c:if>
		</c:forEach>
		</div>
		</div>
      <div class="am-margin am-text-right">
       <button type="button" id="clear_button" class="am-btn am-btn-primary am-btn-xs">清空</button>
     	<button type="button" id="search_button" class="am-btn am-btn-primary am-btn-xs">查询</button>
	    <button type="button" id="save_button" class="am-btn am-btn-primary am-btn-xs">修改</button>
	    <button type="button" id="add_button" class="am-btn am-btn-primary am-btn-xs">新增</button>
	    <button type="button" id="delete_button" class="am-btn am-btn-primary am-btn-xs">删除</button>
	   </div>
</form>
  <div class="am-g">
      <div class="am-u-sm-12">
        <form class="am-form">
          <table id="clients_table" class="am-table am-table-striped am-table-hover table-main">
            <thead>
              <tr>
                <th class="table-title" width="40%">名称</th>
                <th class="table-title" width="30%">编码</th>
                <th class="table-title" width="30%">状态</th>
              </tr>
          </thead>
          <tbody>
          
          <c:forEach var="role" items="${roles}" varStatus="s">
            <tr class="tr_click" role_id="${role.id}">
              <td>${role.name}</td>
              <td>${role.code}</td>
              <td class="td1">
              	<c:choose>
					<c:when test="${role.status==1}">  
         				  可用     
   					</c:when>
					<c:otherwise> 
						   禁用 
  					</c:otherwise>
					</c:choose>
			</td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
          <div class="am-cf">
  共 ${page.allRow} 条记录
  <div class="am-fr">
    <ul class="am-pagination">
      <c:choose>
      <c:when test="${page.currentPage==1}">
      <li class="am-disabled"><a href="#">«</a></li>
      </c:when>
      <c:when test="${page.currentPage!=1}">
      <li><a href="javascript:void(0)" onclick="choose_page(${page.currentPage-1})">«</a></li>
      </c:when>
      </c:choose>
      <c:forEach var="i" begin="1" end="${page.totalPage}" step="1">
      <c:choose>
      <c:when test="${page.currentPage==i}">
      <li class="am-active"><a href="javascript:void(0)"><c:out value="${i}"/></a></li>
      </c:when>
      <c:when test="${page.currentPage!=i}">
      <li><a href="javascript:void(0)" onclick="choose_page(${i})"><c:out value="${i}"/></a></li>
      </c:when>
      </c:choose>
      </c:forEach>
      <c:choose>
      <c:when test="${page.currentPage==page.totalPage}">
      <li class="am-disabled"><a href="#">»</a></li>
      </c:when>
      <c:when test="${page.currentPage!=page.totalPage}">
      <li><a href="javascript:void(0)" onclick="choose_page(${page.currentPage+1})">»</a></li>
      </c:when>
      </c:choose>
    </ul>
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
<script type="text/javascript">

$(function() {	
	//页面初始化时默认新增菜单，所以隐藏新增按钮
	$("#save_button").hide();//隐藏
	$("#div_status").hide();
	//保存按钮点击事件
	$("#save_button").click(function() {
		var saveData={"id":$("#id").val(),"name":$("#name").val(),"code":$("#code").val()};
		var menus_id = "";
		$("input[name='menu_id']:checked").each(function(index){
			if(index == $("input[name='menu_id']:checked").length-1){
				menus_id+=$(this).val();
			}
			else{
				menus_id+=$(this).val()+"_";
			}
		             
		});
		if($("input[name='menu_id']:checked").length==0){
			menus_id="0";
		}
		alert($("#id").val());
		alert(menus_id);
		$.ajax({
			contentType:"application/json",
		    type : "POST",
		    url : "<%=request.getContextPath()%>/add_role/" + menus_id + "/.do?status="+$("#status>option:selected").val()+"",
		    data : JSON.stringify(saveData),
		    dataType: "json",
		    success : function(data) {
		        if(data.flag=="1"){
		        
		        	//var t01 = $("#clients_table tr").length;
		        	//$("#clients_table tr:gt(0):eq(t01-1)").remove();
		            alert("保存成功！");
		        }
		        else{
		            alert("保存失败！");
		           
		        }
		        $('#date_form')[0].reset();
		   		 $("#status").val('');
		   		$("#id").val(data.id);
		   		$("#date_form").submit();
		        
		    },
		    error :function(){
		        alert("网络连接出错！");
		    }
		});
	});
	 
	 //菜单列表点击事件
	 $(".tr_click").click(function(){
		 alert($(this).attr("role_id"))
		 $.ajax({
				contentType:"application/json",
			    type : "GET",
			    url : "<%=request.getContextPath()%>/get_role/"+$(this).attr("role_id")+"/.do",
			    dataType: "json",
			    success : function(data) {
			        if(data.flag=="1"){
			        	var status=data.role.status;
			        	$("#id").val(data.role.id);
			        	$("#name").val(data.role.name);
			        	$("#code").val(data.role.code);
			        	$("input[name='menu_id']").uCheck('uncheck');
			        	$(data.menus).each(function(i){
			        		var m = data.menus[i];
			        		$("#checkbox_"+m.id).uCheck('check');
			        	});
			            if(status==1)
		            	   {
		            	   $("#status option[value='1']").attr("selected","selected");
		            	   $("#status option[value='0']").removeAttr("selected");
		            	   }
		               if(status==0)
		            	   {
		            	   $("#status option[value='0']").attr("selected","selected");
		            	   $("#status option[value='1']").removeAttr("selected");
		            	   }
			        }
			        else{
			            alert("获取菜单失败！");
			        }
			    },
			    error :function(){
			        alert("网络连接出错！");
			    }
			});
		 $(".tr_click").removeClass("am-active");
		 $(this).addClass("am-active");
         $("#save_button").show();//显示
         $("#div_status").show();
	 });
	 //删除
	 $("#delete_button").click(function(){
		 $.ajax({
				contentType:"application/json",
			    type : "GET",
			    url : "<%=request.getContextPath()%>/delete_role/"+$("#id").val()+"/.do",
			    dataType: "json",
			    success : function(data) {
			        if(data.flag=="1"){
			        	 alert("删除成功！");
			        }
			        else{
			            alert("删除失败！");
			        }
			        $('#date_form')[0].reset();
					 $("#status").val('');
					 $("#date_form").submit();
			    },
			    error :function(){
			        alert("网络连接出错！");
			    }
			});
		 $(".tr_click").removeClass("am-active");
		 $(this).addClass("am-active");
         $("#save_button").show();//显示
	 });
	 //清空按钮点击事件
	 $("#clear_button").click(function(){
		 $(".tr_click").removeClass("am-active");
		 $("#id").val(0);
		 $('#date_form')[0].reset();
		 $("#status").val('');
		 $("#div_status").hide();
         $("#save_button").hide();//隐藏
	 });
	 
	//新增按钮点击事件
	 $("#add_button").click(function(){
		 $("#id").val(0);
		 $("#save_button").click();
		 
		 $(".tr_click").removeClass("am-active");
	 });
	
	//查询按钮点击事件
	 $("#search_button").click(function(){
		 $("#date_form").submit();
	 });
});

function choose_page(i){
	$("#page_num").val(i);
	 $('#date_form')[0].reset();
	 $("#status").val('');
	$("#date_form").submit();
}
</script>
</body>
</html>