
$().ready(function() {
    $('#userMsgfm').validate({
	   onsubmit:true,// 是否在提交是验证
	   onFocus: function () {
	        this.parent().addClass('active');
	        return false;
	   },
	   onBlur: function () {
	        var $parent = this.parent();
	        var _status = parseInt(this.attr('data-status'));
	        $parent.removeClass('active');
	        if (!_status) {
	            $parent.addClass('error');
	        }
	        return false;
	   },
       rules: {
    	   userPwd:{required: true},
   	     confirmPwd: {equalTo: "#userPwd"}
       },
       messages: {
    	 userPwd:{required: "请输入新密码"},
     	 confirmPwd: {
     		 equalTo: "两次密码输入不相同"
         }
      },
      submitHandler: function(form) { 
    		$.ajax({
				type : "POST",
				url : contextRootPath + '/userMsg/updateUserMsgPassWd.do',
				data :"userPwd="+$("#userPwd").val(),
				async : false,
				success : function(obj) {
					if(obj=='更新密码成功'){
						alert(obj);
						window.location.href=contextRootPath + "/contract/contractList.do";
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert("请联系系统管理员");
				}
			});
      },
      invalidHandler: function(form, validator) {return false;}
   });
});


