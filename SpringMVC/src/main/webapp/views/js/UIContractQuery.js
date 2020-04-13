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
	$('#queryType').val('');
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


/**
 * @describe:合同信息浏览
 * @returns
 */
$(function(){
	$("#view").click(
			function(){
				var result = selectOne();
				if(result != null){
					window.location.href=contextRootPath + "/contract/findContractByContractNo.do?contractNo="+result+"&editType=view";
			   }
	 })
});



//删除用户信息
$(function(){
	$("#remove").click(
			function(){
				var result = selectOne();
				if(result != null){
					if(confirm("确定要删除此合同信息？")){
						$.ajax({
							type : "POST",
							url : contextRootPath + '/contract/deleteContractByContractNo.do',
							data :"contractNo="+result,
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



/**
 * 更多查询搜索按钮的方法
 */
$(function() {
	$("#submitQuery").click(function() {
		let showPolicyNo = $('#showPolicyNo').val();
		let showOrgName = $('#showOrgName').val();
		let showInsertTime = $('#showInsertTime').val();
		let showInsertTime1 = $('#showInsertTime1').val();
		let showContractNo = $('#showContractNo').val();
		let showVinNo = $('#showVinNo').val();
		let showoOwnerName = $('#showoOwnerName').val();
		let showCarState = $('#showCarState').val();
		let showServiceType = $('#showServiceType').val();
		let showServiceDate = $('#showServiceDate').val();
	   $('#policyNoComplex').val(showPolicyNo);
	   $('#orgNameComplex').val(showOrgName);
	   $('#insertTimeComplex').val(showInsertTime);
	   $('#insertTime1Complex').val(showInsertTime1);
	   $('#contractNoComplex').val(showContractNo);
	   $('#vinNoComplex').val(showVinNo);
	   $('#ownerNameComplex').val(showoOwnerName);
	   $('#carStateComplex').val(showCarState);
	   $('#serviceTypeComplex').val(showServiceType);
	   $('#serviceDateComplex').val(showServiceDate);
	   $('#queryType').val('complexQuery');
	   $("#moreSearchModal input").val("");
	   $("#closeDialog").click();
	   jsonCondition=$("#fm").serializeObject();
	   var table = $('.table-sort').DataTable();
	   table.ajax.reload();
	});
});


/**
 * 关闭弹出框
 */
$(function() {
	$("#cancelQuery").click(function() {
		$("#closeDialog").click();
	});
});


/**
 * 打印功能
 */
$(function() {
	$("#print").click(function() {
		var result = selectOne();
		if(result != null){
			window.location.href=contextRootPath + "/contract/print.do?contractNo="+result;
		}
	});
});

