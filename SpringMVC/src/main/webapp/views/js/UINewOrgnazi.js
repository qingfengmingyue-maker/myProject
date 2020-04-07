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
	
});
$().ready(function() {
	$("#createNewOrg").validate({
		rules: {
			creditCode :"idcard"
		},
		messages: {
		}
	});
});