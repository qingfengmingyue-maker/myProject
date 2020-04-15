<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/static/common/taglibs.jsp"%>
<link href="${ctx}/static/common/css/custom.css" rel="stylesheet" type="text/css" />
<html>
<head>
<title>${message }</title>
<script type="text/javascript" src="${ctx}/views/js/UIUserMsgOperate.js"></script>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<form id="userfm" name="fm" action="${ctx}/userMsg/saveUserMsg.do"
				method="post">
				<div class="panel-group" id="accordion">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseOne">${message }</a>
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
													placeholder="自动生成" readonly="readonly"
													value="${userMsg.userCode }">
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-2 col-md-2 col-xs-2"></div>
									<div class="col-lg-6 col-md-6 col-xs-6">
										<div class="row form-group">
											<div class="col-xs-3" align="right">
												<label for="userMsgVo.orgName" class="control-label"><span
													style="color: red">*</span>经销商代码</label>
											</div>
											<div class="col-xs-8">
												<input class="form-control required" id="orgCode" name="orgCode"
													maxlength="10" value="${userMsg.orgCode }"  placeholder="选择经销商自动带出"
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
												<label for="userMsgVo.orgName" class="control-label"><span
													style="color: red">*</span>经销商名称</label>
											</div>
											<div class="col-xs-8">
												<input class="form-control required" id="orgName" name="orgName"
													maxlength="50" value="${userMsg.orgName }"
													${editType == 'view' ? 'readonly' : ''}>
											</div>
											<div class="col-xs-1" align="left" style="padding-left: 0px">
												<button type="button" id="searchComPany"
													class="btn btn-primary"  ${editType == 'view' ? 'disabled' : ''}>查询</button>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-2 col-md-2 col-xs-2"></div>
									<div class="col-lg-6 col-md-6 col-xs-6">
										<div class="row form-group">
											<div class="col-xs-3" align="right">
												<label for="userMsgVo.userName" class="control-label"><span
													style="color: red">*</span>用户名称</label>
											</div>
											<div class="col-xs-8">
												<input class="form-control  required" id="userName" name="userName"
													maxlength="30" value="${userMsg.userName }"
													${editType == 'view' ? 'readonly' : ''}>
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
													style="color: red">*</span>用户密码</label>
											</div>
											<div class="col-xs-8">
												<input class="form-control required" id="userPwd" name="userPwd"
													maxlength="10" type="password" value="${userMsg.userPwd }"
													${editType == 'view' ? 'readonly' : ''}>
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
													maxlength="11" value="${userMsg.telPhone }"  
													${editType == 'view' ? 'readonly' : ''}>
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
													maxlength="11" value="${userMsg.businessPost }"
													${editType == 'view' ? 'readonly' : ''}>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<c:if test="${editType !='view' }">
										<div class="col-lg-6 col-md-6 col-xs-6">
											<div class="col-xs-10">
												<div style="text-align: right;">
													<button class="btn btn-primary btn-outline btn-save"
														id="saveUserMsg" type="button">保存</button>
												</div>
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-xs-6">
											<div class="col-xs-10">
												<div class="btn-toolbar" style="text-align: left;">
													<button class="btn btn-primary btn-outline btn-close"
														id ="resetUser" type="button">重置</button>

												</div>
											</div>
										</div>
									</c:if>
									<c:if test="${editType == 'view' }">
										<div class="col-lg-12 col-md-12 col-xs-12">
											<div class="col-lg-5 col-md-5 col-xs-5"></div>
											<div class="col-lg-7 col-md-7 col-xs-7">
												<div style="text-align: left;">
													<button class="btn btn-primary btn-outline btn-close"
														 type="button"
														onclick="window.history.go(-1); ">关闭</button>
												</div>
											</div>
										</div>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- 模态框（Modal） -->
   <div id="myModal"  class="modal fade" role="dialog"  tabindex="-1" data-backdrop="false" style="display:none;"></div>
</body>
</html>