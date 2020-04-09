window.onload=function(){
	alert(document.getElementById("upperBaseOrgName").value)
}
$(function() {
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
	$("#saveOrgbtn").click(function(){
		$("#createNewOrg").submit();
	});
	$("#closeOrgbtn").click(function(){
		$("#closeExamDialog").click();
	});
	$("#upperBaseOrg").change(function(){
		$("#upperBaseOrgName").val($("#upperBaseOrg").find("option:selected").text());
		var upperBaseOrg = $("#upperBaseOrg").val();
		$.ajax({
			typr:"POST",
			url:contextRootPath+'/organiz/getSubOrg.do',
			data:"upperBaseOrg="+ upperBaseOrg,
			async : false,
			success:function(obj){
				if(obj != null){
					var cityCode =$("#cityCode").val();
					$("#cityCode").empty(); 
					for(var i =0 ;i<obj.length;i++){
						$("#cityCode").append("<option value='"+obj[i].cityCode+"'>"+obj[i].cityName+"</option>");
					}
					if(cityCode != null && cityCode != ""){
						$("#cityCode").val(cityCode);
					}
					$("#cityName").val($("#cityCode").find("option:selected").text());
				}
			},
			error:function(){
				
			}
			
		})
	});
	$("#cityCode").focus(function(){
		if($('#cityCode option').length==1){
			$("#upperBaseOrg").change()
		};
	});
	$("#cityCode").change(function(){
		$("#cityName").val($("#cityCode").find("option:selected").text());
	})
	
});
$().ready(function() {
	$("#createNewOrg").validate({
		rules: {
		},
		messages: {
		}
	});
	
});
/**
 * 校验统一社会信用代码
 * @param field
 * @returns {Boolean}
 */
function isChinaUnifiedSocialCreditCode(field){
	var strNo = field.value;
	strNo = strNo.toString();
	if(strNo.length == 18){
		strNo = strNo.toUpperCase(); // 转为大写
		//统一社会信用代码前17位不一定全部是数字，可以有字母存在
		patrn = /^[0123456789ABCDEFGHJKLMNPQRTUWXY]{18}$/;
		if(!patrn.exec(strNo)){
			alert("统一社会信用代码错误，请核对后重新录入！");
			field.value="";
			return false;
		}
		if("000000000000000000" == strNo){
			alert("统一社会信用代码错误，请核对后重新录入！");
			//document.getElementById("prpCinsured.unifiedSocialCreditCode").value="";
			field.value="";
			return false;
		}
		//第9-17位，主体标识码，即组织机构代码，共9位
		var sum = 0;
		var weights = [1, 3, 9, 27, 19, 26, 16, 17, 20, 29, 25, 13,  8, 24, 10, 30, 28];
		for(var i=0;i<17;i++){
			sum += codeToNum(strNo.substr(i, 1)) * weights[i];
		}
		var c18 = 31 - sum % 31;
		if(c18 >= 10 ){
			// 最后一位为校验位
			c = strNo.substr(17, 1).toUpperCase(); // 转为大写
		}else{
			c = strNo.substr(17, 1);
		}
		
		if(numToCode(c18) == c){
			field.value=strNo;
			return true;
		}else{
			alert("统一社会信用代码错误，请核对后重新录入！");
			field.value="";
			return false;
		}
 	}else{
 		alert("输入的统一社会信用代码必须为18位！");
 		field.value="";
 		return false;
 	}
}