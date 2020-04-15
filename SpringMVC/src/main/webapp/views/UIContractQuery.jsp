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
<title>订单信息展示页面</title>
<script type="text/javascript"	src="${ctx}/static/common/js/common.js"></script>
<script type="text/javascript"	src="${ctx}/views/js/UIContractQuery.js"></script>
</head>
<body>
<div class="row">
		   <div class="col-lg-12">
		    <div class="panel-body">
			<div style="text-align: left;">
				<button class="btn btn-primary  glyphicon glyphicon-plus"
					id="add" type="button"  onclick="window.location.href='${ctx}/contract/createNewContract.do'">新增</button>
				<button class="btn btn-primary glyphicon glyphicon-pencil"
					id="edit" type="button" >修改</button>
				<button class="btn btn-primary glyphicon glyphicon-remove" id="remove"
					type="button">删除</button>
			    <button class="btn btn-primary glyphicon glyphicon-eye-open" id="view"
					type="button">浏览</button>
				 <button class="btn btn-primary glyphicon glyphicon glyphicon-file" id="print"
					type="button">打印</button>
				<c:if test="${USER_SESSION.postFlag == 0}">
				 <button class="btn btn-primary glyphicon glyphicon glyphicon-download-alt" id="export"
					type="button">导出</button>
				</c:if>
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
							<div class="col-lg-4 col-md-4 col-xs-4">
								<div class="row form-group">
									<div class="col-xs-4" align="left">
										<label for="userCode" class="control-label">合同号:</label>
									</div>
									<div class="col-xs-8">
										<input id="contractNo"
											name="contractNo" class="form-control" />
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-4">
								<div class="row form-group">
									<div class="col-xs-4" align="left">
										<label for="ownerName" class="control-label">车主:</label>
									</div>
									<div class="col-xs-8">
										<input id="ownerName"
											name="ownerName" class="form-control" />
									</div>
								</div>
							</div>
								<div class="col-lg-4 col-md-4 col-xs-4">
								<div class="row form-group">
									<div class="col-xs-4" align="left">
										<label for="vinNo" class="control-label">车架号:</label>
									</div>
									<div class="col-xs-8">
										<input id="vinNo"
											name="vinNo" class="form-control" />
									</div>
								</div>
							</div>
						</div>
						<div class="row">
						    <div class="col-lg-4 col-md-4 col-xs-4">
								<div class="row form-group">
									<div class="col-xs-4" align="left">
										<label for="orgName" class="control-label">经销商名称:</label>
									</div>
									<div class="col-xs-8">
										<input id="orgName"
											name="orgName" class="form-control" />
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-4">
								<div class="row form-group">
									<div class="col-xs-4" align="left">
										<label for="userCode" class="control-label">保存日期起期:</label>
									</div>
									<div class="col-xs-8">
									<div class="input-group input-append date form_date">
									  <input  id="insertTime" name="insertTime" readonly="readonly"  
										class="form-control"   
										type="text" dateISO="dateISO"/>  <span class="input-group-addon add-on">
										<i class="glyphicon glyphicon-th"> </i>
										</span>
								    </div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-4">
								<div class="row form-group">
									<div class="col-xs-4" align="left">
										<label for="insertTime1" class="control-label">保存日期止期:</label>
									</div>
									<div class="col-xs-8">
									<div class="input-group input-append date form_date">
									  <input  id="insertTime1" name="insertTime1" readonly="readonly"  
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
					    <div class="col-lg-4 col-md-4 col-xs-4">
								<div class="row form-group">
									<div class="col-xs-4" align="left">
										<label for="vinNo" class="control-label">车辆状态:</label>
									</div>
									<div class="col-xs-8">
										<ce:select list="#{'':'--请选择--','1':'新车','2':'一年以内次新车','3':'1年至2年在用车','4':'2年至3年在用车','5':'3年至4年在用车','6':'5年至6年在用车'}"
													id="carState" name="carState"
													cssClass="form-control"  ></ce:select>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-4">
								<div class="row form-group">
									<div class="col-xs-4" align="left">
										<label for="userName" class="control-label">服务类型:</label>
									</div>
									<div class="col-xs-8">
										 <ce:select list="#{'':'--请选择--','1':'赔付包含购置税'}"
													id="serviceType" name="serviceType"
													cssClass="form-control"  ></ce:select>
									</div>
								</div>
							</div>
						<div class="col-lg-4 col-md-4 col-xs-4">
								<div class="row form-group">
									<div class="col-xs-4" align="left">
										<label for="userName" class="control-label">服务期限：</label>
									</div>
									<div class="col-xs-8">
										 <ce:select list="#{'':'--请选择--','1':'1年','2':'2年','3':'3年','4':'4年','5':'5年'}"
													id="serviceDate" name="serviceDate"
													cssClass="form-control"  ></ce:select>
									</div>
								</div>
							</div>
				     </div>
						<div class="row">
							<div class="col-lg-6 col-md-6 col-xs-6">
								<div class="row form-group">
									<div class="col-xs-10" align="left"></div>
									<div class="col-xs-2">
										<button class="btn btn-primary btn-outline btn-search" id="search" type="button" >查询</button>
									</div>
								</div>
							</div>	
							<div class="col-lg-6 col-md-6 col-xs-6">
								<div class="row form-group">
									<div class="col-xs-12">
										<button class="btn btn-primary btn-outline btn-search"  type="button"  id="resetContract" >重置</button>
									</div>
								</div>
							</div>	
						</div>	
						<div class="table-responsive" >
							<table   class="table table-striped table-bordered table-sort" 
								id="information" >
								<thead>
									<tr align="center">
										<th><input id="checkAll"  type="checkbox" ></th>
										<th>合同号</th>
										<!-- <th>保单号</th> -->
									<!-- 	<th>主数据状态</th> -->
										<th>车主</th>
										<th>品牌</th>
										<th>车系</th>
										<th>车型</th>
										<th>车辆状态</th>
										<th>保存日期</th>
										<th>服务类型</th>
										<th>结算金额(元)</th>
										<th>服务期限</th>
										<th>经销商简称</th>
										<th>创建日期</th>
										<th>更新日期</th>
										<th>操作者</th>
									</tr>
								 </thead>
								<tbody>									
								</tbody>
							</table>
						</div>
					  </div>
					<!--   <input  type = "hidden" id="policyNoComplex"  name="policyNoComplex"/>
					  <input  type = "hidden" id="orgNameComplex"   name="orgNameComplex"/>
					  <input  type = "hidden" id="insertTimeComplex"  name="insertTimeComplex"/>
					  <input  type = "hidden" id="insertTime1Complex"  name="insertTime1Complex"/>
					  <input  type = "hidden" id="contractNoComplex"  name="contractNoComplex"/>
					  <input  type = "hidden" id="vinNoComplex"  name="vinNoComplex"/>
					  <input  type = "hidden" id="ownerNameComplex"  name="ownerNameComplex"/>
					  <input  type = "hidden" id="carStateComplex"  name="carStateComplex"/>
					  <input  type = "hidden" id="serviceTypeComplex"  name="serviceTypeComplex"/>
					  <input  type = "hidden" id="serviceDateComplex"  name="serviceDateComplex"/> -->
					</form>
				</div>
			</div>
		</div>
	</div>
	<%--<div id="moreSearchModal"  class="modal fade" role="dialog"  data-backdrop="false" tabindex="-1" style="display:none;">
	<div class="modal-dialog modal-lg">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close glyphicon glyphicon-remove-circle"
				data-dismiss="modal" aria-hidden="true" id="closeDialog"></button>
			<h4 class="modal-title" id="myModalLabel" class="panel panel-primary">高级搜索</h4>
		</div>
		<div class="modal-body"> 
				<div class="row">
					<div class="col-lg-2 col-md-2 col-xs-2"></div>

					<div class="col-lg-6 col-md-6 col-xs-6">
						<div class="row form-group">
							<div class="col-xs-4" align="right">
								<label for="policyNo" class="control-label">保单号：</label>
							</div>
							<div class="col-xs-8">
								<input type="text" id="showPolicyNo" name="showPolicyNo"  class="form-control"   >
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-2 col-md-2 col-xs-2"></div>
					<div class="col-lg-6 col-md-6 col-xs-6">
						<div class="row form-group">
							<div class="col-xs-4" align="right">
								<label for="simpleOrgName" class="control-label">经销商简称：</label>
							</div>
							<div class="col-xs-8">
								<input type="text" id="showOrgName" name="showOrgName"  class="form-control"   >
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-2 col-md-2 col-xs-2"></div>
					<div class="col-lg-6 col-md-6 col-xs-6">
						<div class="row form-group">
							<div class="col-xs-4" align="right">
								<label for="simpleOrgName" class="control-label">保存日期起期：</label>
							</div>
							<div class="col-xs-8">
								<div class="input-group input-append date form_date">
									  <input  id="showInsertTime" name="showInsertTime" readonly="readonly"  
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
					<div class="col-lg-2 col-md-2 col-xs-2"></div>
					<div class="col-lg-6 col-md-6 col-xs-6">
						<div class="row form-group">
							<div class="col-xs-4" align="right">
								<label for="simpleOrgName" class="control-label">保存日期止期：</label>
							</div>
							<div class="col-xs-8">
								<div class="input-group input-append date form_date">
									  <input  id="showInsertTime1" name="showInsertTime1" readonly="readonly"  
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
					<div class="col-lg-2 col-md-2 col-xs-2"></div>
					<div class="col-lg-6 col-md-6 col-xs-6">
						<div class="row form-group">
							<div class="col-xs-4" align="right">
								<label for="simpleOrgName" class="control-label">合同号：</label>
							</div>
							<div class="col-xs-8">
								<input type="text" id="showContractNo" name="showContractNo"  class="form-control"   >
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-lg-2 col-md-2 col-xs-2"></div>
					<div class="col-lg-6 col-md-6 col-xs-6">
						<div class="row form-group">
							<div class="col-xs-4" align="right">
								<label for="simpleOrgName" class="control-label">车架号：</label>
							</div>
							<div class="col-xs-8">
								<input type="text" id="showVinNo" name="showVinNo"  class="form-control"   >
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="row">
					<div class="col-lg-2 col-md-2 col-xs-2"></div>
					<div class="col-lg-6 col-md-6 col-xs-6">
						<div class="row form-group">
							<div class="col-xs-4" align="right">
								<label for="simpleOrgName" class="control-label">车主：</label>
							</div>
							<div class="col-xs-8">
								<input type="text" id="showoOwnerName" name="showoOwnerName"  class="form-control"   >
							</div>
						</div>
					</div>
				</div>
				
			    <div class="row">
					<div class="col-lg-2 col-md-2 col-xs-2"></div>
					<div class="col-lg-6 col-md-6 col-xs-6">
						<div class="row form-group">
							<div class="col-xs-4" align="right">
								<label for="simpleOrgName" class="control-label">车辆状态：</label>
							</div>
							<div class="col-xs-8">
								<ce:select list="#{'':'','1':'新车','2':'一年以内次新车','3':'1年至2年在用车','4':'2年至3年在用车','5':'3年至4年在用车','6':'5年至6年在用车'}"
													id="showCarState" name="showCarState"
													cssClass="form-control"  ></ce:select>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-lg-2 col-md-2 col-xs-2"></div>
					<div class="col-lg-6 col-md-6 col-xs-6">
						<div class="row form-group">
							<div class="col-xs-4" align="right">
								<label for="simpleOrgName" class="control-label">服务类型：</label>
							</div>
							<div class="col-xs-8">
								 <ce:select list="#{'':'','1':'赔付包含购置税'}"
													id="showServiceType" name="showServiceType"
													cssClass="form-control"  ></ce:select>
							</div>
						</div>
					</div>
				</div>
				
					<div class="row">
					<div class="col-lg-2 col-md-2 col-xs-2"></div>
					<div class="col-lg-6 col-md-6 col-xs-6">
						<div class="row form-group">
							<div class="col-xs-4" align="right">
								<label for="simpleOrgName" class="control-label">服务期限：</label>
							</div>
							<div class="col-xs-8">
								<ce:select list="#{'':'','1':'1年','2':'2年','3':'3年','4':'4年','5':'5年'}"
													id="showServiceDate" name="showServiceDate"
													cssClass="form-control"  ></ce:select>
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="row">
					<div class="col-lg-6 col-md-6 col-xs-6">
						<div class="col-xs-12">
							<div  style="text-align: right;">
								<button class="btn btn-primary btn-outline btn-submit"
									type="button" id="submitQuery">确定</button>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-xs-6">
						<div class="col-xs-10">
							<div  style="text-align: left;">
								<button class="btn btn-primary btn-outline btn-returnQuery"
									type="button"  id="cancelQuery">取消</button>

							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
</div>
	</div> --%>
</body>
</html>