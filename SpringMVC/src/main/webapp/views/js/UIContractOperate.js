Date.prototype.Format = function(fmt) 
{ //author: meizz 
var o = { 
 "M+" : this.getMonth()+1,                 //月份 
 "d+" : this.getDate(),                    //日 
 "h+" : this.getHours(),                   //小时 
 "m+" : this.getMinutes(),                 //分 
 "s+" : this.getSeconds(),                 //秒 
 "q+" : Math.floor((this.getMonth()+3)/3), //季度 
 "S"  : this.getMilliseconds()             //毫秒 
}; 
if(/(y+)/.test(fmt)) 
 fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
for(var k in o) 
 if(new RegExp("("+ k +")").test(fmt)) 
fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length))); 
return fmt; 
}




/**
 * @describe:保存合同信息
 * @returns
 */
$(function(){
	$("#temptSaveButton").click(
		function(){
		    $("#contractfm").submit();
     })
});



window.onload=function(){ 
	var editType = $('#editType').val();
	if('view' == editType){
		$(":input").attr("disabled", true);
	}else{
		$(".form_date").datetimepicker({
			format : "yyyy-mm-dd",
			language : "zh-CN",
			autoclose : true,
			todayBtn : true,
			todayHighlight : true,
			showMeridian : false,
			minView : "month",
			pickerPosition : "bottom-left"
		});
	}
	$('#dropdownMenu2').attr("disabled", false);
}



