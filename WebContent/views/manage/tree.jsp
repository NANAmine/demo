<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
	<div class="am-offcanvas-bar admin-offcanvas-bar">
		<ul class="am-list admin-sidebar-list">
			<li class="admin-parent">
				<a class="am-cf" data-am-collapse="{target: '#collapse-nav1'}"><span class="am-icon-bars"></span>系统管理<span class="am-icon-angle-right am-fr am-margin-right"></span></a>
				<ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav1">
					<li><a href="show_add_source.do" class="am-cf"><span class="am-icon-pencil-square"></span> 风险源管理</a>
					<li><a href="show_add_point.do" class="am-cf"><span class="am-icon-tasks"></span> 风险点管理</a>
					<li><a href="show_keyword_list.do" class="am-cf"><span class="am-icon-tasks"></span> 关键词管理</a>
					<li><a href="show_setup.do" class="am-cf"><span class="am-icon-tasks"></span> 视频抓取设置</a>
					<li><a href="show_netdata_list.do" class="am-cf"><span class="am-icon-pencil-square"></span> 网络数据管理</a>
					<li><a href="show_point_list.do?type=1" class="am-cf"><span class="am-icon-users"></span> 材料录入</a>
<!-- 					<li><a href="show_video.do" class="am-cf"><span class="am-icon-users"></span> 视频材料</a>
					<li><a href="show_image.do" class="am-cf"><span class="am-icon-users"></span> 图片材料</a>
					<li><a href="show_word.do" class="am-cf"><span class="am-icon-users"></span> 自动分析</a> -->
					<li><a href="show_point_list.do?type=2" class="am-cf"><span class="am-icon-institution"></span> 人工复核</a></li>
				</ul>
			</li>
			<li><a href="manage_exit.do"><span class="am-icon-sign-out"></span> 注销</a></li>
		</ul>
	
	<div class="am-panel am-panel-default admin-sidebar-panel">
      <div class="am-panel-bd">
        <p><span class="am-icon-bookmark"></span> 公告</p>
        <p>暂无公告</p>
      </div>
    </div>
    
	</div>
</div>