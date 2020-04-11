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
 * @describe:暂存合同信息
 * @returns
 */
$(function(){
	$("#temptSaveButton").click(
		function(){
			 $(".error").remove();//清除验证标签
			 $('#saveType').val('0');
			 //获取文本框的值并进行赋值
			var insuranceType = '';
			$("input[name='insuranceType']:checked").each(function(i){
				insuranceType = insuranceType+$(this).val()+","
			})
			if(insuranceType.Length !=0){
				insuranceType = insuranceType.substring(0,insuranceType.length - 1);
			}
			$('#VehicleMsg\\.insuranceType').val(insuranceType);
			$("#contractfm").submit();
     })
});


/**
 * @describe:保存合同信息
 * @returns
 */
$(function(){
	$("#saveButton").click(
		function(){
			 $("#contractfm").validate({
				   rules: {
				  },

				   messages: {
			       }
			});
			 //获取文本框的值并进行赋值
			var insuranceType = '';
			$("input[name='insuranceType']:checked").each(function(i){
				insuranceType = insuranceType+$(this).val()+","
			})
			if(insuranceType.Length !=0){
				insuranceType = insuranceType.substring(0,insuranceType.length - 1);
			}
			$('#VehicleMsg\\.insuranceType').val(insuranceType);
		    $("#contractfm").submit();
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
	
	 var checkeds = $("#VehicleMsg\\.insuranceType").val();
	  //拆分为字符串数组
	  var checkArray =checkeds.split(",");
	  //获得所有的复选框对象
	  var checkBoxAll = $("input[name='insuranceType']");
	  for(var i=0;i<checkArray.length;i++){
	         //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
	        $.each(checkBoxAll,function(j,checkbox){
	             //获取复选框的value属性
	               var checkValue=$(checkbox).val();
	                 if(checkArray[i]==checkValue){
	                        $(checkbox).attr("checked",true);
	                 }
	        })
	   }
}






