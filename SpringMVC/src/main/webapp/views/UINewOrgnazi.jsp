<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/static/common/taglibs.jsp"%>
<head>
<style>
th {
white-space: nowrap; 
}
body {
	position: relative;
}
.navbar-wrapper {
	width:100%;
	position: fixed;
	bottom:-20px;
	z-index: 999;
}
</style>
<script type="text/javascript" src="${ctx}/static/common/js/AjaxEdit.js"></script>
<script type="text/javascript"  src="${ctx}static/common/js/common.js"></script>
<script type="text/javascript"	src="${ctx}/views/js/UINewOrgnazi.js"></script>
<title>机构信息</title>
</head>
<body data-spy="scroll" data-offset="233" >
	<div class="row">
		<div class="col-lg-12">
			<form id="fm" class="form-horizontal" role="form" action="${ctx}/organiz/saveOrganiz.do" method="post">
				<div class="panel-group" id="accordion">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseOne">新增机构</a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in">
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-6 col-md-6 col-xs-12">
										<div class="row form-group">
											<div class="col-xs-3" style="text-align:right;">
												<span style="color: red">*</span>
												<label for="" class="control-label">经销商全称</label>
											</div>
											<div class="col-xs-8">
												<input id="orgName" name="orgName" class="form-control"
												value="${organization.orgName}" />
												
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-12">
										<div class="row form-group">
											<div class="col-xs-3" style="text-align:right;">
												<span style="color: red">*</span>
												<label for="" class="control-label">经销商编码</label>
											</div>
											<div class="col-xs-8">
												<input id="orgCode" name="orgCode" 
													class="form-control" readonly="true" value="${organization.orgCode}" />
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6 col-md-6 col-xs-12">
										<div class="row form-group">
											<div class="col-xs-3" style="text-align:right;">
												<span style="color: red">*</span>	
												<label for="" class="control-label">所属地区</label>
											</div>
											<div class="col-xs-4">
												<select cssClass="form-control" id="" name="">
													<option value="11000">北京</option>
													<option value="12000">天津</option>
												</select>
												<label for="" class="control-label">省</label>
											</div>
											<div class="col-xs-4">
												<select cssClass="form-control" id="cityCode" name="cityCode">
													<option value="110000">北京</option>
													<option value="120000">天津</option>
												</select>
												<label for="" class="control-label">市</label>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-12">
										<div class="row form-group">
											<div class="col-xs-3">
												<label for="" class="control-label">统一社会信用代码</label>
											</div>
											<div class="col-xs-8">
												<input id="creditCode" name="creditCode" class="form-control"
													type="text" value="${organization.creditCode}" />
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6 col-md-6 col-xs-12">
										<div class="row form-group">
											<div class="col-xs-3">
												<label class="control-label ">公司简称</label>
											</div>
											<div class="col-xs-8">
												<input id="orgShortName"
													name="orgShortName" class="form-control"
													type="text" placeholder=""
													value="${organization.orgShortName}">
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-12">
										<div class="row form-group">
											<div class="col-xs-3">
												<label for="" class="control-label">地址</label>
											</div>
											<div class="col-xs-8">
												<input id="address" name="address" class="form-control" 
												value="${organization.address}"/>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6 col-md-6 col-xs-12">
										<div class="row form-group">
											<div class="col-xs-3">
												<label for="" class="control-label">法人</label>
											</div>
											<div class="col-xs-8">
												<input id="legalPerson" name="legalPerson" class="form-control"
													type="text" value="${organization.legalPerson}" />
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-12">
										<div class="row form-group">
											<div class="col-xs-3">
												<label for="" class="control-label ">邮编</label>
											</div>
											<div class="col-xs-8">
												<input id="postCode"
													name="postCode" class="form-control"
													type="text" placeholder=""
													value="${organization.postCode}">
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6 col-md-6 col-xs-12">
										<div class="row form-group">
											<div class="col-xs-3">
												<label for="" class="control-label">电话</label>
											</div>
											<div class="col-xs-8">
												<input id="telphone" name="telphone" class="form-control"
													type="text" value="${organization.telphone}"/>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-12">
										<div class="row form-group">
											<div class="col-xs-3">
												<label for="" class="control-label ">传真</label>
											</div>
											<div class="col-xs-8">
												<input id="faxno"
													name="faxno" class="form-control"
													type="text" placeholder=""
													value="${organization.faxno}">
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6 col-md-6 col-xs-12">
										<div class="row form-group">
											<div class="col-xs-3">
												<label for="" class="control-label">账户名称</label>
											</div>
											<div class="col-xs-8">
												<input id="accountName" name="accountName" 
													class="form-control" type="text"value="${organization.accountName}" />
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-12">
										<div class="row form-group">
											<div class="col-xs-3">
												<label for="" class="control-label ">账号</label>
											</div>
											<div class="col-xs-8">
												<input id="accountNo"
													name="accountNo" class="form-control"
													type="text" placeholder=""
													value="${organization.accountNo}">
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6 col-md-6 col-xs-12">
										<div class="row form-group">
											<div class="col-xs-3">
												<label for="" class="control-label">开户行名称</label>
											</div>
											<div class="col-xs-8">
												<input id="bankName" name="bankName" 
													class="form-control" type="text" value="${organization.bankName}" />
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-xs-12">
										<div class="row form-group">
											<div class="col-xs-3">
												<label for="" class="control-label ">经销商经营品牌</label>
											</div>
											<div class="col-xs-8">
												<input id="brandName"
													name="brandName" class="form-control"
													type="text" placeholder=""
													value="${organization.brandName}">
											</div>
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-lg-12 col-md-12 col-xs-12">
										<div style="text-align: center;">
											<button class="btn btn-primary btn-outline"
												id="savebtn" type="button" >保存</button>
											&nbsp;&nbsp;
											<button class="btn btn-primary btn-outline"
												id="closebtn" type="button" >关闭</button>
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