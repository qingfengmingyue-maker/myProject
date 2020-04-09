//删除  修改 浏览 之前校验只能选择一条数据  
function selectOne(){
	var delList=$("input[name=checkCode]:checked");
	var codeList= new Array();
	for(var i=0;i<delList.length;i++){					
		if(delList[i].checked){						
			codeList[i]=delList[i].id;			
		  }
	}
	if(codeList.length>1){
		alert("请选择一条数据！");
		$("input[type=checkbox]").attr("checked",false);
	}else if(codeList.length<1){
		alert("请选择一条数据！");
	}else{
		return codeList;
	}
}
function codeToNum(c){
	if(c == "0"){
	    return 0;
	}else if(c == "1"){
	    return 1;
	}else if(c == "2"){
	    return 2;
	}else if(c == "3"){
	    return 3;
	}else if(c == "4"){
	    return 4;
	}else if(c == "5"){
	    return 5;
	}else if(c == "6"){
	    return 6;
	}else if(c == "7"){
	    return 7;
	}else if(c == "8"){
	    return 8;
	}else if(c == "9"){
	    return 9;
	}else if(c == "A"){
	    return 10;
	}else if(c == "B"){
	    return 11;
	}else if(c == "C"){
	    return 12;
	}else if(c == "D"){
	    return 13;
	}else if(c == "E"){
	    return 14;
	}else if(c == "F"){
	    return 15;
	}else if(c == "G"){
	    return 16;
	}else if(c == "H"){
	    return 17;
	}else if(c == "J"){
	    return 18;
	}else if(c == "K"){
	    return 19;
	}else if(c == "L"){
	    return 20;
	}else if(c == "M"){
	    return 21;
	}else if(c == "N"){
	    return 22;
	}else if(c == "P"){
	    return 23;
	}else if(c == "Q"){
	    return 24;
	}else if(c == "R"){
	    return 25;
	}else if(c == "T"){
	    return 26;
	}else if(c == "U"){
	    return 27;
	}else if(c == "W"){
	    return 28;
	}else if(c == "X"){
	    return 29;
	}else if(c == "Y"){
	    return 30;
	}
}

function numToCode(c){
	if(c == 0 || c==31){
	    return "0";
	}else if(c == 1){
	    return "1";
	}else if(c == 2){
	    return "2";
	}else if(c == 3){
	    return "3";
	}else if(c == 4){
	    return "4";
	}else if(c == 5){
	    return "5";
	}else if(c == 6){
	    return "6";
	}else if(c == 7){
	    return "7";
	}else if(c == 8){
	    return "8";
	}else if(c == 9){
	    return "9";
	}else if(c == 10){
	    return "A";
	}else if(c == 11){
	    return "B";
	}else if(c == 12){
	    return "C";
	}else if(c == 13){
	    return "D";
	}else if(c == 14){
	    return "E";
	}else if(c == 15){
	    return "F";
	}else if(c == 16){
	    return "G";
	}else if(c == 17){
	    return "H";
	}else if(c == 18){
	    return "J";
	}else if(c == 19){
	    return "K";
	}else if(c == 20){
	    return "L";
	}else if(c == 21){
	    return "M";
	}else if(c == 22){
	    return "N";
	}else if(c == 23){
	    return "P";
	}else if(c == 24){
	    return "Q";
	}else if(c == 25){
	    return "R";
	}else if(c == 26){
	    return "T";
	}else if(c == 27){
	    return "U";
	}else if(c == 28){
	    return "W";
	}else if(c == 29){
	    return "X";
	}else if(c == 30){
	    return "Y";
	}
}
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