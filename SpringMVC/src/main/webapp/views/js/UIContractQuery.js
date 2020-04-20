//列表页js
jQuery(function($) {
	var hiddenClass ="center";
	var postFlag = $("#postFlag").val();
	if(postFlag == '1'){
		hiddenClass="hiddenCol";
	}
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
          {"data": "carState","class" : "center", "bSortable": false},
          {"data": "serviceType","class" : "center",
        	  "render" : function(data, type, row) {
         		    var serviceTypeName ='';
         		    if(data == '1'){
         		    	serviceTypeName = '赔付包含购置税'
         		    }
         		    return serviceTypeName;
         		}
          },
          {"data": "serviceDate","class" : "center",
        	  "render" : function(data, type, row) {
       		   return data+'年';
       		}
          },
          {"data": "orgName","class" : "center","bSortable": false},
          {"data": "insertTime","class" : "center","bSortable": false},
          {"data": "operateTime","class" : "center","bSortable": false},
          {"data": "businessName","class" : "center","bSortable": false},
          {"data": "saveType","class" : "center",
        	  "render" : function(data, type, row) {
       		    var saveTypeName ='';
       		    if(data == '0'){
       		    	saveTypeName = '暂存'
       		    }else if(data == '1'){
       		    	saveTypeName = '保存'
       		    }
       		    return saveTypeName;
       		}
          },
          {"data": "cancelType","class" :hiddenClass,
        	  "render" : function(data, type, row) {
       		    var cancelTypeName ='';
       		    if(data == '0'){
       		    	cancelTypeName = '已注销'
       		    }else if(data == '1'){
       		    	cancelTypeName = '未注销'
       		    }
       		    return cancelTypeName;
       		}
          }
     ];
       $(dataTableInit(contextRootPath+"/contract/queryContractPageList.do", colModel,'',10));
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
					$.ajax({
						type : "POST",
						url : contextRootPath + '/contract/getStartDateByContractNo.do',
						data :"contractNo="+result,
						async : false,
						success : function(obj) {
							debugger;
							if(obj !=''){
								var tempDate = obj.replace(/-/g,"/");
								var startdatenew = new Date(Date.parse(tempDate));
								var currentTime = new Date();
								if(startdatenew > currentTime){
									window.location.href=contextRootPath + "/contract/findContractByContractNo.do?contractNo="+result+"&editType=edit";
								}else{
									alert("该订单已生效，不允许修改订单信息");
								}
							}
						},
						error : function(XMLHttpRequest, textStatus, errorThrown) {
							alert(textStatus + errorThrown);
						}
					});
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
					$.ajax({
						type : "POST",
						url : contextRootPath + '/contract/getSaveTypeByContractNo.do',
						data :"contractNo="+result,
						async : false,
						success : function(obj) {
							if(obj==0){
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
							}else{
								alert("订单状态只有暂存状态才可以删除");
							}										
						},
						error : function(XMLHttpRequest, textStatus, errorThrown) {
							alert("系统异常，请联系系统管理员");
						}
					});
			 }
	 })
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
			$.ajax({
				type : "POST",
				url : contextRootPath + '/contract/getSaveTypeByContractNo.do',
				data :"contractNo="+result,
				async : false,
				success : function(obj) {
					if(obj=='0'){
						alert("暂存状态不允许打印");
					}else{
						window.location.href=contextRootPath + "/contract/print.do?contractNo="+result;
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(textStatus + errorThrown);
				}
			});
			
		}
	});
});



/**
 * 下载导出报表
 */
$(function() {
$("#export").click(function(){
	var contractNo=$("#contractNo").val();
	var ownerName=$("#ownerName").val();
	var vinNo=$("#vinNo").val();
	var orgName=$("#orgName").val();
	var insertTime=$("#insertTime").val();
	var insertTime1=$("#insertTime1").val();
	var carState=$("#carState").val();
	var serviceType=$("#serviceType").val();
	var serviceDate=$("#serviceDate").val();
	var urlparam = "?contractNo="+contractNo+"&ownerName="+ownerName+"&vinNo="+vinNo+"&orgName="+orgName;
	urlparam = urlparam +"&carState="+carState+"&serviceType="+serviceType+"&serviceDate="+serviceDate+"&insertTime="+insertTime+"&insertTime1="+insertTime1;
	window.location.href=contextRootPath + "/contract/loadContractExcel.do"+urlparam;
 })
});
/**
 * 注销订单
 */
$(function() {
	$("#cancel").click(function(){
		var result = selectOne();
		if(result != null){
			if(confirm("确定注销该订单？")){
				$.ajax({
					type : "POST",
					url : contextRootPath + '/contract/cancelContractByContractNo.do',
					data :"contractNo="+result,
					async : false,
					success : function(obj) {
						if(obj=='注销成功'){
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



Date.prototype.Format = function(fmt) 
{ 
var o = { 
 "M+" : this.getMonth()+1,                 //月份 
 "d+" : this.getDate(),                    //日 
 "h+" : this.getHours(),                   //小时 
 "m+" : this.getMinutes(),                 //分 
 "s+" : this.getSeconds(),                 //秒 
 "q+" : Math.floor((this.getMonth()+3)/3), //季度 
 "S"  : this.getMilliseconds()             //毫秒 
}; 
if(/(y+)/.test(fmt)) 
 fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
for(var k in o) 
 if(new RegExp("("+ k +")").test(fmt)) 
fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length))); 
return fmt; 
}


$(function() {
	$(".form_date").datetimepicker({
		format : "yyyy-mm-dd",
		language : "zh-CN",
		autoclose : true,
		todayBtn : true,
		todayHighlight : true,
		showMeridian : false,
		minView : "month",
		pickerPosition : "bottom-left"
	});
});


$(function() {
	$("#resetContract").click(function(){
		$("#fm")[0].reset();
	 })
	});