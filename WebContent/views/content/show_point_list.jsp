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
  	<c:if test="${type == 1}">
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">材料录入</strong> / <small>insert</small></div>
   	</c:if>
   	<c:if test="${type == 2}">
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">风险评估</strong> / <small>grade</small></div>
   	</c:if>
  </div>
<form id="data_form" class="am-form" action="show_point_list.do" method="post">
<input type="hidden" name="type" id="type" value="${type}">
  <div class="am-tabs am-margin" data-am-tabs>
    <ul class="am-tabs-nav am-nav am-nav-tabs">
      <li class="am-active"><a href="#tab1">基本信息</a></li>
    </ul>


    <div class="am-tabs-bd">
      <div class="am-tab-panel am-fade am-in am-active" id="tab1">
      
          <div class="am-g am-margin-top">
         
            <div class="am-u-sm-1 am-u-md-1 am-text-right">
              	国家：
            </div>
            <div class="am-u-sm-2 am-u-md-2 am-text-left">
            	<select id="country">
            		<option value="7">South Sudan</option>
            	</select>
            </div>
            <div class="am-u-sm-1 am-u-md-1 am-text-right">
              	省/州：
            </div>
            <div class="am-u-sm-3 am-u-md-3 am-text-left">
            	<select id="province_id" name="province_id">
            		<option value="0">请选择</option>
            		<c:forEach var="province" items="${provinces}" varStatus="s">
            			<c:choose>
            			<c:when test="${province_id==province.id}">  
							<option value="${province.id}" selected>${province.en_name}</option>   
						</c:when>
						<c:otherwise> 
							<option value="${province.id}">${province.en_name}</option>
				    	</c:otherwise>
				    	</c:choose>
            		</c:forEach>
            	</select>
            </div>
            <div class="am-u-sm-1 am-u-md-1 am-text-right">
              	风险源：
            </div>
            <div class="am-u-sm-4 am-u-md-4">
            	<select id="source_id" name="source_id" class="am-fr">
            		<option value="0">请选择</option>
            		<c:forEach var="source" items="${sources}" varStatus="s">
            			<c:choose>
            			<c:when test="${source_id==source.id}">  
							<option value="${source.id}" selected>${source.name}</option>   
						</c:when>
						<c:otherwise> 
							<option value="${source.id}">${source.name}</option>
				    	</c:otherwise>
				    	</c:choose>
            		</c:forEach>
            	</select>
            </div>
          </div>
      </div>
      <div class="am-margin am-text-right">
     	<button type="button" id="search_button" class="am-btn am-btn-primary am-btn-xs">查询</button>
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
                <th class="table-title am-text-center" width="70%">监测点</th>
                <th class="table-title" width="15%">权重</th>
                <th class="table-title" width="15%">操作</th>
              </tr>
          </thead>
          <tbody>
          
          <c:forEach var="point" items="${points}" varStatus="s">
            <tr class="tr_click" select_id="${point.id}">
              <td>${point.name}</td>
              <td>${point.weight}</td>
              <c:if test="${type == 1}">
              <td><a href="show_add_content.do?point_id=${point.id}&province_id=${province_id}">录入</a></td>
              </c:if>
              <c:if test="${type == 2}">
              <td><a href="show_grade_content.do?point_id=${point.id}&province_id=${province_id}">评分</a></td>
              </c:if>
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
	//查询按钮点击事件
	 $("#search_button").click(function(){
		 if($("#province_id").val()==0){
			 alert("请选择省/州");
			 return;
		 }
		 $("#data_form").submit();
	 });
});

function choose_page(i){
	$("#page_num").val(i);
	$('#data_form')[0].reset();
	$("#data_form").submit();
}
</script>
</body>
</html>