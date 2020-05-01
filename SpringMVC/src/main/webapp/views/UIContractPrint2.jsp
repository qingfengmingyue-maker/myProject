<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/static/common/taglibs.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>使用JS打印网页内容及图片</title>
<script>
//指定部分内容打印
function doPrintxxx() {  
  var  bdhtml = window.document.body.innerHTML;  
  var  sprnstr = "<!--startprint-->";    
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
</script>
 
</head>
<body>
<center>
 <button onclick="doPrintxxx()" >使用JS打印网页内容及图片</button></br>
 <!--startprint-->  
 	<center id="printConent"> 
      <img id="print" height="300px" width="300px" src="${ctx}/static/images/logo.jpg" /> 
    </center> 
<!--endprint-->  
 </center>
</body>
</html>
