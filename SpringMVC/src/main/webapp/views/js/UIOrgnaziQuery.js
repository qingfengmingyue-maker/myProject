jQuery(function($) {
    //列值定义,clientIP和count都是对应的返回对象的字段
    colModel = [
                {"data": function(data){
                	return '<a onclick="editOrg('+data.orgCode+',\'view\')">'+data.orgName+'</a>';
                	}
                },
//                {"data": "orgName","bSortable": true},
                {"data": "creditCode","bSortable": true},
                {"data": "orgCode","bSortable": true},
                {
                    "data": function (data) {
                    	return "<button class='btn btn-primary btn-outline' onclick='editOrg("+data.orgCode+",\"edit\")' >编辑</button>&nbsp;" +
                    			"<button class='btn btn-primary btn-outline' onclick='delOrg("+data.orgCode+")' >删除</button>";
                    }
                }
              ];
       $(dataTableInit(contextRootPath+"/organiz/quryOrganizList.do", colModel,"",10));
});
function editOrg(obj,busiType){
	var modal = $("#orgnaziModal");
	var url = contextPath + "/organiz/editOrganiz.do?orgCode="+obj+"&busiType="+busiType;
	modal.load(url, '', function(){
		modal.modal();
	});

}
function delOrg(obj){
	window.location.href =contextPath + "/organiz/delOrganiz.do?orgCode="+obj;
}
$(function() {
	$("#addbtn").click(
			function(){
				var modal = $("#orgnaziModal");
				var url = contextPath + "/organiz/createOrganiz.do";
				modal.load(url, '', function(){
					modal.modal();
				});
	});
	$('.dataTables_length select').on('change',function(){
		$('.table-sort').DataTable().page(0).draw( false );
	});
	$("#search").click(function() {
		jsonCondition=$("#fm").serializeObject();
		var table = $('.table-sort').DataTable();
		table.ajax.reload();
	});
	$("#reset").click(function(){
		$("#fm").find(":input").val("");
	})
});