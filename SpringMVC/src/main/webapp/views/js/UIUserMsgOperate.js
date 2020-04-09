/**
 * @describe:关闭弹出框
 * @returns
 */
$(function(){
	$("#closeDialog").click(
		function(){
			$("#closeUserDialog").click();
     })
});

/**
 * @describe:保存用户信息
 * @returns
 */
$(function(){
	$("#saveUserMsg").click(
		function(){
		    $("#userfm").submit();
     })
	
});

/**
 * @describe:重置功能
 * @returns
 */
$(function(){
	$("#resetUser").click(
		function(){
		    $("#userfm")[0].reset();
     })
	
});



/**
 * @describe:点击查询按钮
 * @returns
 */
$(function(){
	$("#searchComPany").click(
			function(){
				var orgName = $('#orgName').val();
				var url = contextRootPath + "/userMsg/prepareOrganization.do?orgName="+orgName;
				var $modal = $('#myModal');
				$modal.load(url, '',
				function() {
					$modal.modal();
				});
				
	})
});



$('form').validate({
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
    }
});




$().ready(function() {

	 $("#userfm").validate({

	   rules: {
		   userName: "required",
		   orgName:"required",
		   userPwd:{required :true,maxlength: 10},
		   telPhone:{isMobile:true}
	  },

	   messages: {
	    	userName: "请输入用户名称",
	    	 orgName:"请输入机构名称",
	    	 userPwd:{
	    		 required: "请输入用户密码",
	    		 maxlength: "密码长度不能大于10位"
	    	  }
       }

	    });

});
