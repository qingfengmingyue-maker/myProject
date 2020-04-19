 function  preview(oper) {

            if(oper < 10) {

                bdhtml =window.document.body.innerHTML;//获取当前页的html代码

                sprnstr = "<!--startprint" + oper + "-->";//设置打印开始区域

                eprnstr = "<!--endprint" + oper + "-->";//设置打印结束区域

                prnhtml =bdhtml.substring(bdhtml.indexOf(sprnstr) + 18); //从开始代码向后取html

                prnhtml = prnhtml.substring(0,prnhtml.indexOf(eprnstr));//从结束代码向前取html

                window.document.body.innerHTML= prnhtml;

                window.print();

                window.document.body.innerHTML =bdhtml;

            } else{

                window.print();

            }

   }
 
 
 
 function intToChinese ( str ) {
	 str = str+'';
	 var len = str.length-1;
	 var idxs = ['','十','百','千','万','十','百','千','亿','十','百','千','万','十','百','千','亿'];
	 var num = ['零','壹','贰','叁','肆','伍','陆','柒','捌','玖'];
	 return str.replace(/([1-9]|0+)/g,function( $, $1, idx, full) {
	  var pos = 0;
	  if( $1[0] != '0' ){
	   pos = len-idx;
	   if( idx == 0 && $1[0] == 1 && idxs[len-idx] == '十'){
	    return idxs[len-idx];
	   }
	   return num[$1[0]] + idxs[len-idx];
	  } else {
	   var left = len - idx;
	   var right = len - idx + $1.length;
	   if( Math.floor(right/4) - Math.floor(left/4) > 0 ){
	    pos = left - left%4;
	   }
	   if( pos ){
	    return idxs[pos] + num[$1[0]];
	   } else if( idx + $1.length >= len ){
	    return '';
	   }else {
	    return num[$1[0]]
	   }
	  }
	 });
	}
 
 window.onload=function(){ 
	 var serviceDateHidden = $('#serviceDateHidden').val();
	 $('#serviceDateShow').val(serviceDateHidden*12+"月");
 }
 
 
 /**
  * @describe:返回按钮功能返回到列表页面
  * @returns
  */
 function goBack(){
	 window.location.href=contextRootPath + "/contract/contractList.do";
 }