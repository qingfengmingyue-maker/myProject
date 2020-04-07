
/**
 * 改变pageLength自动定位到第一页
 */
$(function(){
	$('.dataTables_length select').on('change',function(){
		$('.table-sort').DataTable().page(0).draw( false );
	});
}); 

//列表页js
jQuery(function($) {
    //列值定义,clientIP和count都是对应的返回对象的字段
    colModel = [
               
    	  {"data": null,"class" : "center",
    			"render" : function(data, type, row) {

    				return "";
    			}
           },
                {"data": "userName","bSortable": false},
                {"data": "passWord","bSortable": false},
                {
                    // 这里是编辑和删除两个按钮的书写方式。
                    "data": function (data) {
                        return  "<a  href='"+ contextRootPath+"/user/editUser.do?id="+ data.id + "'>编辑</a>&nbsp;&nbsp;<a id='btnDelete'   onclick='return confirm('确认删除?')' href='"+ contextRootPath+"/user/deleteUser.do?id="+ data.id + "' >删除</a>"
                }
                }

              ];
       $(dataTableInit(contextRootPath+"/user/queryUser.do", colModel,1,10));
});



/**
 * 搜索按钮的方法
 */
$(function() {
	$("#search").click(
			function() {
       
	jsonCondition=$("#fm").serializeObject();
	var table = $('.table-sort').DataTable();
	table.ajax.reload();
	});
});