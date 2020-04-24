<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/static/common/taglibs.jsp"%>
<html>
<head>
<title>${title }</title>
<script type="text/javascript"	src="${ctx}/static/common/js/common.js"></script>
<script type="text/javascript" src="${ctx}/views/js/UIContractOperate.js"></script>
<style type="text/css">
body {
	position: relative;
}
.navbar-wrapper {
	width:100%;
	position: fixed;
	bottom:-20px;
	z-index: 999;
}

.navbar.navbar-inverse.navbar-static-top {
	width:100%;
	background: #00ADD9;
	border-color: #009CC4;
}

.navbar.navbar-inverse.navbar-static-top a {
	color: #fff;
}

.navbar.navbar-inverse.navbar-static-top a:hover {
	color: #0A64A4;
}

.navbar-inverse .navbar-nav>.active>a, .navbar-inverse .navbar-nav>.active>a:focus
	{
	background: #009CC4;
	font-weight: 700;
}

.navbar-inverse .navbar-nav>.active>a:hover {
	background: #009CC4; 
	color: #fff;
	font-weight: 700;
}

</style>
</head>
<body   data-spy="scroll" data-offset="233" data-target=".navbar-wrapper">
       <div class="navbar-wrapper">
		<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
			<div class="container">
				<div class="navwrapper">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".bs-js-navbar-scrollspy">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span> 
							<span class="icon-bar"></span>
						</button>
					</div>
					<div class="navbar-collapse collapse bs-js-navbar-scrollspy">
						<ul class="nav navbar-nav" >
                            <li style="left:100%;float: right;text-align: right;" >
                            	<button type="button" style="width:80px;height:50px" class="btn btn-primary btn-outline btn-lg btn-save" id="temptSaveButton" >暂存</button>
                            	<button type="submit" style="width:80px;height:50px;" class="btn btn-primary btn-outline btn-lg btn-save" id="saveButton">保存</button>
                            	<button type="button" style="width:80px;height:50px;margin-right: 520px" class="btn btn-primary btn-outline btn-lg btn-save" id="goBackButton" >返回</button>
                            </li>
						</ul>
					</div>
				</div>
			</div>
		</nav>
	</div> 

	<div class="row">
		<div class="col-lg-12">
			<form id="contractfm" name="fm" class="form-horizontal"  action="${ctx}/contract/saveContract.do" method="post">
			 <input type="hidden"  id="saveType" name="saveType" value="1" >
			 <input type="hidden"  id="cancelType" name="cancelType" value="1" >
			 <div class="panel panel-primary"   style="width:96.8%;" id="projectBasicInfoDiv">
				<div class="panel-heading">
					<h4 class="panel-title" id="jfxx"
						style="padding-top: 160px; margin-top: -160px;">
						<a data-toggle="collapse" href="#collapseJFXX">甲方信息</a>
					</h4>
				</div>
				<div id="collapseJFXX" class="panel-collapse collapse in">
					<div class="panel-body">
					<div class="row">
					    	<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="partyA.orgName" class="control-label"  align="left"><span style="color: red">*</span>经销商全称：</label>
									</div>
									<div class="col-xs-6">
									    <input class="form-control" type="hidden" id="PartyA.orgCode"  name="PartyA.orgCode"  value="${USER_SESSION.orgCode }"/>
										<input class="form-control  required" type="text" id="PartyA.orgName"  name="PartyA.orgName"  value="${USER_SESSION.orgName }"  onchange="resetOrgCode()" readonly="readonly"/>
										<input class="form-control" type="hidden" id="PartyA.contractNo" name="PartyA.contractNo" value="${mainContract.partyA.contractNo}"/>
										<input class="form-control" type="hidden" id="editType" name="editType" value="${editType}"/>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label"><span style="color: red">*</span>业务联系人：</label>
									</div>
									<div class="col-xs-6">
									    <input class="form-control" type="hidden" id="PartyA.businessCode"  name="PartyA.businessCode"   value="${USER_SESSION.userCode }"  readonly="readonly"/>
										<input class="form-control  required" type="text" id="PartyA.businessName"  name="PartyA.businessName"   value="${USER_SESSION.userName }"  readonly="readonly"/>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="mobile" class="control-label"><span style="color: red">*</span>联系电话：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control  required" type="text"  id="PartyA.mobile"  name="PartyA.mobile" value="${USER_SESSION.telPhone }"  readonly="readonly"  maxlength="11"/>
									</div>
									
								</div>
							</div>
					</div>
			        </div>
			   </div>
			   </div>
			   
			    
			    
			
			<div class="panel panel-primary"   style="width:96.8%;" id="projectBasicInfoDiv">
				<div class="panel-heading">
					<h4 class="panel-title" id="jfxx"
						style="padding-top: 160px; margin-top: -160px;">
						<a data-toggle="collapse" href="#collapseYFXX">乙方信息</a>
					</h4>
				</div>
				<div id="collapseYFXX" class="panel-collapse collapse in">
					<div class="panel-body">
					<div class="row">
					    	<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="PartyB.ownerName" class="control-label"><span style="color: red">*</span>车主：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control  required" type="text" id="PartyB.ownerName" name="PartyB.ownerName" value="${mainContract.partyB.ownerName}"/>
										<input class="form-control" type="hidden" id="PartyB.contractNo" name="PartyB.contractNo" value="${mainContract.partyB.contractNo}"/>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label"><span style="color: red">*</span>联系方式：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control  required" type="text" id="PartyB.ownerMobile" name="PartyB.ownerMobile" value="${mainContract.partyB.ownerMobile}"  onchange="checkMobile(this,'联系方式')" maxlength="11"/>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label">联系地址：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control" type="text" id="PartyB.ownerDress" name="PartyB.ownerDress" value="${mainContract.partyB.ownerDress}"/>
									</div>
									
								</div>
							</div>
					</div>
					
						<div class="row">
					    	<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="documentType" class="control-label"><span style="color: red">*</span>证件类型：</label>
									</div>
									<div class="col-xs-6">
										<ce:select list="#{'':'--请选择--','01':'身份证','02':'护照','03':'军官证','04':'组织机构代码','05':'统一社会信用代码','99':'其他'}"
													id="PartyB.documentType" name="PartyB.documentType"
													cssClass="form-control  required"  value="${mainContract.partyB.documentType}"  onchange="checkDocumentType();"></ce:select>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="PartyB.documentType" class="control-label"><span style="color: red">*</span>证件号码：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control  required" type="text" id="PartyB.documentNo" name="PartyB.documentNo"  value="${mainContract.partyB.documentNo}"  onchange="checkDocumentNo(this);"/>
									</div>
								</div>
							</div>
					</div>
			        </div>
			   </div>
			   </div>
			   
			     
			    
			 <div class="panel panel-primary"   style="width:96.8%;" id="projectBasicInfoDiv">
				<div class="panel-heading">
					<h4 class="panel-title" id="jfxx"
						style="padding-top: 160px; margin-top: -160px;">
						<a data-toggle="collapse" href="#collapseCLXX">车辆信息</a>
					</h4>
				</div>
				<div id="collapseCLXX" class="panel-collapse collapse in">
					<div class="panel-body">
					<div class="row">
					    	<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label "><span style="color: red">*</span>首次购车日期：</label>
									</div>
									 <div class="col-xs-6">
											<div class="input-group input-append date form_date">
													<input id="VehicleMsg.purchaseDate" name="VehicleMsg.purchaseDate" readonly="readonly"
														class="form-control"    value="<fmt:formatDate value="${mainContract.vehicleMsg.purchaseDate}" pattern="yyyy-MM-dd"/>"
														type="text" dateISO="dateISO"   onchange="changePurchaseDate(this);"/>  <span class="input-group-addon add-on ">
														<i class="glyphicon glyphicon-th "> </i>
													</span>
													<input type="hidden"   id="VehicleMsg.contractNo" name="VehicleMsg.contractNo"  value="${mainContract.vehicleMsg.contractNo}">
											</div>
									</div> 
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label"><span style="color: red">*</span>车辆状态：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control required" type="text" id="VehicleMsg.carState" name="VehicleMsg.carState"  value="${mainContract.vehicleMsg.carState}"  readonly="readonly" />
										<%-- <ce:select list="#{'1':'新车','2':'一年以内次新车','3':'1年至2年在用车','4':'2年至3年在用车','5':'3年至4年在用车','6':'5年至6年在用车'}"
													id="VehicleMsg.carState" name="VehicleMsg.carState"
													cssClass="form-control required"  value="${mainContract.vehicleMsg.carState}" ></ce:select> --%>
									</div>
								</div>
							</div>
						 	<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="VehicleMsg.userNature" class="control-label"><span style="color: red">*</span>使用性质：</label>
									</div>
									<div class="col-xs-6">
										<ce:select list="#{'1':'家庭自用','2':'非营运'}"
													id="VehicleMsg.userNature" name="VehicleMsg.userNature" 
													cssClass="form-control  required" value="${mainContract.vehicleMsg.userNature}"></ce:select>
									</div>
									
								</div>
							</div>
					    </div>
					     <div class="row">
					    	<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label">车牌号码：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control" type="text" id="VehicleMsg.licenseNo" name="VehicleMsg.licenseNo"   value="${mainContract.vehicleMsg.licenseNo}"   onchange="checkLicenseNo(this);"/>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label"><span style="color: red">*</span>发动机号码：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control  required" type="text"  id="VehicleMsg.engineNo" name="VehicleMsg.engineNo"  value="${mainContract.vehicleMsg.engineNo}"/>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label"><span style="color: red">*</span>车辆识别码(VIN码)：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control  required" type="text" id="VehicleMsg.vinNo" name="VehicleMsg.vinNo" value="${mainContract.vehicleMsg.vinNo}"  onchange="checkVINNO(this);"  maxlength="17"/>
									</div>
									
								</div>
							</div>
					    </div>
					    
					    	<div class="row">
					    	
					    		<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label"><span style="color: red">*</span>品牌：</label>
									</div>
									<div class="col-xs-6">
										<%-- <ce:select list="#{'一汽奥迪':'一汽奥迪'}"
											id="VehicleMsg.brandName" name="VehicleMsg.brandName" 
											cssClass="form-control  required" value="${mainContract.vehicleMsg.brandName}"></ce:select> --%>
										<input id="VehicleMsg.brandName" name="VehicleMsg.brandName" class="form-control"  value="${mainContract.vehicleMsg.brandName ==null? '一汽奥迪' : mainContract.vehicleMsg.brandName  }">
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label">车系：</label>
									</div>
									<div class="col-xs-6">
										<input id="VehicleMsg.className" name="VehicleMsg.className" class="form-control"  value="${mainContract.vehicleMsg.className}">
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label class="control-label"><span style="color: red">*</span>车型：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control required" type="text"  
										id="VehicleMsg.modelName" name="VehicleMsg.modelName" 
										value="${mainContract.vehicleMsg.modelName}"/>
									</div>
								</div>
							</div>
					</div> 
				 	  <div class="row">
					    	<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label"><span style="color: red">*</span>车辆发票金额(元)：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control  required" type="text"  id="VehicleMsg.invoiceAmount" name="VehicleMsg.invoiceAmount" value="${mainContract.vehicleMsg.invoiceAmount}" onchange="checkMoney(this,'车辆发票金额(元)');changeInvoiceAmount(this)"    maxlength="14" />
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label">购置税(元)：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control" type="text" id="VehicleMsg.purchaseAmount" name="VehicleMsg.purchaseAmount" value="${mainContract.vehicleMsg.purchaseAmount}"  readonly="readonly"    maxlength="14" />
									</div>
									
								</div>
							</div>
					    </div>
					    
					     <div class="row">
					    	<div class="col-lg-8 col-md-8 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-2">
										<label for="prpDproject.projectName" class="control-label"><span style="color: red">*</span>投保险种：</label>
									</div> 
									<div class="col-xs-10">
										<div  class="col-xs-2"><input type="checkbox"  name="insuranceType"  ${mainContract.vehicleMsg.insuranceType == null ?'checked':''}  value="1">车损险 </div>
										<div  class="col-xs-2"><input type="checkbox"  name="insuranceType"  ${mainContract.vehicleMsg.insuranceType == null ?'checked':''}  value="2">不计免赔 </div>
										<div  class="col-xs-2"><input type="checkbox"  name="insuranceType"  value="3">盗抢险 </div>
										<div  class="col-xs-2"><input type="checkbox"  name="insuranceType"  value="4">自燃险 </div>
									</div>
									<input type="hidden" id="VehicleMsg.insuranceType" name="VehicleMsg.insuranceType"   value="${mainContract.vehicleMsg.insuranceType}"  >
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label"><span style="color: red">*</span>车险保险公司：</label>
									</div>
									<div class="col-xs-6">
										<ce:select list="#{'1':'人保','2':'太保','3':'平安','4':'其他'}"
													id="VehicleMsg.insuranceName" name="VehicleMsg.insuranceName"
													cssClass="form-control  required"  value="${mainContract.vehicleMsg.insuranceName}"></ce:select>
									</div>
								</div>
							</div>
							
					    </div> 
						  <div class="row">
					    	<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label">上牌费：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control" type="text"  id="VehicleMsg.licenseFee" name="VehicleMsg.licenseFee"   value="2000"  readonly="readonly"  maxlength="14"  />
									</div>
									
								</div>
							</div>
							
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label"><span style="color: red">*</span>排量：</label>
									</div>
									<div class="col-xs-6">
									  <ce:select list="#{'':'--请选择--','01':'1.0升以下','02':'1.0～1.6升(含)','03':'1.6～2.0升(含)','04':'2.0～2.5升(含)','05':'2.5～3.0升(含)','06':'3.0～4.0升(含)','07':'4.0升以上'}"
													id="VehicleMsg.displacement" name="VehicleMsg.displacement"
													cssClass="form-control  required"  value="${mainContract.vehicleMsg.displacement}"   onchange="changeDisplacement(this);"></ce:select>
									</div>
								</div>
							</div>
							
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label">车船税：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control" type="text" id="VehicleMsg.taxAmount" name="VehicleMsg.taxAmount"  value="${mainContract.vehicleMsg.taxAmount}"  readonly="readonly"  maxlength="14"/>
									</div>
								</div>
							</div>
					    </div> 
			        </div>
			   </div>
			   </div> 
			 
			    
			    
			
	 		<div class="panel panel-primary"   style="width:96.8%;" id="projectBasicInfoDiv">
				<div class="panel-heading">
					<h4 class="panel-title" id="jfxx"
						style="padding-top: 160px; margin-top: -160px;">
						<a data-toggle="collapse" href="#collapseFWXX">服务信息</a>
					</h4>
				</div>
				<div id="collapseFWXX" class="panel-collapse collapse in">
					<div class="panel-body">
					<div class="row">
					    	 <div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="serviceType" class="control-label"><span style="color: red">*</span>服务类型：</label>
									</div>
									<div class="col-xs-6">
										 <ce:select list="#{'1':'赔付包含购置税'}"
													id="serviceType" name="serviceType"
													cssClass="form-control  required"   value="${mainContract.serviceType}"></ce:select> 
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="serviceDate" class="control-label"><span style="color: red">*</span>服务期限：</label>
									</div>
									<div class="col-xs-6">
												<ce:select list="#{'1':'1年','2':'2年','3':'3年','4':'4年','5':'5年'}"
													id="serviceDate" name="serviceDate"  onchange="changeDate();"
													cssClass="form-control  required"  value="${mainContract.serviceDate}"></ce:select>
									</div>
								</div>
							</div> 
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="settlePrice" class="control-label"><span style="color: red">*</span>服务售价(元)：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control  required" type="text" id="settlePrice" name="settlePrice" value="${mainContract.settlePrice}"  onchange="checkMoney(this,'服务售价(元)')"  maxlength="14"  />
									</div>
								</div>
							</div>
					</div>
					
					<div class="row">
					    	
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label"><span style="color: red">*</span>服务起始日期：</label>
									</div>
									<div class="col-xs-6">
											<div class="input-group input-append date form_date">
													<input  id="startDate" name="startDate" readonly="readonly"  
														 class="form-control"   value="<fmt:formatDate value="${mainContract.startDate}" pattern="yyyy-MM-dd"/>"
														type="text" dateISO="dateISO"  onchange="changeDate();"/>  <span class="input-group-addon add-on">
														<i class="glyphicon glyphicon-th"> </i>
													</span>
											</div>
									</div> 
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label"><span style="color: red">*</span>服务终止日期：</label>
									</div>
									<div class="col-xs-6">
													<input  id="endDate" name="endDate" readonly="readonly"
														 class="form-control"    value="<fmt:formatDate value="${mainContract.endDate}" pattern="yyyy-MM-dd"/>"
														type="text" dateISO="dateISO"/>  
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="saleUser" class="control-label"><span style="color: red">*</span>销售人员：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control required" type="text"  id="saleUser" name="saleUser" value="${mainContract.saleUser}"/>
									</div>
								</div>
							</div>
					</div>
					
						<div class="row">
					    	
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="contractNo" class="control-label">合同号：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control" type="text" placeholder="系统唯一生成，无需填写"  readonly="readonly"  id="contractNo" name="contractNo"  value="${mainContract.contractNo}"/>
									</div>
								</div>
							</div>
					  </div>
			        </div>
			   </div>
			   </div> 
			   
			    
			 
			<div class="panel panel-primary"   style="width:96.8%;" id="projectBasicInfoDiv">
				<div class="panel-heading">
					<h4 class="panel-title" id="jfxx"
						style="padding-top: 160px; margin-top: -160px;">
						<a data-toggle="collapse" href="#collapseQTXX">其他信息</a>
					</h4>
				</div>
				<div id="collapseQTXX" class="panel-collapse collapse in">
					<div class="panel-body">
					<div class="row">
					    	<div class="col-lg-12 col-md-12 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-2">
										<label for="prpDproject.projectName" class="control-label"><span style="color: red">*</span>附加服务：</label>
									</div>
									<div class="col-xs-8">
										<textarea class="form-control" rows="2" cols="100" id="appendMsg" name="appendMsg"  >${mainContract.appendMsg == null? '无':mainContract.appendMsg } </textarea>
									</div>
								</div>
							</div>
					</div>
					
					<div class="row">
					    	<div class="col-lg-12 col-md-12 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-2">
										<label for="prpDproject.projectName" class="control-label"><span style="color: red">*</span>备注：</label>
									</div>
									<div class="col-xs-8">
										<textarea class="form-control" rows="2" cols="100"  id="reMark" name="reMark" >${mainContract.reMark ==null ? '无备注。':mainContract.reMark }</textarea>
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
	<br/>
		<!-- 模态框（Modal） -->
  <div id="userMsgModal"  class="modal fade" role="dialog"  tabindex="-1" data-backdrop="false" style="display:none;"></div>
  <div id="comPanyModal"  class="modal fade" role="dialog"  tabindex="-1" data-backdrop="false" style="display:none;"></div>

</body>
</html>



