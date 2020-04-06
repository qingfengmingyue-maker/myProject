jQuery(function($) {
    //列值定义,clientIP和count都是对应的返回对象的字段
    colModel = [
                {"data": null,"bSortable": false},
                {"data": "orgName","bSortable": false},
                {"data": "creditCode","bSortable": false},
                {"data": "orgCode","bSortable": false},
                {
                    "data": function (data) {
                        return  "<a href='"+ contextRootPath+"/organiz/editOrganiz.do?orgCode="+ data.orgCode + "'>编辑</a> &nbsp; <a id='btnDelete' href='"+ contextRootPath+"/organiz/delOrganiz.do?orgCode="+ data.orgCode + "' >删除</a>"
                    }
                }
              ];
       $(dataTableInit(contextRootPath+"/organiz/quryOrganizList.do", colModel,"",10));
});
$(function() {
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
	$('.dataTables_length select').on('change',function(){
		$('.table-sort').DataTable().page(0).draw( false );
	});
	$("#search").click(function() {
		jsonCondition=$("#fm").serializeObject();
		var table = $('.table-sort').DataTable();
		table.ajax.reload();
	});
});