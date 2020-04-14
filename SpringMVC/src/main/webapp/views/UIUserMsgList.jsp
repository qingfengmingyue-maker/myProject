<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/static/common/taglibs.jsp"%>
<head>
<style>
th {
white-space: nowrap; 
}
.table>thead>tr>th { text-align: center;}
.center { text-align: center;}
</style>
<title>用户信息展示页面</title>
<script type="text/javascript"	src="${ctx}/static/common/js/common.js"></script>
<script type="text/javascript"	src="${ctx}/views/js/UIUserMsgList.js"></script>
</head>
<body>
<div class="row">
		   <div class="col-lg-12">
		    <div class="panel-body">
			<div style="text-align: left;">
				<button class="btn btn-primary  glyphicon glyphicon-plus"
					id="add" type="button"  onclick="window.location.href='${ctx}/userMsg/createUserMsg.do'">新增</button>
				<button class="btn btn-primary glyphicon glyphicon-pencil"
					id="edit" type="button" >修改</button>
				<button class="btn btn-primary glyphicon glyphicon-remove" id="remove"
					type="button">删除</button>
			    	<button class="btn btn-primary glyphicon glyphicon-eye-open" id="view"
					type="button">浏览</button>
			  </div>
			</div>
		  </div>
	</div>
	<div class="panel-group" id="accordion">
		<div class="col-lg-12">
			<div class="panel panel-info" id="showTitle"  >
				<div id="collapseTwo" class="panel-collapse" >
				  <form id="fm" class="form-horizontal" role="form">
					<div class="panel-body" >
					 	<div class="row">
							<div class="col-lg-3 col-md-3 col-xs-3">
								<div class="row form-group">
									<div class="col-xs-4" align="left">
										<label for="userName" class="control-label">用户名称</label>
									</div>
									<div class="col-xs-8">
										<input id="userName"
											name="userName" class="form-control" />
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 col-xs-3">
								<div class="row form-group">
									<div class="col-xs-4" align="left">
										<label for="userCode" class="control-label">用户代码</label>
									</div>
									<div class="col-xs-8">
										<input id="userCode"
											name="userCode" class="form-control" />
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 col-xs-3">
								<div class="row form-group">
									<div class="col-xs-4" align="left">
										<label for="telPhone" class="control-label">手机号</label>
									</div>
									<div class="col-xs-8">
										<input id="telPhone"
											name="telPhone" class="form-control" />
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 col-xs-3">
								<div class="row form-group">
									<div class="col-xs-3" align="left"></div>
									<div class="col-xs-8">
										<button class="btn btn-primary btn-outline btn-search" id="search" type="button" >查询</button>
									</div>
								</div>
							</div>		
						</div>
						<div class="table-responsive" >
							<table   class="table table-striped table-bordered table-sort" 
								id="information" a>
								<thead>
									<tr align="center">
										<th><input id="checkAll"  type="checkbox" ></th>
										<th>经销商代码</th>
										<th>经销商名称</th>
										<th>用户名称</th>
										<th>用户代码</th>
										<th>手机号</th>
										<th>职务</th>
									</tr>
								 </thead>
								<tbody>									
								</tbody>
							</table>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>