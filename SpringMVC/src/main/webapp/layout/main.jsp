<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<html>
	<head>
		<title><decorator:title default="" /> 订单管理系统 </title>
		<%@ include file="/static/common/meta.jsp"%>
		<%@ include file="/static/common/taglibs.jsp"%>
		<%@ include file="/static/common/meta_css.jsp"%>
		<%@ include file="/static/common/meta_js.jsp"%>
		<%-- 被装饰页面的head --%>
		<script type="text/javascript" src="${ctx}/layout/main.js"></script>
		<decorator:head />
	</head>
	<body>

		<!--
		===========================================================
		BEGIN PAGE
		===========================================================
		-->
		<div class="wrapper">
			<!-- BEGIN TOP NAV -->
			<div class="top-navbar">
				<div class="top-navbar-inner">
					
					<!-- Begin Logo brand -->
					<div class="logo-brand">
						<a href="#" class="button-block button-rounded logo-button"><img src="${ctx}/static/images/ddgl.png"></a>						
					</div><!-- /.logo-brand -->
					<!-- End Logo brand -->
					<!-- Begin Logo brand  
					<div class="logo-brand">
						
					</div><!-- /.logo-brand
					<!-- End Logo brand -->
					
					<div class="top-nav-content">
						
						
						<!-- Begin button sidebar left toggle -->
						<div class="btn-collapse-sidebar-left">
							<!-- <i class="fa fa-long-arrow-right icon-dinamic"></i> -->
						</div><!-- /.btn-collapse-sidebar-left -->
						<!-- End button sidebar left toggle -->
						
						<!-- Begin button sidebar right toggle -->
						<!-- <div class="btn-collapse-sidebar-right">
							<i class="fa fa-bullhorn"></i>
							<span class="badge badge-danger icon-count">0</span>
							<i class="fa fa-envelope"></i>
						</div> --><!-- /.btn-collapse-sidebar-right -->
						<!-- End button sidebar right toggle -->
						
						<!-- Begin button nav toggle 
						<div class="btn-collapse-nav" data-toggle="collapse" data-target="#main-fixed-nav">
							<i class="fa fa-plus icon-plus"></i>
						</div><!-- /.btn-collapse-sidebar-right -->
						<!-- End button nav toggle -->
						
						<!-- Begin user session nav -->
						<ul class="nav-user navbar-right">
							<li class="dropdown">
							   <a data-toggle="dropdown" href="#" class="button button-block button-rounded">
								<img src="${ctx}/static/images/avatar/account.jpg" class="ava-sidebar img-circle" alt="Avatar">&nbsp;&nbsp;&nbsp;&nbsp;${USER_SESSION.userName}
								<i class="fa fa-caret-down fa-fw"></i>
							   </a> 
							  <ul class="dropdown-menu square primary margin-list-rounded with-triangle">
								<li><a href="${pageContext.request.contextPath}/saaUserPower/logout.do">退出</a></li>
							  </ul>
							</li>
						</ul>
						<div class="collapse navbar-collapse" id="main-fixed-nav">	</div>
					</div>
				</div>
			</div>
	
			<div class="box">
				<div class="sidebar-left sidebar-nicescroller" id="sidebar-left">
					<div class="float">
						
						<ul class="sidebar-menu" id="side-menu">
						  <li><a href='#'><i class='fa fa-sitemap fa-fw'></i>订单管理<i class='fa fa-fw'></i><span class='fa'></span></a></li>
						  <li><a href='${ctx}/organiz/prepareQuery.do'><i class='fa fa-sitemap fa-fw'></i>机构管理<i class='fa fa-fw'></i><span class='fa'></span></a></li>
						  <li><a href='${ctx}/user/prepareQuery.do'><i class='fa fa-sitemap fa-fw'></i>用户管理<i class='fa fa-fw'></i><span class='fa'></span></a></li>
						</ul>
				    </div>
				    <div class="btn-collapse-sidebar-left hiddenleft iconleft" id="btn-collapse-sidebar-left" ></div>
				</div>
			</div>
			
			<div class="sidebar-right-heading">
				<ul class="nav nav-tabs square nav-justified">
				  <li class="active"><a href="#notification-sidebar" data-toggle="tab"><i class="fa fa-bell"></i></a></li>
				  <li><!-- <a href="#online-user-sidebar" data-toggle="tab"><i class="fa fa-comments"></i></a> --></li>				 
				  <li><!-- <a href="#task-sidebar" data-toggle="tab"><i class="fa fa-tasks"></i></a> --></li>
				  <li><!-- <a href="#setting-sidebar" data-toggle="tab"><i class="fa fa-cogs"></i></a> --></li>
				</ul>
			</div><!-- /.sidebar-right-heading -->
			<!-- END SIDEBAR RIGHT HEADING -->
			<!-- BEGIN PAGE CONTENT -->
			<div class="page-content">
				<div class="row">
					<div class="col-lg-12">
						<br />
						<ol class="breadcrumb">
						</ol>
					</div>
				</div>
				<decorator:body />
				
				<a id="back-top" href="#" data-action="backtop" class="back-top"> <i class="fa  fa-angle-up"> </i> </a>
			</div><!-- /.page-content -->
		</div><!-- /.wrapper -->
		<!-- END PAGE CONTENT -->
		<div id="ajax-pwdModifyModal" class="modal fade" role="dialog"	tabindex="-1" style="display: none;"></div> 
		<div id="ajax-lockScreenModal" class="modal fade" role="dialog"	tabindex="-1" style="display: none;" ></div>       
		<div id="ajax-versionModal"  class="modal fade" role="dialog" tabindex="-1" style="display:none;"></div>
	</body>
</html>