<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<html>
<head>
<title><decorator:title default="" />中保泰和订单管理系统</title>
<%@ include file="/static/common/meta.jsp"%>
<%@ include file="/static/common/taglibs.jsp"%>
<%@ include file="/static/common/meta_css.jsp"%>
<%@ include file="/static/common/meta_js.jsp"%>
<script type="text/javascript" src="${ctx}/layout/main.js"></script>
<decorator:head />
</head>
<body>
	<div class="wrapper">
		<!-- BEGIN TOP NAV -->
		<div class="top-navbar">
			<div class="top-navbar-inner">

				<!-- Begin Logo brand -->
				<div class="logo-brand">
					<a href="#" class="button-block button-rounded logo-button"><img
						src="${ctx}/static/images/ddgl.png"></a>
				</div>

				<div class="top-nav-content">
					<div class="btn-collapse-sidebar-left">
					</div>
					<ul class="nav-user navbar-right">
						<li>

							<div class="dropdown">
								<img src="${ctx}/static/images/avatar/account.jpg"
									class="ava-sidebar img-circle" alt="Avatar">
								<button class="btn btn-default dropdown-toggle" type="button"
									id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">
									${USER_SESSION.userCode} <span class="caret"></span>
								</button>
								<ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
									<li><a
										href="${pageContext.request.contextPath}/saaUserPower/logout.do">退出</a></li>
								</ul>
							</div>

						</li>
					</ul>
					<div class="collapse navbar-collapse" id="main-fixed-nav"></div>
				</div>
			</div>
		</div>

		<div class="box">
			<div class="sidebar-left sidebar-nicescroller" id="sidebar-left">
				<div class="float">

					<ul class="sidebar-menu" id="side-menu">
						<li><a href='${ctx}/contract/contractList.do'><i class='fa fa-sitemap fa-fw'></i>订单管理<i
								class='fa fa-fw'></i><span class='fa'></span></a></li>
						<c:if test="${USER_SESSION.postFlag == 1}">
						<li><a href='${ctx}/userMsg/modifyPwd.do'><i class='fa fa-sitemap fa-fw'></i>修改密码<i
								class='fa fa-fw'></i><span class='fa'></span></a></li>
						</c:if>
						<c:if test="${USER_SESSION.postFlag == 0}">
						<li><a href='${ctx}/organiz/prepareQuery.do'><i
								class='fa fa-sitemap fa-fw'></i>经销商管理<i class='fa fa-fw'></i><span
								class='fa'></span></a></li>
						<%-- <li><a href='${ctx}/user/prepareQuery.do'><i
								class='fa fa-sitemap fa-fw'></i>用户管理Demo<i class='fa fa-fw'></i><span
								class='fa'></span></a></li> --%>
						<li><a href='${ctx}/userMsg/userMsgList.do'><i
								class='fa fa-sitemap fa-fw'></i>用户管理<i class='fa fa-fw'></i><span
								class='fa'></span></a></li>
						</c:if>
					</ul>
				</div>
				<div class="btn-collapse-sidebar-left hiddenleft iconleft"
					id="btn-collapse-sidebar-left"></div>
			</div>
		</div>

		<div class="sidebar-right-heading">
			<ul class="nav nav-tabs square nav-justified">
				<li class="active"><a href="#notification-sidebar"
					data-toggle="tab"><i class="fa fa-bell"></i></a></li>
			</ul>
		</div>
		<!-- /.sidebar-right-heading -->
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

			<a id="back-top" href="#" data-action="backtop" class="back-top">
				<i class="fa  fa-angle-up"> </i>
			</a>
		</div>
		<!-- /.page-content -->
	</div>
	<!-- /.wrapper -->
</body>
</html>

