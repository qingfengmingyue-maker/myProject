<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/static/common/taglibs.jsp"%>
<%@ include file="/static/common/meta_css.jsp"%>
<%@ include file="/static/common/meta_js.jsp"%>
<script type="text/javascript"	src="${ctx}/static/common/js/common.js"></script>
<script type="text/javascript"	src="${ctx}/views/js/UIPrepareUserMsg.js"></script>
<style>
th {
white-space: nowrap; 
}
.table>thead>tr>th { text-align: center;}
.center { text-align: center;}
</style>
<div class="modal-dialog modal-lg">
  <div class="modal-content">
      <div class="modal-header">
			<button type="button" class="close glyphicon glyphicon-remove-circle"
				data-dismiss="modal" aria-hidden="true" id="closeUserDialog"></button>
			<h4 class="modal-title" id="myModalLabel" class="panel panel-primary">业务联系人信息查询</h4>
      </div>
     <div class="modal-body">
	<br />
		<form name="userFm" id="userFm" class="form-horizontal" role="form">
			<div class="panel-group" id="accordion">
					<div id="collapseOne" class="panel-collapse collapse in">
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-6 col-md-6 col-xs-6">
									<div class="row form-group">
										<div class="col-xs-3">
											<label for=orgName class="control-label">业务联系人</label>
										</div>
										<div class="col-xs-8">
											<input id="userName" name="userName"
												class="form-control" value="${businessName }"/>
											<input id="orgCode" name="orgCode"  type="hidden"
												class="form-control" value="${orgCode }"/>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12 col-md-12 col-xs-12">
									<div  style="text-align: center;">
										<button class="btn btn-primary btn-outline btn-search" id='searchBusinessName' type="button">查询</button>
										<button class="btn btn-primary btn-outline btn-reset" id="clearBusinessName" type="button">重置</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				
			</div>
			<div div class="panel panel-info" id="showTitle">
					<div class="panel-heading" style="text-align: left;">
						<h4 class="panel-title">
							<button type="button" class="btn btn-primary btn-sm btn-create" id="userSureCheck">确定</button>
						</h4>
					</div>
					<div class="panel-collapse">
						<div class="panel-body">
							<div class="table-responsive">
								<table align="left" class="table table-striped table-bordered table-sort" id="userInformation">
									<thead>
										<tr>
											<th><input id="checkAll"  type="checkbox" ></th>
											<th>业务联系人代码</th>
											<th>业务联系人名称</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
				</div>
	     	</form>
	     </div>
		</div>
	</div>