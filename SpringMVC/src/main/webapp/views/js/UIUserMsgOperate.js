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
			fm.submit();
     })
});