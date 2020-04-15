//列表页js
jQuery(function($) {
    //列值定义,clientIP和count都是对应的返回对象的字段
    colModel = [
               
    	  {"data": null,"class" : "center",
   			"render" : function(data, type, row) {
   			return '<input name="checkCode" type="checkbox" id="'+data.userName +'">';
   			}
          },
          {"data": "userCode","class" : "center","bSortable": false},
          {"data": "userName","class" : "center","bSortable": false}
        
          ];
//    	var userName=$("#userName").val();
    	var orgCode=$("#orgCode").val();
//    	alert(userName+"--"+orgCode)
       $(dataTableInit(contextRootPath+"/userMsg/queryUserMsg.do?orgCode="+orgCode, colModel,'',10));
});


/**
 * 搜索按钮的方法
 */
$(function() {
	$("#searchBusinessName").click(function() {
		jsonCondition=$("#userFm").serializeObject();
		var table = $('.table-sort').DataTable();
		table.ajax.reload();
    });
});


/**
 * 重置按钮
 */
$(function() {
	$("#clearBusinessName").click(function() {
		  $("#fm")[0].reset();
    });
});

/**
 * 确定按钮
 */
$(function() {
	$("#userSureCheck").click(function() {
		var result = selectOne();
		if(result != null){
			$('#PartyA\\.businessName').val(result);
		     $("#closeUserDialog").click();
		}
    });
});