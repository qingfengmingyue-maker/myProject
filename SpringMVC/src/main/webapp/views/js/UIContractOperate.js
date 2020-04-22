Date.prototype.Format = function(fmt) 
{ 
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
     });
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
					  appendMsg:'required',
					  reMark:'required'
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
			}else{
				alert("请录入投保险种！");
				return false;
			}
			$('#VehicleMsg\\.insuranceType').val(insuranceType);
			if(!validateFormDate()){
				return false;
			}
			$('#saveType').val('1');
		    $("#contractfm").submit();
     })
});


function validateFormDate(){
	var flag = false;
	var purchaseDate =  $("#VehicleMsg\\.purchaseDate").val();
	var startDate =  $("#startDate").val();
	var endDate =  $("#endDate").val();
	if(purchaseDate == ""){
		alert("请录入首次购车日期");
	}else if(startDate == ""){
		alert("请录入服务起始日期");
	}else if(endDate == ""){
		alert("服务终止日期");
	}else{
		 flag =  true;
	}
	return flag;
}

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
	//服务起始日期默认带出当前日期第二天begin
	var startDate = $('#startDate').val();
	if(startDate ==''){
		$('#startDate').val(AddDays(new Date(),1).Format("yyyy-MM-dd"));
		$('#startDate').change();
	}
	if('edit' == editType){
		$('#startDate').val(AddDays(new Date(),1).Format("yyyy-MM-dd"));
		$('#startDate').change();
	}
	//服务起始日期默认带出当前日期第二天end
	$('#dropdownMenu2').attr("disabled", false);
	$('#goBackButton').attr("disabled", false);
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



/**
 * @describe:校验联系电话
 * 
 */
function checkMobile(field,msg){
	var mobilevalue = field.value;
	var tel =  /^0\d{2,3}-\d{5,9}$/;
	var tel1 =  /^(1(3|4|5|6|7|8|9)\d{9})$/;
	if(mobilevalue!=null&&mobilevalue!="")
	{
		if(!(tel.test(mobilevalue)||tel1.test(mobilevalue))){
			alert("请输入正确的"+msg);
			field.value="";
		}
	}
}


/**
 * @describe:改变证件类型
 * 
 */
function checkDocumentType(){
	$("#PartyB\\.documentNo").change();
}


/**
 * @describe:校验证件号码
 * 
 */
function checkDocumentNo(field){
	var documentNo=trim(field.value);
	if(documentNo==""){
		return;
	}
	//证件类型
	var documentType = $("#PartyB\\.documentType").val();
	// 如果证件类型是身份证
	if (trim(documentType) == "01") {
		// 身份证的校验
		if (!checkIdentifyCard(documentNo,documentType)) {
			field.value="";
		}
	} else if (trim(documentType) == "04") {
		if (!isValidEntpCode(documentNo)) {
			field.value = "";
		}
	} else if (trim(documentType) == "05") {
		if (!isChinaUnifiedSocialCreditCode(field)) {
			field.value = "";
		}
	}
	
	$("#PartyB\\.documentNo").val(field.value);
}
/**
 * @describe:校验VINNO
 * @param field
 * @returns
 */
function checkVINNO(field){
	var VINNOValue = field.value;
	var tel =  /^[A-HJ-NPR-Za-hj-npr-z0-9]{17}$/;
	    if(VINNOValue!=null&&VINNOValue!=""){
	    	if(!tel.test(VINNOValue)){
	    		alert("车架号(VIN码)必须录齐17位数字或字母（不应包含“I”、“O”、“Q”字母），请重新输入");
	    		field.value ='';
	    	}
	    }
}

function checkLicenseNo(field){
	var licenseNoValue = field.value;
	var  tel = /^[\u4e00-\u9fa5]{1}[\u4e00-\u9fa5a-zA-Z0-9]{0,}$|^[A-Za-z]{2}[\u4e00-\u9fa5a-zA-Z0-9]{0,}$/;
	if(licenseNoValue!=null&&licenseNoValue!=""){
		if(!tel.test(licenseNoValue)){
			alert("请输入以汉字或2位英文字母开头的号牌号码 (不应包含特殊字符)");
			 field.value = "";
		}
	}
}



function checkMoney(field,msg){
	var moneyValue = field.value;
    var reg = /(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/;
	if(moneyValue!=null&&moneyValue!=""){
		if(!reg.test(moneyValue)){
			alert(msg+"只能输入正数,请重新输入！");
			 field.value = "";
		}
	}
}





/**
 * @describe:点击经销商查询按钮
 * @returns
 */
$(function(){
	$("#searchComPany").click(
			function(){
				var orgName = $('#PartyA\\.orgName').val();
				var url = contextRootPath + "/userMsg/prepareOrganization.do?orgName="+encodeURI(orgName);
				var $modal = $('#comPanyModal');
				$modal.load(url, '',
				function() {
					$modal.modal();
				});
				
	})
});


/**
 * @describe:点击业务联系人的查询方法
 * @returns
 */
$(function(){
	$("#searchBussinessLinker").click(
		 function(){
				var orgCode = $('#PartyA\\.orgCode').val();
				var orgName = $('#PartyA\\.orgName').val();
				var businessName = $('#PartyA\\.businessName').val();
				if(orgName  == ""){
					alert("请先选择经销商名称");
				}else if(orgName  != "" && orgCode ==""){
					alert("该经销商的经销商代码是空的，请重新选择经销商！");
				}else{
					var url = contextRootPath + "/contract/prepareUserMsg.do?orgCode="+orgCode+"&businessName="+encodeURI(businessName);
					var $modal = $('#userMsgModal');
					$modal.load(url, '',
					function() {
						$modal.modal();
					});
			  }
	 });
});

/**
 * @describe；手动录入经销商进行重置
 * @returns
 */
function resetOrgCode(){
	 $('#PartyA\\.orgCode').val('');
}



/**
 * @describe:返回按钮功能返回到列表页面
 * @returns
 */
$(function(){
	$("#goBackButton").click(
			function(){
			  window.location.href=contextRootPath + "/contract/contractList.do";
	})
});



/**
 * @describe:增加年
 * @returns
 */
function AddYears(date, value) {
    date.setYear(date.getFullYear() + value);
    return date;
}

/**
 * @describe:增加天
 * @returns
 */
function AddDays(date, value) {
    date.setDate(date.getDate() + value);
    return date;
}

/**
 * @describe:服务起始日期和期限变动自动带出服务终止日期
 * @returns
 */
function changeDate(){
	var serviceDate = $('#serviceDate').val();
	var startDate =  $('#startDate').val();
	if(startDate!=''){
		 var tempDate = startDate.replace(/-/g,"/");
		 var date = new Date(tempDate);
	     var endDate_ = AddDays(AddYears(date,parseFloat(serviceDate)),-1).Format("yyyy-MM-dd");
	     $('#endDate').val(endDate_);
	}
}


/**
 * @describe:首次购车日期的校验
 * @returns
 */
function changePurchaseDate(field){
	var purchaseDate =  field.value;
	if(purchaseDate !=''){
		 var purchaseDateTemp = purchaseDate.replace(/-/g,"/");
		 var purchaseDateDate = new Date(purchaseDateTemp);
		 var currentDate = new Date();
		 if(purchaseDateDate > currentDate){
			 alert("首次购车日期不能大于今天,请重新选择！");
			 field.value ='';
		 }else if(AddDays(AddYears(purchaseDateDate,parseFloat(6)),-1) < currentDate){
			 alert("首次购车日期不能选择当前日期的6年前的日期,请重新选择！");
			 field.value ='';
		 }else if(AddDays(new Date(purchaseDate.replace(/-/g,"/")),89) >= currentDate){
			 $('#VehicleMsg\\.carState').val('新车');
		 }else if( AddDays(AddYears(new Date(purchaseDate.replace(/-/g,"/")),1),-1) >= currentDate){
			 $('#VehicleMsg\\.carState').val('一年以内次新车');
		 }else if( AddDays(AddYears(new Date(purchaseDate.replace(/-/g,"/")),2),-1) >= currentDate){
			 $('#VehicleMsg\\.carState').val('1年至2年在用车');
		 }else if( AddDays(AddYears(new Date(purchaseDate.replace(/-/g,"/")),3),-1) >= currentDate){
			 $('#VehicleMsg\\.carState').val('2年至3年在用车');
		 }else if( AddDays(AddYears(new Date(purchaseDate.replace(/-/g,"/")),4),-1) >= currentDate){
			 $('#VehicleMsg\\.carState').val('3年至4年在用车');
		 }else if( AddDays(AddYears(new Date(purchaseDate.replace(/-/g,"/")),5),-1) >= currentDate){
			 $('#VehicleMsg\\.carState').val('4年至5年在用车');
		 }else if( AddDays(AddYears(new Date(purchaseDate.replace(/-/g,"/")),6),-1) >= currentDate){
			 $('#VehicleMsg\\.carState').val('5年至6年在用车');
		 }
	}
}


/**
 * @describe:车辆发票金额（元)自动带出购置税
 * @returns
 */
function changeInvoiceAmount(field){
	var invoiceAmount = field.value;
	if(invoiceAmount != ''){
		 $('#VehicleMsg\\.purchaseAmount').val((field.value/1.13*0.1).toFixed(2));
		
	}
}


/**
 * @describe:改变排量自动带出车船税
 * @returns
 */
function changeDisplacement(field){
	var displacementField = field.value;
	if(displacementField !=''){
		if(displacementField == "01"){
			$("#VehicleMsg\\.taxAmount").val(240);
		}else if(displacementField == "02"){
			$("#VehicleMsg\\.taxAmount").val(420);
		}else if(displacementField == "03"){
			$("#VehicleMsg\\.taxAmount").val(480);
		}else if(displacementField == "04"){
			$("#VehicleMsg\\.taxAmount").val(900);
		}else if(displacementField == "05"){
			$("#VehicleMsg\\.taxAmount").val(1800);
		}else if(displacementField == "06"){
			$("#VehicleMsg\\.taxAmount").val(3000);
		}else if(displacementField == "07"){
			$("#VehicleMsg\\.taxAmount").val(4500);
		}
	}
}