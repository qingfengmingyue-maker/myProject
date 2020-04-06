<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<div class="modal-dialog modal-lg" data-backdrop="false">
    <div class="modal-content">
      <div class="modal-header">
			<button type="button" class="close glyphicon glyphicon-remove-circle"
				data-dismiss="modal" aria-hidden="true" id="closeExamDialog"></button>
			<h4 class="modal-title" id="myModalLabel" class="panel panel-primary">新增用户</h4>
      </div>
     <div class="modal-body">
    	<form id="createNewUserMsg"  action="${ctx }/userMsg/saveUserMsg.do">
              <div class="row">
                     <div class="col-lg-2 col-md-2 col-xs-2"></div>
				     <div class="col-lg-6 col-md-6 col-xs-6">
					 <div class="row form-group">
						<div class="col-xs-3" align="right">
							<label for="userMsgVo.userCode" class="control-label">用户代码</label>
						</div>
						<div class="col-xs-8">
						<input  class="form-control"  id="userMsgVo.userCode" name="userMsgVo.userCode">
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
						<input   class="form-control" id="userMsgVo.orgName" name="userMsgVo.orgName" >
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
						<input   class="form-control" id="userMsgVo.userName" name="userMsgVo.userName" >
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
						<input   class="form-control"  id="userMsgVo.telphone" name="userMsgVo.telphone" >
					</div>
				</div>
			  </div>
		 </div>
		 <div class="row">
			<div class="col-lg-12 col-md-12 col-xs-12">
				<div class="btn-toolbar" style="text-align: center;" >
					<button class="btn btn-primary btn-outline btn-save"
						id="saveUserMsg" type="button"  onClick="submitForm()">保存</button>
				    <button class="btn btn-primary btn-outline btn-save"
						id="close" type="button"  onClick="closeDialog()">关闭</button>
				</div>
			</div>
		</div>
       </form>
   </div>
  </div>
</div>
