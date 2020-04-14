<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/static/common/taglibs.jsp"%>
<head>
<style>
th {
white-space: nowrap; 
}
</style>
<script type="text/javascript"	src="${ctx}/views/js/UIOrgnaziQuery.js"></script>
<title>经销商管理</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
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
									<div class="col-lg-4 col-md-4 col-xs-12">
										<div class="row form-group">
											<div class="col-xs-3" align="right">
												<label class="control-label">经销商名称</label>
											</div>
											<div class="col-xs-8">
												<input id="orgName"
													name="orgName" class="form-control" />
											</div>
										</div>
									</div>
									<div class="col-lg-4 col-md-4 col-xs-12">
										<div class="row form-group">
											<div class="col-xs-3" align="right">
												<label for="" class="control-label">机构代码</label>
											</div>
											<div class="col-xs-8">
												<input id="orgCode"
													name="orgCode" class="form-control" />
											</div>
										</div>
									</div>
									<div class="col-lg-4 col-md-4 col-xs-12">
										<div class="row form-group">
											<div class="col-xs-5" align="right">
												<label class="control-label">统一社会信用代码</label>
											</div>
											<div class="col-xs-7">
												<input id="creditCode"
													name="creditCode" class="form-control" />
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12 col-md-12 col-xs-12">
										<div style="text-align: center;">
											<button class="btn btn-primary btn-outline"
												id="search" type="button" >查询</button>
											&nbsp;&nbsp;
											<button class="btn btn-primary btn-outline"
												id="reset" type="button" >重置</button>
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
				<div class="panel-heading">
					<h4 class="panel-title">
						<button class="btn btn-primary  glyphicon glyphicon-plus"
							id="addbtn" data-toggle="modal" data-target="#orgnaziModal" >新增</button>
					</h4>
				</div>
				<div id="collapseTwo" class="panel-collapse" >
					<div class="panel-body" >
						<div class="table-responsive" >
							<table   class="table table-striped table-bordered table-sort" 
								id="information">
								<thead>
									<tr>
										<!-- <th width="12px"><input id="checkAll"  type="checkbox" >选择</th> -->
										<th>机构名称</th>
										<th>统一社会信用代码</th>
										<th>机构代码</th>
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
<div id="orgnaziModal"  class="modal fade" role="dialog"  data-backdrop="false" tabindex="-1" style="display:none;"></div>
</body>
</html>