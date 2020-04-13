//手机号码验证  
jQuery.validator.addMethod("isMobile", function(value, element) {  
 var length = value.length;  
 var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;  
 return this.optional(element) || (length == 11 && mobile.test(value));  
}, "请正确填写手机号码");

/**
 * trim
 */
 function trim(str) { 
 	if(str == undefined){
 		return "";
 	}else{					
		str = str + "";
	}
	return str.replace(/^\s*(.*?)[\s\n]*$/g, '$1'); 
 }
/**
 * 身份证校验
 * @param idcard-证件号吗
 * @returns {Boolean}
 */
function checkIdentifyCard(idcard,identifyType) {
	if (trim(idcard) != "") {
		var areaALL = {
				11 : "北京",
				12 : "天津",
				13 : "河北",
				14 : "山西",
				15 : "内蒙古",
				21 : "辽宁",
				22 : "吉林",
				23 : "黑龙江",
				31 : "上海",
				32 : "江苏",
				33 : "浙江",
				34 : "安徽",
				35 : "福建",
				36 : "江西",
				37 : "山东",
				41 : "河南",
				42 : "湖北",
				43 : "湖南",
				44 : "广东",
				45 : "广西",
				46 : "海南",
				50 : "重庆",
				51 : "四川",
				52 : "贵州",
				53 : "云南",
				54 : "西藏",
				61 : "陕西",
				62 : "甘肃",
				63 : "青海",
				64 : "宁夏",
				65 : "新疆",
				71 : "台湾",
				81 : "香港",
				82 : "澳门",
				91 : "国外"
			}
		
		var areaGAT ={
				830000 : "台湾",
				810000 : "香港",
				820000 : "澳门"
		}
		if(identifyType=='01'){
			var Errors = new Array("验证通过!", "身份证号码位数不对!", "身份证号码出生日期超出范围或含有非法字符!",
					"身份证号码校验错误!", "身份证地区非法!");
			// 身份证地区校验   add  by  gpc  20181011
			if (areaALL[parseInt(idcard.substr(0, 2))] == null) {
				alert(Errors[4]);
				return false;
			}
			
		}else if(identifyType=='17'){
			var Errors = new Array("验证通过!", "港澳台居民居住证号码位数不对!", "港澳台居民居住证号码出生日期超出范围或含有非法字符!",
					"港澳台居民居住证号码校验错误!", "港澳台居民居住证地区非法!");
			// 港澳台地区校验   add  by  gpc  20181011
			if (areaGAT[parseInt(idcard.substr(0, 6))] == null) {
				alert(Errors[4]);
				return false;
			}
		}
		var idcard, Y, JYM;
		var S, M;
		var idcard_array = new Array();
		idcard_array = idcard.split("");

		// 身份号码位数及格式检验
		switch (idcard.length) {
		case 15:
			if ((parseInt(idcard.substr(6, 2)) + 1900) % 4 == 0
					|| ((parseInt(idcard.substr(6, 2)) + 1900) % 100 == 0 && (parseInt(idcard
							.substr(6, 2)) + 1900) % 4 == 0)) {
				ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;// 测试出生日期的合法性
			} else {
				ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;// 测试出生日期的合法性
			}
			if (ereg.test(idcard)) {
				alert(Errors[0]);
				return true;
			} else {
				alert(Errors[2]);
				return false;
			}
			break;
		case 18:
			// 18位身份号码检测
			// 出生日期的合法性检查
			// 闰年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))
			// 平年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))
			//ZCLG0427 身份证号允许录入20XX年 mod LiGe 20180427
			if (parseInt(idcard.substr(6, 4)) % 4 == 0
					|| (parseInt(idcard.substr(6, 4)) % 100 == 0 && parseInt(idcard
							.substr(6, 4)) % 4 == 0)) {
				ereg = /^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;// 闰年出生日期的合法性正则表达式
			} else {
				ereg = /^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;// 平年出生日期的合法性正则表达式
			}
			if (ereg.test(idcard)) {// 测试出生日期的合法性
				// 计算校验位
				S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10]))
						* 7
						+ (parseInt(idcard_array[1]) + parseInt(idcard_array[11]))
						* 9
						+ (parseInt(idcard_array[2]) + parseInt(idcard_array[12]))
						* 10
						+ (parseInt(idcard_array[3]) + parseInt(idcard_array[13]))
						* 5
						+ (parseInt(idcard_array[4]) + parseInt(idcard_array[14]))
						* 8
						+ (parseInt(idcard_array[5]) + parseInt(idcard_array[15]))
						* 4
						+ (parseInt(idcard_array[6]) + parseInt(idcard_array[16]))
						* 2 + parseInt(idcard_array[7]) * 1
						+ parseInt(idcard_array[8]) * 6
						+ parseInt(idcard_array[9]) * 3;
				Y = S % 11;
				M = "F";
				JYM = "10X98765432";
				M = JYM.substr(Y, 1);// 判断校验位
				if (M == idcard_array[17]) {
					// alert(Errors[0]+"18" );
					return true; // 检测ID的校验位
				} else {
					alert(Errors[3]);
					return false;
				}
			} else {
				alert(Errors[2]);
				return false;
			}
			break;
		default:
			alert(Errors[1]);
			return false;
			break;
		}
	}
}



/**
 * @功能：组织机构代码验证
 * @author: wangyanqing
 */
function isValidEntpCode(code) {

	var ws = [ 3, 7, 9, 10, 5, 8, 4, 2 ];
	var str = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
	var reg = /^([0-9A-Z]){8}-?[0-9X]{1}$/;
	if (!reg.test(code)) {
		alert("组织机构代码格式错误！例：78305975-3或783059753");
		return false;
	}
	var parityBit = code.charAt(code.length - 1);
	var sum = 0;
	for ( var i = 0; i < 8; i++) {
		sum += str.indexOf(code.charAt(i)) * ws[i];
	}
	var C9 = 11 - (sum % 11);
	if (C9 == 11) {	//C9='0'
		if('0' != parityBit){
			alert("组织机构代码错误！");
			return false;
		}
	} else if (C9 == 10) {	//C9=='X'
		if('X' != parityBit){
			alert("组织机构代码错误！");
			return false;
		}
	} else {
		if(C9 != parityBit){
			alert("组织机构代码错误！");
			return false;
		}
	}
	return true;

}