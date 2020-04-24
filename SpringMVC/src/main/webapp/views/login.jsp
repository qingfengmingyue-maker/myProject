<?xml version="1.0" encoding="utf-8"?>
<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html>
 <%@ include file="/static/common/taglibs.jsp"%>
<html>
  <head>
    <title>中保泰和订单管理系统</title>
    <meta http-equiv=”Content-Type” content=”text/html; charset=utf-8>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <script  type="text/javascript" src="${ctx}/static/widgets/jquery/jquery-1.11.1.js"></script>
    <script src="${ctx}/static/widgets/nicescroll/jquery.nicescroll.js"></script>
	<script src="${ctx}/static/widgets/slimscroll/jquery.slimscroll.min.js"></script>
    <script type="text/javascript"	src="${ctx}/static/common/js/frame.js"></script>
    <script src="${ctx}/static/widgets/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <link  href="${ctx}/static/widgets/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet"> 
	<link href='${ctx}/static/common/css/frame.css' rel="stylesheet" type="text/css" />
	<link href="${ctx}/static/common/css/login.css" rel="stylesheet" type="text/css" />
	<link href='${ctx}/static/common/css/frame-responsive.css' rel="stylesheet" type="text/css" />
	<script language="javascript">
	 function submitForm() {
		if (fm.userCode.value == "") {
			alert("用户名不能为空!");
		}else if (fm.userPwd.value == "") {
			alert("密码不能为空!");
		}else if (fm.validateCode.value == "") {
			alert("验证码不能为空！");
		}else{
		   fm.submit();
		}
	}
	function init() {
		fm.userCode.focus();
		fm.userCode.select();
	} 
	function reloadValidateCode(){
       $("#validateCodeImg").attr("src", contextRootPath+'/validate/validateCode.do?'+Math.random());
     }
</script>
  </head>
  <body class="login tooltips">
		<div class="login-header text-center">
		</div>
		<div class="login-wrapper">
			<form role="form" name="fm" id="fm"	 action="${ctx}/saaUserPower/login.do" method="post">
				<DIV align="center" style="color:#2ac7ff;font-size:25px">
					登录账号
				</DIV>
			    <div style="color: deeppink" align="center">
                  <p>${message }</p>  <%--这里显示上边的controller里边用户或者密码错误的信息--%>
               </div>
				<div class="form-group has-feedback lg left-feedback no-label">
				  <input type="text" class="form-control input-lg rounded" 
				  	style=" border:0.5px solid #2ac7ff" name="userCode" maxlength="10" placeholder="用户名" autofocus  value="">
				   <span class="glyphicon  glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback lg left-feedback no-label">
				  <input type="password" class="form-control input-lg rounded" 
				  	style=" border:0.5px solid #2ac7ff" name="userPwd" placeholder="密&nbsp;&nbsp;&nbsp;码"  value="">
				   <span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback lg left-feedback no-label">
				  <div class="row form-group">
						<div class="col-xs-7">
							<input class="form-control no-border input-lg rounded" 
							style=" border:0.5px solid #2ac7ff"placeholder="验证码"
								name="validateCode" id="validateCode">
						</div>
						<div class="col-xs-3">
							<img id="validateCodeImg" onClick="reloadValidateCode()" src="${ctx }/validate/validateCode.do" />
						</div>
					</div>
					
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-success btn-lg  btn-block" 
						style="background-color:'#2ac7ff'"onClick="submitForm()">登&nbsp;&nbsp;录</button>
				</div>
			</form>
		</div>
	</body>
</html>
