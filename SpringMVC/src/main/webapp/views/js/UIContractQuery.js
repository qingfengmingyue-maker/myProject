//列表页js
jQuery(function($) {
    //列值定义,clientIP和count都是对应的返回对象的字段
    colModel = [
               
    	  {"data": null,"class" : "center",
   			"render" : function(data, type, row) {
   			return '<input name="checkCode" type="checkbox" id="'+data.contractNo+'">';
   			}
          },
          {"data": "contractNo","class" : "center","bSortable": false},
          {"data": "ownerName","class" : "center","bSortable": false},
          {"data": "brandName","class" : "center","bSortable": false},
          {"data": "className","class" : "center","bSortable": false},
          {"data": "modelName","class" : "center","bSortable": false},
          {"data": "carState","class" : "center","bSortable": false},
          {"data": "insertTime","class" : "center","bSortable": false},
          {"data": "serviceType","class" : "center",
        	  "render" : function(data, type, row) {
         		    let serviceTypeName ='';
         		    if(data == '1'){
         		    	serviceTypeName = '赔付包含购置税'
         		    }
         		    return serviceTypeName;
         		}
          },
          {"data": "settleAmount","class" : "center","bSortable": false},
          {"data": "serviceDate","class" : "center",
        	  "render" : function(data, type, row) {
       		   return data+'年';
       		}
          },
          {"data": "orgName","class" : "center","bSortable": false},
          {"data": "insertTimeVo","class" : "center","bSortable": false},
          {"data": "operateTime","class" : "center","bSortable": false},
          {"data": "businessName","class" : "center","bSortable": false},
     ];
       $(dataTableInit(contextRootPath+"/contract/quryContractPageList.do", colModel,'',10));
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


//修改合同信息
$(function(){
	$("#edit").click(
			function(){
				var result = selectOne();
				if(result != null){
					window.location.href=contextRootPath + "/contract/findContractByContractNo.do?contractNo="+result+"&editType=edit";
			   }
	 })
});