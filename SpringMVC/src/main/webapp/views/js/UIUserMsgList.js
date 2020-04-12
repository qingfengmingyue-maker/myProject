//修改用户信息
$(function(){
	$("#edit").click(
			function(){
				var result = selectOne();
				if(result != null){
					window.location.href=contextRootPath + "/userMsg/findUserMsgByUserCode.do?userCode="+result+"&editType=edit";
			   }
	 })
});


//删除用户信息
$(function(){
	$("#remove").click(
			function(){
				var result = selectOne();
				if(result != null){
					if(confirm("确定要删除此用户信息？")){
						$.ajax({
							type : "POST",
							url : contextRootPath + '/userMsg/deleteUserMsgByUserCode.do',
							data :"userCode="+result,
							async : false,
							success : function(obj) {
								if(obj=='删除成功'){
									alert(obj);
								}
								window.location.reload();
							},
							error : function(XMLHttpRequest, textStatus, errorThrown) {
								alert(textStatus + errorThrown);
							}
						});
					}
			   }
	 })
});

//用户信息浏览
$(function(){
	$("#view").click(
			function(){
				var result = selectOne();
				if(result != null){
					window.location.href=contextRootPath + "/userMsg/findUserMsgByUserCode.do?userCode="+result+"&editType=view";
			   }
	 })
});




//列表页js
jQuery(function($) {
    //列值定义,clientIP和count都是对应的返回对象的字段
    colModel = [
               
    	  {"data": null,"class" : "center",
   			"render" : function(data, type, row) {
   			return '<input name="checkCode" type="checkbox" id="'+data.userCode+'">';
   			}
          },
          {"data": "orgCode","class" : "center","bSortable": false},
          {"data": "orgName","class" : "center","bSortable": false},
          {"data": "userName","class" : "center","bSortable": false},
          {"data": "userCode","class" : "center","bSortable": false},
          {"data": "telPhone","class" : "center","bSortable": false},
          {"data": "businessPost","class" : "center","bSortable": false}
     ];
       $(dataTableInit(contextRootPath+"/userMsg/queryUserMsg.do", colModel,'',10));
      
});


/**
 * 搜索按钮的方法
 */
$(function() {
	$("#search").click(function() {
	jsonCondition=$("#fm").serializeObject();
	var table = $('.table-sort').DataTable();
	table.ajax.reload();
	});
});