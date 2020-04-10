<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/static/common/taglibs.jsp"%>
<html>
<head>
<title>${title }</title>
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
                            	<button type="submit" style="width:80px;height:50px;margin-right: 700px" class="btn btn-primary btn-outline btn-lg btn-save" id="saveButton">保存</button>
                            </li>
						</ul>
					</div>
				</div>
			</div>
		</nav>
	</div> 

	<div class="row">
		<div class="col-lg-12">
			<form id="contractfm" name="fm" action="${ctx}/contract/saveContract.do" method="post">
			    <!-- 甲方信息开始 -->
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
										<label for="partyA.orgName" class="control-label"><span style="color: red">*</span>经销商全称：</label>
									</div>
									<div class="col-xs-6">
									    <input class="form-control" type="text" id="partyA.orgCode"  name="partyA.orgCode"  value="111"/>
										<input class="form-control" type="text" id="partyA.orgName"  name="partyA.orgName"/>
									</div>
									<div class="col-xs-2" align="left" style="padding-left: 0px">
										<button type="button" id="searchComPany" class="btn btn-primary"  >查询</button>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label"><span style="color: red">*</span>业务联系人：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control" type="text" id="partyA.businessName"  name="partyA.businessName" />
									</div>
									<div class="col-xs-2" align="left" style="padding-left: 0px">
										<button type="button" id="searchBussinessLinker" class="btn btn-primary"  >查询</button>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label"><span style="color: red">*</span>联系电话：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control" type="text"  id="partyA.mobile"  name="partyA.mobile"/>
									</div>
									
								</div>
							</div>
					</div>
			        </div>
			   </div>
			   </div>
			    <!-- 甲方信息结束 -->
			    
			    
			  <!-- 乙方信息开始 -->
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
										<input class="form-control" type="text" id="PartyB.ownerName" name="PartyB.ownerName" />
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label"><span style="color: red">*</span>联系方式：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control" type="text" id="PartyB.ownerMobile" name="PartyB.ownerMobile"/>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label">联系地址：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control" type="text" id="PartyB.ownerDress" name="PartyB.ownerDress" />
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
													cssClass="form-control"></ce:select>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="PartyB.documentType" class="control-label"><span style="color: red">*</span>证件号码：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control" type="text" id="PartyB.documentNo" name="PartyB.documentNo"/>
									</div>
								</div>
							</div>
					</div>
			        </div>
			   </div>
			   </div>
			     <!-- 乙方信息结束 -->
			     
			     <!-- 车辆信息开始 -->
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
										<label for="prpDproject.projectName" class="control-label"><span style="color: red">*</span>首次购车日期：</label>
									</div>
									 <div class="col-xs-6">
											<div class="input-group input-append date form_date">
													<input id="VehicleMsg.purchaseDate" name="VehicleMsg.purchaseDate" readonly="readonly"
														class="form-control"
														type="text" dateISO="dateISO"/>  <span class="input-group-addon add-on">
														<i class="glyphicon glyphicon-th"> </i>
													</span>
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
										<input class="form-control" type="text" id="VehicleMsg.carState" name="VehicleMsg.carState" />
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
													cssClass="form-control"></ce:select>
									</div>
									
								</div>
							</div>
					    </div>
					     <div class="row">
					    	<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label"><span style="color: red">*</span>车牌号码：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control" type="text" id="VehicleMsg.licenseNo" name="VehicleMsg.licenseNo"  />
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label">发动机号码：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control" type="text"  id="VehicleMsg.engineNo" name="VehicleMsg.engineNo" />
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label">车辆识别码(VIN码)：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control" type="text" id="VehicleMsg.vinNo" name="VehicleMsg.vinNo" />
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
										<input class="form-control" type="text" id="VehicleMsg.brandName" name="VehicleMsg.brandName"/>
									</div>
									<div class="col-xs-2" align="left" style="padding-left: 0px">
										<button type="button" id="searchComPany" class="btn btn-primary"  >选择</button>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label"><span style="color: red">*</span>车系：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control" type="text"  id="VehicleMsg.className" name="VehicleMsg.className"/>
									</div>
									<div class="col-xs-2" align="left" style="padding-left: 0px">
										<button type="button" id="searchBussinessLinker" class="btn btn-primary"  >选择</button>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label"><span style="color: red">*</span>车型：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control" type="text"  id="VehicleMsg.modelName" name="VehicleMsg.modelName"/>
									</div>
									<div class="col-xs-2" align="left" style="padding-left: 0px">
										<button type="button" id="searchBussinessLinker" class="btn btn-primary"  >选择</button>
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
										<input class="form-control" type="text"  id="VehicleMsg.invoiceAmount" name="VehicleMsg.invoiceAmount" />
									</div>
								</div>
							</div>
							<!-- <div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label">发票金额大写：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control" type="text" />
									</div>
								</div>
							</div> -->
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label">购置费用(元)：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control" type="text" id="VehicleMsg.purchaseAmount" name="VehicleMsg.purchaseAmount"/>
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
										<div  class="col-xs-2"><input type="checkbox"  name="VehicleMsg.insuranceType"  checked="checked" value="1">车损险 </div>
										<div  class="col-xs-2"><input type="checkbox"  name="VehicleMsg.insuranceType"  checked="checked" value="2">不计免赔 </div>
										<div  class="col-xs-2"><input type="checkbox"  name="VehicleMsg.insuranceType"  value="3">盗抢险 </div>
										<div  class="col-xs-2"><input type="checkbox"  name="VehicleMsg.insuranceType"  value="4">自燃险 </div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label">车险保险公司：</label>
									</div>
									<div class="col-xs-6">
										<ce:select list="#{'1':'人保','2':'平安','3':'太保','4':'国寿财','5':'鑫安','6':'其他'}"
													id="VehicleMsg.insuranceName" name="VehicleMsg.insuranceName"
													cssClass="form-control"></ce:select>
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
										<input class="form-control" type="text"  id="VehicleMsg.licenseFee" name="VehicleMsg.licenseFee"/>
									</div>
									
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label">车船税：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control" type="text" id="VehicleMsg.taxAmount" name="VehicleMsg.taxAmount"/>
									</div>
								</div>
							</div>
					    </div> 
			        </div>
			   </div>
			   </div> 
			    <!-- 车辆信息结束 -->
			    
			    
			  <!-- 服务信息开始 -->
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
													cssClass="form-control"></ce:select> 
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
													id="serviceDate" name="serviceDate"
													cssClass="form-control"></ce:select>
									</div>
								</div>
							</div> 
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="settleAmount" class="control-label">结算金额(元)：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control" type="text" 	id="settleAmount" name="settleAmount"/>
									</div>
									
								</div>
							</div>
					</div>
					
					<div class="row">
					    	<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="settlePrice" class="control-label"><span style="color: red">*</span>服务售价(元)：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control" type="text" id="settlePrice" name="settlePrice" />
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label"><span style="color: red">*</span>服务起始日期：</label>
									</div>
									<div class="col-xs-6">
											<div class="input-group input-append date form_date">
													<input  id="startDate" name="startDate" readonly="readonly"
														 class="form-control"
														type="text" dateISO="dateISO"/>  <span class="input-group-addon add-on">
														<i class="glyphicon glyphicon-th"> </i>
													</span>
											</div>
									</div> 
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="prpDproject.projectName" class="control-label">服务终止日期：</label>
									</div>
									<div class="col-xs-6">
											<div class="input-group input-append date form_date">
													<input  id="endDate" name="endDate" readonly="readonly"
														 class="form-control"
														type="text" dateISO="dateISO"/>  <span class="input-group-addon add-on">
														<i class="glyphicon glyphicon-th"> </i>
													</span>
											</div>
									</div>
									
								</div>
							</div>
					</div>
					
						<div class="row">
					    	<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="saleUser" class="control-label"><span style="color: red">*</span>销售人员：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control" type="text"  id="saleUser" name="saleUser" />
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="row form-group">
									<div class="col-xs-4">
										<label for="contractNo" class="control-label">合同号：</label>
									</div>
									<div class="col-xs-6">
										<input class="form-control" type="text" placeholder="系统唯一生成，无需填写"  readonly="readonly"  id="contractNo" name="contractNo"/>
									</div>
								</div>
							</div>
					  </div>
			        </div>
			   </div>
			   </div> 
			    <!-- 服务信息结束 -->
			    
			 <!-- 其他信息开始 -->
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
										<textarea class="form-control" rows="2" cols="100" id="appendMsg" name="appendMsg"  >无</textarea>
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
										<textarea class="form-control" rows="2" cols="100"  id="reMark" name="reMark" >无备注。</textarea>
									</div>
								</div>
							</div>
					    </div>
			        </div>
			   </div>
			   </div>
			    <!-- 其他信息结束 -->
			</form>
		</div>
	</div>
	<br/>
</body>
</html>



