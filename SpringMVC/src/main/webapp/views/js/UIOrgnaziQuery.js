jQuery(function($) {
    //列值定义,clientIP和count都是对应的返回对象的字段
    colModel = [
                {"data": null,"bSortable": false},
                {"data": "orgName","bSortable": false},
                {"data": "creditCode","bSortable": false},
                {"data": "orgCode","bSortable": false},
                {
                    "data": function (data) {
                    	return "<button class='btn btn-primary btn-outline' onclick='editOrg("+data.orgCode+")' >编辑</button>&nbsp;" +
                    			"<button class='btn btn-primary btn-outline' onclick='delOrg("+data.orgCode+")' >删除</button>";
                    }
                }
              ];
       $(dataTableInit(contextRootPath+"/organiz/quryOrganizList.do", colModel,"",10));
});
function editOrg(obj){
	var modal = $("#orgnaziModal");
	var url = contextPath + "/organiz/editOrganiz.do?orgCode="+obj;
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
});