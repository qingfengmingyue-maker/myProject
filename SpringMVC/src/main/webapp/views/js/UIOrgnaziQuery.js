$(function() {
	//校验规则   
	 var rules = {};
	//校验提示
	var messages = {};
	//4.Ajax表单操作相关
	var ajaxEdit = new AjaxEdit("#newPolicyForm");
	ajaxEdit.rules = rules;
	ajaxEdit.messages = messages;
//	$("#addbtn").click(	function(){ 
//		var url = contextRootPath + "/organiz/createOrganiz.do";
//		window.open(url,'width=500000,height=300，resizable=1')
//		window.showModalDialog(url,window,"resizable:yes;dialogHide:yes;help:no;status:no;scroll:yes;dialogWidth:3000px;dialogHeight:1000px");
		//识别成功跳转证件浏览界面
//		var modal = $("#orgnaziModal");
//		alert(url)
//		modal.load(url,'', function() {
//			modal.modal();
//		});
//		
//	});
});