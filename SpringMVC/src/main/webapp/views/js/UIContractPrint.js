
function  preview(oper) {

	  var img_length =2;
	  var imgs = [];
	  var c = 0;
	  var img_start = 0;
	  var imgSrc =["http://"+window.location.host+""+contextRootPath+"/static/images/logo.jpg","http://"+window.location.host+""+contextRootPath+"/static/images/logo.jpg"] ;
	     for (var i = 0; i < img_length; i++) {
	    	    debugger;
                imgs[i] = new Image();
                imgs[i].src = imgSrc[i];
                imgs[i].onload = function(){
                    c++
                if(c == imgSrc.length){
                	   bdhtml =window.document.body.innerHTML;//获取当前页的html代码
    	                sprnstr = "<!--startprint" + oper + "-->";//设置打印开始区域

    	                eprnstr = "<!--endprint" + oper + "-->";//设置打印结束区域

    	                prnhtml =bdhtml.substring(bdhtml.indexOf(sprnstr) + 18); //从开始代码向后取html

    	                prnhtml = prnhtml.substring(0,prnhtml.indexOf(eprnstr));//从结束代码向前取html

    	                window.document.body.innerHTML= prnhtml;

    	                window.print();

    	                window.document.body.innerHTML =bdhtml;
                 }
            }
        }

//            if(oper < 10) {
//
//                bdhtml =window.document.body.innerHTML;//获取当前页的html代码
//
//                sprnstr = "<!--startprint" + oper + "-->";//设置打印开始区域
//
//                eprnstr = "<!--endprint" + oper + "-->";//设置打印结束区域
//
//                prnhtml =bdhtml.substring(bdhtml.indexOf(sprnstr) + 18); //从开始代码向后取html
//
//                prnhtml = prnhtml.substring(0,prnhtml.indexOf(eprnstr));//从结束代码向前取html
//
//                window.document.body.innerHTML= prnhtml;
//
//                window.print();
//
//                window.document.body.innerHTML =bdhtml;
//
//            } else{
//
//                window.print();
//
//            }

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
	 debugger;
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
 
 
 
 
//指定部分内容打印
 function doPrintxxx() {  
   var  bdhtml = window.document.body.innerHTML;  
   var  sprnstr = "<!--startprint-->";    //用于截断字符串的内容，截取到指定的图片内容了
   var  eprnstr = "<!--endprint-->";  
   var  prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 17);  
        prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));  
    window.document.body.innerHTML = prnhtml;  
     if (getExplorer() == "IE") {  
         pagesetup_null();  
     }  
     window.print();  
     window.document.body.innerHTML=bdhtml; //还原 原有页面内容;
 }
  
 //获取浏览器类型
 function getExplorer() {  
     var explorer = window.navigator.userAgent;  
     //ie   
     if (explorer.indexOf("MSIE") >= 0) {  
         return "IE";  
     }  
         //firefox   
     else if (explorer.indexOf("Firefox") >= 0) {  
         return "Firefox";  
     }  
         //Chrome  
     else if (explorer.indexOf("Chrome") >= 0) {  
         return "Chrome";  
     }  
         //Opera  
     else if (explorer.indexOf("Opera") >= 0) {  
         return "Opera";  
     }  
         //Safari  
     else if (explorer.indexOf("Safari") >= 0) {  
         return "Safari";  
     }  
 }  
  
 //IE设置去除页眉页脚  
 function pagesetup_null() {  
     var hkey_root, hkey_path, hkey_key;  
     hkey_root = "HKEY_CURRENT_USER";  
     hkey_path = "\\Software\\Microsoft\\Internet Explorer\\PageSetup\\";  
     try {  
         var RegWsh = new ActiveXObject("WScript.Shell");  
         hkey_key = "header";  
         RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "");  
         hkey_key = "footer";  
         RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "");  
     } catch (e) { }  
 }  
 
 
 
 
 
 var t_img; 
 var isLoad = true; 
 function isImgLoad(){
debugger;
	     // 查找所有打印图，迭代处理

	     $('.printImg').each(function(){

	         // 找到为0就将isLoad设为false，并退出each

	         if(this.height === 0){

	             isLoad = false;

	             return false;

	         }

	     });
	 if(isLoad){

		         clearTimeout(t_img); // 清除定时器

		         // 回调函数

		        doPrintxxx() ;

		     // 为false，因为找到了没有加载完成的图，将调用定时器递归

		     }else{

		         isLoad = true;

		         t_img = setTimeout(function(){

		             isImgLoad(callback); // 递归扫描

		         },500); // 我这里设置的是500毫秒就扫描一次，可以自己调整

		     }

		 }


