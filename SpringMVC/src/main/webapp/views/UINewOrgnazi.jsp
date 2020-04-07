<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/static/common/taglibs.jsp"%>
<script type="text/javascript" src="${ctx}/static/common/js/AjaxEdit.js"></script>
<script type="text/javascript"	src="${ctx}/views/js/UINewOrgnazi.js"></script>
<div class="modal-dialog modal-lg" data-backdrop="false">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close glyphicon glyphicon-remove-circle"
				data-dismiss="modal" aria-hidden="true" id="closeExamDialog"></button>
			<h4 class="modal-title" id="myModalLabel" class="panel panel-primary">机构信息</h4>
		</div>
		<div class="modal-body">
    		<form id="createNewOrg" action="${ctx}/organiz/saveOrganiz.do">
    			<div class="row">
					<div class="col-lg-6 col-md-6 col-xs-12">
						<div class="row form-group">
							<div class="col-xs-3" style="text-align:right;">
								<span style="color: red">*</span>
								<label for="" class="control-label">经销商全称</label>
							</div>
							<div class="col-xs-8">
								<input id="orgName" name="orgName" class="form-control" required="required"
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
							<div class="col-xs-3">
								<ce:select cssClass="form-control" id="" name="" list="#{110000:北京,120000:天津 }">
								</ce:select>
							</div>
							<div class="col-xs-1">
								<label for="" class="control-label">省</label>
							</div>
							<div class="col-xs-3">
								<ce:select cssClass="form-control" id="cityCode" name="cityCode" list="#{110000:北京,120000:天津 }">
								</ce:select>
							</div>
							<div class="col-xs-1">
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
								<input id="telphone" name="telphone" class="form-control" isMobile="isMobile"
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
    				<div class="col-lg-12 col-md-offset-5 col-xs-12" style="text-align: center;" >
						<div class="btn-toolbar" >
							<button class="btn btn-primary btn-outline btn-save"
								id="saveOrgbtn" type="button">保存</button>
						    <button class="btn btn-primary btn-outline btn-save"
								id="closeOrgbtn" type="button">关闭</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
