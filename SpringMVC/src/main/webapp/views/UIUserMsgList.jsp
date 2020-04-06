<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/static/common/taglibs.jsp"%>
<head>
<style>
th {
white-space: nowrap; 
}
.modal-backdrop {
 	 /* opacity: 0 !important; */
 	  filter: alpha(opacity=0) !important; 
}
</style>
<title>用户信息展示页面</title>
<script type="text/javascript"	src="${ctx}/views/js/UIUserMsgList.js"></script>
</head>
<body>
<div class="row">
		   <div class="col-lg-12">
		    <div class="panel-body">
			<div style="text-align: left;">
				<button class="btn btn-primary  glyphicon glyphicon-plus"
					id="add" type="button"  data-toggle="modal" data-target="#myModal" >新增</button>
				<button class="btn btn-primary glyphicon glyphicon-pencil"
					id="edit" type="button" >修改</button>
				<button class="btn btn-primary glyphicon glyphicon-remove" id="remove"
					type="button" onclick="window.location.href='${ctx}/user/createNewUser.do'">删除</button>
			    	<button class="btn btn-primary glyphicon glyphicon-eye-open" id="view"
					type="button" onclick="window.location.href='${ctx}/user/createNewUser.do'">浏览</button>
			  </div>
			</div>
		  </div>
	</div>
	<div class="panel-group" id="accordion">
		<div class="col-lg-12">
			<div class="panel panel-info" id="showTitle"  >
				<div id="collapseTwo" class="panel-collapse" >
					<div class="panel-body" >
						<div class="table-responsive" >
							<table   class="table table-striped table-bordered table-sort" 
								id="information">
								<thead>
									<tr>
										<th><input id="checkAll" type="hidden">序列</th>
										<th>用户名</th>
										<th>密码</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>									
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 模态框（Modal） -->
   <div id="myModal"  class="modal fade" role="dialog" data-backdrop="false" tabindex="-1" style="display:none;"></div>
</body>
</html>