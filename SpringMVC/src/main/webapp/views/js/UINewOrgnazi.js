window.onload=function(){
}
$(function() {
	$('form').validate({
	    onFocus: function () {
	        this.parent().addClass('active');
	        return false;
	    },
	    onBlur: function () {
	        var $parent = this.parent();
	        var _status = parseInt(this.attr('data-status'));
	        $parent.removeClass('active');
	        if (!_status) {
	            $parent.addClass('error');
	        }
	        return false;
	    }
	});
	$("#saveOrgbtn").click(function(){
		$("#createNewOrg").submit();
	});
	$("#closeOrgbtn").click(function(){
		$("#closeExamDialog").click();
	});
	$("#upperBaseOrg").change(function(){
		$("#upperBaseOrgName").val($("#upperBaseOrg").find("option:selected").text());
		var upperBaseOrg = $("#upperBaseOrg").val();
		$.ajax({
			typr:"POST",
			url:contextRootPath+'/organiz/getSubOrg.do',
			data:"upperBaseOrg="+ upperBaseOrg,
			async : false,
			success:function(obj){
				if(obj != null){
					var cityCode =$("#cityCode").val();
					$("#cityCode").empty(); 
					for(var i =0 ;i<obj.length;i++){
						$("#cityCode").append("<option value='"+obj[i].cityCode+"'>"+obj[i].cityName+"</option>");
					}
					$("#cityName").val($("#cityCode").find("option:selected").text());
				}
			},
			error:function(){
				
			}
			
		})
	});
	$("#cityCode").focus(function(){
		if($('#cityCode option').length==1){
			$("#upperBaseOrg").change()
		};
	});
	$("#cityCode").change(function(){
		$("#cityName").val($("#cityCode").find("option:selected").text());
	})
	
});
$().ready(function() {
	if($("#busiType").val()=="view"){
		$("#createNewOrg").find(":input").attr("disabled","true");
		$(".btn-close").removeAttr("disabled");
	}
	$("#createNewOrg").validate({
		rules: {
		},
		messages: {
		}
	});
	
});
