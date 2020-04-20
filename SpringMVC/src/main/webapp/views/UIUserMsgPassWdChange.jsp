<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/static/common/taglibs.jsp"%>
<link href="${ctx}/static/common/css/custom.css" rel="stylesheet" type="text/css" />
<html>
<head>
<title>修改密码</title>
<script type="text/javascript" src="${ctx}/views/js/UIUserMsgPassWdChange.js"></script>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<form id="userMsgfm" name="fm" class="form-horizontal"  action="${ctx}/userMsg/saveUserMsg.do" method="post">
				<div class="panel-group" id="accordion">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseOne">修改密码</a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in">
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-2 col-md-2 col-xs-2"></div>
									<div class="col-lg-6 col-md-6 col-xs-6">
										<div class="row form-group">
											<div class="col-xs-3" align="right">
												<label for="userMsgVo.userCode" class="control-label">用户代码</label>
											</div>
											<div class="col-xs-8">
												<input class="form-control " id="userCode" name="userCode"
													 readonly="readonly"
													value="${userMsg.userCode }">
												<input class="form-control " type="hidden" id="postFlag" name="postFlag" value="1">
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-2 col-md-2 col-xs-2"></div>
									<div class="col-lg-6 col-md-6 col-xs-6">
										<div class="row form-group">
											<div class="col-xs-3" align="right">
												<label for="userMsgVo.orgName" class="control-label">经销商代码</label>
											</div>
											<div class="col-xs-8">
												<input class="form-control" id="orgCode" name="orgCode"
													maxlength="10" value="${userMsg.orgCode }" 
													readonly="readonly">
											</div>
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-lg-2 col-md-2 col-xs-2"></div>
									<div class="col-lg-6 col-md-6 col-xs-6">
										<div class="row form-group">
											<div class="col-xs-3" align="right">
												<label for="userMsgVo.orgName" class="control-label">经销商名称</label>
											</div>
											<div class="col-xs-8">
												<input class="form-control required" id="orgName" name="orgName"
													maxlength="50" value="${userMsg.orgName }"  readonly="readonly"
													>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-2 col-md-2 col-xs-2"></div>
									<div class="col-lg-6 col-md-6 col-xs-6">
										<div class="row form-group">
											<div class="col-xs-3" align="right">
												<label for="userMsgVo.userName" class="control-label">用户名称</label>
											</div>
											<div class="col-xs-8">
												<input class="form-control  required" id="userName" name="userName"
													maxlength="30" value="${userMsg.userName }"   readonly="readonly">
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-2 col-md-2 col-xs-2"></div>
									<div class="col-lg-6 col-md-6 col-xs-6">
										<div class="row form-group">
											<div class="col-xs-3" align="right">
												<label for="userMsgVo.telphone" class="control-label">手机号</label>
											</div>
											<div class="col-xs-8">
												<input class="form-control" id="telPhone" name="telPhone"
													maxlength="11" value="${userMsg.telPhone }"   readonly="readonly">
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-2 col-md-2 col-xs-2"></div>
									<div class="col-lg-6 col-md-6 col-xs-6">
										<div class="row form-group">
											<div class="col-xs-3" align="right">
												<label for="userMsgVo.businessPost" class="control-label">职务</label>
											</div>
											<div class="col-xs-8">
												<input class="form-control" id="businessPost" name="businessPost"
													maxlength="11" value="${userMsg.businessPost }"  readonly="readonly">
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-2 col-md-2 col-xs-2"></div>
									<div class="col-lg-6 col-md-6 col-xs-6">
										<div class="row form-group">
											<div class="col-xs-3" align="right">
												<label for="userPwd" class="control-label"><span
													style="color: red">*</span>新密码</label>
											</div>
											<div class="col-xs-8">
												<input class="form-control" id="userPwd" name="userPwd"
													maxlength="10"  placeholder="输入新密码"  type="password">
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-2 col-md-2 col-xs-2"></div>
									<div class="col-lg-6 col-md-6 col-xs-6">
										<div class="row form-group">
											<div class="col-xs-3" align="right">
												<label for="confirmPwd" class="control-label"><span
													style="color: red">*</span>确认新密码</label>
											</div>
											<div class="col-xs-8">
												<input class="form-control" id="confirmPwd" name="confirmPwd"
													maxlength="10" placeholder="确认新密码"  type="password" >
											</div>
										</div>
									</div>
								</div>
								<div class="row">
										<div class="col-lg-6 col-md-6 col-xs-6">
											<div class="col-xs-10">
												<div style="text-align: right;">
													<input type="submit" class="btn btn-primary btn-outline save" value="保存"></button>
												</div>
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6">
											<div class="col-xs-10">
												<div class="btn-toolbar" style="text-align: left;">
													<button class="btn btn-primary btn-outline"
														id ="goback" onclick="window.history.go(-1);" type="button">返回</button>
												</div>
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
</body>
</html>