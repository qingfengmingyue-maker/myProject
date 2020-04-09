//列表页js
jQuery(function($) {
    //列值定义,clientIP和count都是对应的返回对象的字段
    colModel = [
               
    	  {"data": null,"class" : "center",
   			"render" : function(data, type, row) {
   			return '<input name="checkCode" type="checkbox" id="'+data.orgName+'">';
   			}
          },
          {"data": "orgCode","class" : "center","bSortable": false},
          {"data": "orgName","class" : "center","bSortable": false}
        
      ];
       $(dataTableInit(contextRootPath+"/userMsg/queryOrganization.do", colModel,'',10));
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


/**
 * 重置按钮
 */
$(function() {
	$("#clearOrganization").click(function() {
		  $("#fm")[0].reset();
    });
});

/**
 * 确定按钮
 */
$(function() {
	$("#sureCheck").click(function() {
		var result = selectOne();
		if(result != null){
		     $("#orgName").val(result);
		     $("#closeDialog").click();
		     
		}
    });
});

