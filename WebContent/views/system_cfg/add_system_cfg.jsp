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
		<jsp:include page="/manage_tree.do" flush="true"></jsp:include>
		<!-- sidebar end -->

		<!-- content start -->
		<div class="admin-content">

			<div class="am-cf am-padding">
				<div class="am-fl am-cf">
					<strong class="am-text-primary am-text-lg">系统配置</strong> / <small>system configuration</small>
				</div>
			</div>
			<form id="data_form" class="am-form" action="show_add_system_cfg.do"
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
								<div class="am-u-sm-4 am-u-lg-4">中文名称
									<input type="text" class="am-input-sm" name="cn_name" id="cn_name"
										value="${cn_name}">
								</div>
								<div class="am-u-sm-4 am-u-lg-4">英文名称
									<input type="text" class="am-input-sm" name="key" id="key"
										value="${en_name}">
								</div>
								<div class="am-u-sm-4 am-u-lg-4">值
									<input type="text" class="am-input-sm"
										name="value" id="value" value="${cfg_value}">
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
									<th class="table-title" width="33%">中文名称</th>
									<th class="table-title" width="33%">英文编码</th>
									<th class="table-title" width="33%">值</th>
								</tr>
							</thead>
							<tbody id="data_tbody">
								<c:forEach var="system_cfg" items="${system_cfgs}" varStatus="s">
									<tr class="tr_click" id="tr_${system_cfg.id}" system_cfg_id="${system_cfg.id}">
										<td id="td_cn_name_${system_cfg.id}">${system_cfg.cn_name}</td>
										<td id="td_key_${system_cfg.id}">${system_cfg.en_name}</td>
										<td id="td_value_${system_cfg.id}">${system_cfg.cfg_value}</td>
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
	var pageSize = ${page.pageSize};
	//保存按钮点击事件
	$("#save_button").click(function() {
		var saveData={"id":$("#id").val(),"cn_name":$("#cn_name").val(),"en_name":$("#key").val(),"cfg_value":$("#value").val()};
		
		$.ajax({
			contentType:"application/json",
		    type : "POST",
		    url : "<%=request.getContextPath()%>/add_system_cfg.do",
		    data : JSON.stringify(saveData),
		    dataType: "json",
		    success : function(data) {
		        if(data.flag=="1"){
		        	$("#id").val(data.id);
		        	var talbe_length = $("#data_table tr").length;
		        	//$("#clients_table tr:gt(0):eq(t01-1)").remove();
		        	if ( $("#tr_"+data.id).length > 0 ) {
		        		$("#td_cn_name_"+$("#id").val()).html($("#cn_name").val());
			        	$("#td_key_"+$("#id").val()).html($("#key").val());
			        	$("#td_value_"+$("#id").val()).html($("#value").val());
			        }
		        	else{
		        		if((talbe_length-1) == pageSize){
		        			$("#data_tbody tr").eq(-1).remove();
		        		} 
		        		$("#data_tbody").prepend('<tr class="tr_click" id="tr_'+data.id+'" system_cfg_id="'+data.id+'">'+
		        		 							'<td id="td_cn_name_'+data.id+'">'+$("#cn_name").val()+'</td>'+
		        		 							'<td id="td_key_'+data.id+'">'+$("#key").val()+'</td>'+
		        		 							'<td id="td_value_'+data.id+'">'+$("#value").val()+'</td>'+
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
		 $.ajax({
				contentType:"application/json",
			    type : "GET",
			    url : "<%=request.getContextPath()%>/get_system_cfg.do?id="+$(this).attr("system_cfg_id"),
			    dataType: "json",
			    success : function(data) {
			        if(data.flag=="1"){
			        	$("#cn_name").val(data.system_cfg.cn_name);
			        	$("#key").val(data.system_cfg.en_name);
			        	$("#value").val(data.system_cfg.cfg_value);
			        	$("#id").val(data.system_cfg.id);
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