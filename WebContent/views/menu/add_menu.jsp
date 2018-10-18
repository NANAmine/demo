<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<link rel="apple-touch-icon-precomposed"
	href="assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="eosms for IFS" />
<link rel="stylesheet" href="assets/css/amazeui.min.css" />
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
		<jsp:include page="/manage_tree.do" flush="true" ></jsp:include>
		<!-- sidebar end -->

		<!-- content start -->
		<div class="admin-content">

			<div class="am-cf am-padding">
				<div class="am-fl am-cf">
					<strong class="am-text-primary am-text-lg">菜单</strong> / <small>menu</small>
				</div>
			</div>
			<form id="data_form" class="am-form" action="show_add_menu.do"
				method="post" data-am-validator>
				<input type="hidden" name="id" id="id" value="0"> <input
					type="hidden" name="page_num" id="page_num" value="0">
				<div class="am-tabs am-margin" data-am-tabs>
					<ul class="am-tabs-nav am-nav am-nav-tabs">
						<li class="am-active"><a href="#tab1">基本信息</a></li>
					</ul>


					<div class="am-tabs-bd">
						<div class="am-tab-panel am-fade am-in am-active" id="tab1">
							<div class="am-g am-margin-top">
								<div class="am-u-sm-1 am-u-lg-1 am-text-right">名称</div>
								<div class="am-u-sm-2 am-u-lg-2">
									<input type="text" class="am-input-sm" name="name" id="name"
										value="${name}">
								</div>
								<div class="am-u-sm-1 am-u-lg-1 am-text-right">编码</div>
								<div class="am-u-sm-2 am-u-lg-2">
									<input type="text" class="am-input-sm" name="code" id="code"
										value="${code}">
								</div>
								<div class="am-u-sm-1 am-u-lg-1 am-text-right">级别</div>
								<div class="am-u-sm-2 am-u-lg-2">
									<input type="number" min="2" max="5" class="am-input-sm"
										name="level" id="level" value="${level}">
								</div>
								<div class="am-u-sm-1 am-u-lg-1 am-text-right">顺序</div>
								<div class="am-u-sm-2 am-u-lg-2">
									<input type="number" min="1" max="99" class="am-input-sm"
										name="order" id="menu_order" value="${menu_order}">
								</div>
							</div>
							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-u-lg-1 am-text-right">路径</div>
								<div class="am-u-sm-6 am-u-lg-7">
									<input type="text" class="am-input-sm" name="url" id="url"
										value="${url}">
								</div>
								<div class="am-u-sm-2 am-u-lg-2 am-text-right">上级菜单</div>
								<div class="am-u-sm-2 am-u-lg-2">
									<select name="previous_id" id="previous_id" class="am-input-sm">
										<option value="">请选择</option>	
										
									</select>
								</div>
							</div>
						</div>
						<div class="am-margin am-text-right">
							<button type="button" id="search_button"
								class="am-btn am-btn-primary am-btn-xs">查询</button>
							<button type="button" id="save_button"
								class="am-btn am-btn-primary am-btn-xs">修改</button>
							<button type="button" id="add_button"
								class="am-btn am-btn-primary am-btn-xs">新增</button>
							<button type="button" id="clear_button"
								class="am-btn am-btn-primary am-btn-xs">清空</button>
						</div>
					</div>
				</div>
			</form>
			<div class="am-g">
				<div class="am-u-sm-12">
					<form class="am-form">
						<table id="data_table"
							class="am-table am-table-striped am-table-hover table-main">
							<thead>
								<tr>
									<th class="table-title" width="15%">名称</th>
									<th class="table-title" width="10%">编码</th>
									<th class="table-title" width="10%">级别</th>
									<th class="table-title" width="10%">序号</th>
									<th class="table-title" width="15%">上级菜单</th>
									<th class="table-title" width="40%">路径</th>
								</tr>
							</thead>
							<tbody id="data_tbody">
								<c:forEach var="menu" items="${menus}" varStatus="s">
									<tr class="tr_click" id="tr_${menu.id}" menu_id="${menu.id}">
										<td id="td_name_${menu.id}">${menu.name}</td>
										<td id="td_code_${menu.id}">${menu.code}</td>
										<td id="td_level_${menu.id}">${menu.level}</td>
										<td id="td_order_${menu.id}">${menu.menu_order}</td>
										<td id="td_previous_menu_${menu.id}">${menu.previous_menu.name}</td>
										<td id="td_url_${menu.id}">${menu.url}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="am-cf">
							共 <b id="pageCount">${page.allRow}</b> 条记录
							<div class="am-fr">
								<ul class="am-pagination">
									<c:choose>
										<c:when test="${page.currentPage==1}">
											<li class="am-disabled"><a href="#">«</a></li>
										</c:when>
										<c:when test="${page.currentPage!=1}">
											<li><a href="javascript:void(0)"
												onclick="choose_page(${page.currentPage-1})">«</a></li>
										</c:when>
									</c:choose>
									<c:forEach var="i" begin="1" end="${page.totalPage}" step="1">
										<c:choose>
											<c:when test="${page.currentPage==i}">
												<li class="am-active"><a href="javascript:void(0)"><c:out
															value="${i}" /></a></li>
											</c:when>
											<c:when test="${page.currentPage!=i}">
												<li><a href="javascript:void(0)"
													onclick="choose_page(${i})"><c:out value="${i}" /></a></li>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${page.currentPage==page.totalPage}">
											<li class="am-disabled"><a href="#">»</a></li>
										</c:when>
										<c:when test="${page.currentPage!=page.totalPage}">
											<li><a href="javascript:void(0)"
												onclick="choose_page(${page.currentPage+1})">»</a></li>
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

	<a href="#" class="am-show-sm-only admin-menu"
		data-am-offcanvas="{target: '#admin-offcanvas'}"> <span
		class="am-icon-btn am-icon-th-list"></span>
	</a>

	<jsp:include page="/manage_foot.do" flush="true" />

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
	var pageSize = ${pageSize};
	//保存按钮点击事件
	$("#save_button").click(function() {
		var saveData={"id":$("#id").val(),"name":$("#name").val(),"code":$("#code").val(),"url":$("#url").val(),"level":$("#level").val(),"menu_order":$("#menu_order").val(),"previous_id":parseInt($("#previous_id").val()),"status":1};
		$.ajax({
			contentType:"application/json",
		    type : "POST",
		    url : "<%=request.getContextPath()%>/add_menu.do",
		    data : JSON.stringify(saveData),
		    dataType: "json",
		    success : function(data) {
		        if(data.flag=="1"){
		        	$("#id").val(data.id);
		        	var talbe_length = $("#data_table tr").length;
		        	//$("#clients_table tr:gt(0):eq(t01-1)").remove();
		        	if ( $("#tr_"+data.id).length > 0 ) {
		        		$("#td_name_"+$("#id").val()).html($("#name").val());
			        	$("#td_code_"+$("#id").val()).html($("#code").val());
			        	$("#td_level_"+$("#id").val()).html($("#level").val());
			        	$("#td_order_"+$("#id").val()).html($("#menu_order").val());
			        	$("#td_url_"+$("#id").val()).html($("#url").val());
			        	$("#td_previous_menu_"+$("#id").val()).html($("#previous_id").find("option:selected").text());
		        	}
		        	else{
		        		if((talbe_length-1) == pageSize){
		        			$("#data_tbody tr").eq(-1).remove();
		        		} 
		        		$("#data_tbody").prepend('<tr class="tr_click" id="tr_'+data.id+'" menu_id="'+data.id+'">'+
		        		 							'<td id="td_name_'+data.id+'">'+$("#name").val()+'</td>'+
		        		 							'<td id="td_code_'+data.id+'">'+$("#code").val()+'</td>'+
		        		 							'<td id="td_level_'+data.id+'">'+$("#level").val()+'</td>'+
		        		 							'<td id="td_order_'+data.id+'">'+$("#menu_order").val()+'</td>'+
		        		 							'<td id="td_previous_menu_'+data.id+'">'+$("#previous_id").find("option:selected").text()+'</td>'+
		        		 							'<td id="td_url_'+data.id+'">'+$("#url").val()+'</td>'+
		        		 						 '</tr>');
		        		$("#pageCount").html(parseInt($("#pageCount").html())+1);
		        	}
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
	 
	 //菜单列表点击事件
	 $(".tr_click").click(function(){
		 if($(this).attr("menu_id") == 3){
			 alert("禁止修改根目录");
			 return;
		 }
		 $.ajax({
				contentType:"application/json",
			    type : "GET",
			    url : "<%=request.getContextPath()%>/get_menu.do?id="+$(this).attr("menu_id"),
			    dataType: "json",
			    success : function(data) {
			        if(data.flag=="1"){
			        	$("#name").val(data.menu.name);
			        	$("#code").val(data.menu.code);
			        	$("#level").val(data.menu.level);
			        	$("#menu_order").val(data.menu.menu_order);
			        	$("#url").val(data.menu.url);
			        	$("#id").val(data.menu.id);
			        	$("#previous_id").empty(); 
			        	$(data.menues).each(function(i){
			        		var m = data.menues[i];
			        		if(data.menu.previous_menu.id == m.id){
			        			$("#previous_id").append("<option value='" + m.id + "' selected>" + m.name + "</option>" );
			        		}
			        		else{
			        			$("#previous_id").append("<option value='" + m.id + "'>" + m.name + "</option>" );
			        		}
			        	});
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
	 });
	 
	 $("#level").change(function(){
		 $.ajax({
				contentType:"application/json",
			    type : "GET",
			    url : "<%=request.getContextPath()%>/get_previous_menu/"+$(this).val()+"/.do?",
			    dataType: "json",
			    success : function(data) {
			    	$("#previous_id").empty();
			    	$(data.menues).each(function(i){
		        		var m = data.menues[i];
		        		$("#previous_id").append("<option value='" + m.id + "'>" + m.name + "</option>" );
		        	});
			    },
			    error :function(){
			        alert("网络连接出错！");
			    }
			});
	 });
	 
	 //清空按钮点击事件
	 $("#clear_button").click(function(){
		 $(".tr_click").removeClass("am-active");
		 $("#id").val(0);
		 $('#data_form')[0].reset();
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
		 alert($("#province").val());
		 $("#data_form").submit();
	 });
});

function choose_page(i){
	$("#page_num").val(i);
	$("#data_form").submit();
}
</script>
</body>
</html>