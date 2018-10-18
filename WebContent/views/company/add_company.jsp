<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">机构</strong> / <small>company</small></div>
  </div>
<form id="company_form" class="am-form" action="show_add_company.do" method="post">
<input type="hidden" name="id" id="id" value="0">
<input type="hidden" name="page_num" id="page_num" value="0">
  <div class="am-tabs am-margin" data-am-tabs>
    <ul class="am-tabs-nav am-nav am-nav-tabs">
      <li class="am-active"><a href="#tab1">基本信息</a></li>
    </ul>


    <div class="am-tabs-bd">
      <div class="am-tab-panel am-fade am-in am-active" id="tab1">
      
          <div class="am-g am-margin-top">
         
            <div class="am-u-sm-1 am-u-md-1 am-text-right">
              	机构名称
            </div>
            <div class="am-u-sm-2 am-u-md-2">
            	<input type="text" class="am-input-sm" name="name" id="name" value="${name}">
            </div>
            <div class="am-u-sm-1 am-u-md-1 am-text-right">
              	机构编号
            </div>
            <div class="am-u-sm-2 am-u-md-2">
            	<input type="text" class="am-input-sm" name="code" id="code" value="${code}">
            </div>
            <div class="am-u-sm-1 am-u-md-1 am-text-right">
              	级别编号
            </div>
            <div class="am-u-sm-2 am-u-md-2">
            	<input type="text" class="am-input-sm" name="level_code" id="level_code" value="${level_code}">
            </div>
            <div class="am-u-sm-1 am-u-md-1 am-text-right">
              	地址
            </div>
            <div class="am-u-sm-2 am-u-md-2">
              	<input type="text" class="am-input-sm" name="address" id="address" value="${address}">
            </div>
           	<div id="div_status">
									<div class="am-u-sm-2 am-u-md-2 am-text-right">状态</div>
									<div class="am-u-sm-3 am-u-md-3 am-text-right">
										<select class="selector1" id="status" name="status">
											<option value="">请选择状态</option>
											<option value="1">可用</option>
											<option value="0">禁用</option>
										</select>

									</div>
								</div>
          </div>
      </div>
      <div class="am-margin am-text-right">
      <button type="button" id="clear_button" class="am-btn am-btn-primary am-btn-xs">清空</button>
     	<button type="button" id="search_button" class="am-btn am-btn-primary am-btn-xs">查询</button>
	    <button type="button" id="save_button" class="am-btn am-btn-primary am-btn-xs">修改</button>
	    <button type="button" id="add_button" class="am-btn am-btn-primary am-btn-xs">新增</button>
	     <button type="button" id="delete_button" class="am-btn am-btn-primary am-btn-xs">删除</button>
	  </div>
    </div>
  </div>
</form>
  <div class="am-g">
      <div class="am-u-sm-12">
        <form class="am-form">
          <table id="clients_table" class="am-table am-table-striped am-table-hover table-main">
            <thead>
              <tr>
                <th class="table-title" width="20%">机构名称</th>
                <th class="table-title" width="20%">机构编号</th>
                <th class="table-title" width="20%">级别编号</th>
                <th class="table-title" width="30%">地址</th>
                <th class="table-title" width="10%">状态</th>
              </tr>
          </thead>
          <tbody>
          
          <c:forEach var="company" items="${companies}" varStatus="s">
            <tr class="tr_click" company_id="${company.id}">
              <td>${company.name}</td>
              <td>${company.code}</td>
              <td>${company.level_code}</td>
              <td>${company.address}</td>
              <td class="td1"><c:choose>
												<c:when test="${company.status==1}">  
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
	//页面初始化时默认新增机构，所以隐藏新增按钮
	$("#save_button").hide();//隐藏
	$("#delete_button").hide();
	$("#div_status").hide();
	//保存按钮点击事件
	$("#save_button").click(function() {
		var saveData={"id":$("#id").val(),"name":$("#name").val(),"code":$("#code").val(),"level_code":$("#level_code").val(),"address":$("#address").val()};
		$.ajax({
			contentType:"application/json",
		    type : "POST",
		    url : "<%=request.getContextPath()%>/add_company.do?status="+$("#status>option:selected").val()+"",
		    data : JSON.stringify(saveData),
		    dataType: "json",
		    success : function(data) {
		        if(data.flag=="1"){
		        	$("#clear_button").click();
	        		$("#company_form").submit();
		        	
		        	$("#id").val(data.id);
		        	//var t01 = $("#clients_table tr").length;
		        	//$("#clients_table tr:gt(0):eq(t01-1)").remove();
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
	 
	 //机构列表点击事件
	 $(".tr_click").click(function(){
		 $.ajax({
				contentType:"application/json",
			    type : "GET",
			    url : "<%=request.getContextPath()%>/get_company.do?id="+$(this).attr("company_id"),
			    dataType: "json",
			    success : function(data) {
			        if(data.flag=="1"){
			        	  if(data.company.status==1)
		            	   {
		            	   $("#status option[value='1']").attr("selected","selected");
		            	   $("#status option[value='0']").removeAttr("selected");
		            	   }
		               if(data.company.status==0)
		            	   {
		            	   $("#status option[value='0']").attr("selected","selected");
		            	   $("#status option[value='1']").removeAttr("selected");
		            	   }
			        	$("#name").val(data.company.name);
			        	$("#code").val(data.company.code);
			        	$("#level_code").val(data.company.level_code);
			        	$("#address").val(data.company.address);
			        	$("#id").val(data.company.id);
			        }
			        else{
			            alert("保存失败！");
			        }
			    },
			    error :function(){
			        alert("网络连接出错！");
			    }
			});
		 $(".tr_click").removeClass("am-active");
		 $(this).addClass("am-active");
         $("#save_button").show();//显示
         $("#delete_button").show();
         $("#div_status").show();
	 });
	 
	 //清空按钮点击事件
	 $("#clear_button").click(function(){
		 $(".tr_click").removeClass("am-active");
		 $("#id").val(0);
		 $('#company_form')[0].reset();
		 $("#name").val("");
		 $("#code").val('');
		 $("#level_code").val();
		 $("#address").val();
         $("#save_button").hide();//隐藏
	 });
	 //删除按钮
	  $("#delete_button").click(function(){
		 $.ajax({
				contentType:"application/json",
			    type : "GET",
			    url : "<%=request.getContextPath()%>/delete_company.do?id="+$("#id").val()+"",
			    dataType: "json",
			    success : function(data) {
			        if(data.flag=="1"){
			        	
			        	 $("#clear_button").click();
			        		$("#company_form").submit();
			        		alert("删除成功！");
			        }
			        else{
			            alert("删除失败！");
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
	//新增按钮点击事件
	 $("#add_button").click(function(){
		 $("#id").val(0);
		 $("#save_button").click();
		 $(".tr_click").removeClass("am-active");
	 });
	
	//查询按钮点击事件
	 $("#search_button").click(function(){
		 $("#company_form").submit();
	 });
});

function choose_page(i){
	$("#page_num").val(i);
	 $('#company_form')[0].reset();
	$("#company_form").submit();
}
</script>
</body>
</html>
