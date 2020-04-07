<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/static/common/taglibs.jsp"%>
<script type="text/javascript"	src="${ctx}/views/js/UIUserMsgOperate.js"></script>
<div class="modal-dialog modal-lg" data-backdrop="false">
    <div class="modal-content">
      <div class="modal-header">
			<button type="button" class="close glyphicon glyphicon-remove-circle"
				data-dismiss="modal" aria-hidden="true" id="closeUserDialog"></button>
			<h4 class="modal-title" id="myModalLabel" class="panel panel-primary">${message }</h4>
      </div>
     <div class="modal-body">
    	<form id="fm" name="fm"   action="${ctx}/userMsg/saveUserMsg.do" method="post">
              <div class="row">
                     <div class="col-lg-2 col-md-2 col-xs-2"></div>
				     <div class="col-lg-6 col-md-6 col-xs-6">
					 <div class="row form-group">
						<div class="col-xs-3" align="right">
							<label for="userMsgVo.userCode" class="control-label">用户代码</label>
						</div>
						<div class="col-xs-8">
						<input  class="form-control"  id="userCode" name="userCode"  placeholder="自动生成" readonly="readonly" value ="${userMsg.userCode }">
					</div>
				</div>
			   </div>
		   </div>
		      <div class="row">
                     <div class="col-lg-2 col-md-2 col-xs-2"></div>
				     <div class="col-lg-6 col-md-6 col-xs-6">
					 <div class="row form-group">
						<div class="col-xs-3" align="right">
							<label for="userMsgVo.orgName" class="control-label">机构名称</label>
						</div>
						<div class="col-xs-8">
						<input   class="form-control" id="orgName" name="orgName" maxlength="50" value ="${userMsg.orgName }"  ${editType == 'view' ? 'readonly' : ''}>
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
						<input  class="form-control" id="userName" name="userName" maxlength="30"   value ="${userMsg.userName }"   ${editType == 'view' ? 'readonly' : ''}>
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
						<input   class="form-control"  id="telPhone" name="telPhone"  maxlength="11"  value ="${userMsg.telPhone }"     ${editType == 'view' ? 'readonly' : ''} >
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
						id="saveUserMsg" type="button" >保存</button>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-xs-6">
				<div class="col-xs-10">
					<div class="btn-toolbar" style="text-align: left;">
						 <button class="btn btn-primary btn-outline btn-close"
						id="closeDialog" type="button" >关闭</button>
							
					</div>
				</div>
			</div>
		   </c:if>
			<c:if test="${editType == 'view' }">
			    	<div class="col-lg-12 col-md-12 col-xs-12">
			    	<div class="col-lg-5 col-md-5 col-xs-5"></div>
			    	<div class="col-lg-7 col-md-7 col-xs-7">
					<div style="text-align:left;">
						 <button class="btn btn-primary btn-outline btn-close"
						id="closeDialog" type="button" >关闭</button>
					</div>
			    	</div>
			</div>
			</c:if>
		</div>
       </form>
   </div>
  </div>
</div>
