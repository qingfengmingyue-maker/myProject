/**
 * @功能：获取cookie里面的数据
 * @author:wangyanqing
 * @time:20151125
 */
 function getCookie(name)        
 {
     var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
      if(arr != null) return unescape(arr[2]); return null;
 }
 /**
  * @功能：向cookie里面的存放数据
  * @author:wangyanqing
  * @time:20151125
  */
 function setCookie(name,value)//两个参数，一个是cookie的名子，一个是值
 {
     var Days = 60; //此 cookie 将被保存 30 天
     var exp = new Date();    //new Date("December 31, 9998");
     exp.setTime(exp.getTime() + Days*24*60*60*1000);
     document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
 }
 
 
 
 $(function() {
		var flag = false;
		var strCookie = getCookie("userMsgPwd");
		if(strCookie != null ){
			flag = true;	
		}
		if (!flag) {
			var userMsgPwd = $('#userMsgPwd').val();
			if(userMsgPwd == "1234"){
				alert("请修改初始密码");
				setCookie("userMsgPwd",userMsgPwd);
			}
		}
	});