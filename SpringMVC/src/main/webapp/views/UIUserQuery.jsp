<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/static/common/taglibs.jsp"%>
<head>
<style>
th {
white-space: nowrap; 
}
</style>
<title>用户查询页面</title>
<script type="text/javascript"	src="${ctx}/views/js/UIUserQuery.js"></script>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<!-- style="position:absolute;" -->
			<form id="fm" class="form-horizontal" role="form">
				<div class="panel-group" id="accordion">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseOne">请输入查询条件</a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in">
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-6 col-md-6 col-xs-6">
										<div class="row form-group">
											<div class="col-xs-3" align="right">
												<label for="projectVo.projectCode" class="control-label">用户名称</label>
											</div>
											<div class="col-xs-8">
												<input id="userName"
													name="userName" class="form-control" />
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-6">
										<div class="row form-group">
											<div class="col-xs-3" align="right">
												<label for="projectVo.projectCode" class="control-label">业务类型</label>
											</div>
											<div class="col-xs-8">
												<ce:select id="prpDproject.businessType" name="prpDproject.businessType" cssClass="form-control" required="required"
													list="#{'':'--请选择--','1':'经销商单店','2':'全国性经销商集团','3':'主机厂','4':'修理厂','5':'专业延保公司'}" value="1" />
											</div>
										</div>
									</div>
									
								
								</div>
								<div class="row">
									<div class="col-lg-12 col-md-12 col-xs-12">
										<div style="text-align: center;">
											<button class="btn btn-primary btn-outline btn-search"
												id="search" type="button" >查询</button>
											<button class="btn btn-primary btn-outline btn-reset"
												id="reset" type="button" >重置</button>
											<button class="btn btn-primary btn-outline btn-add" id="add"
												type="button"
												onclick="window.location.href='${ctx}/user/createNewUser.do'">新增</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="panel-group" id="accordion">
		<div class="col-lg-12">
			<div class="panel panel-info" id="showTitle"  >
				<div id="collapseTwo" class="panel-collapse" >
					<div class="panel-body" >
						<div class="table-responsive" >
							<table   class="table table-striped table-bordered table-sort" 
								id="information">
								<thead>
									<tr>
										<th><input id="checkAll" type="hidden">序列</th>
										<th>用户名</th>
										<th>密码</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>									
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>