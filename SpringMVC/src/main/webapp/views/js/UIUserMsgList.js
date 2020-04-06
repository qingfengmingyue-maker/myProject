//审核处理
$(function(){
	$("#add").click(
			function(){
				var $modal = $('#myModal');
				$modal.load(contextRootPath + "/userMsg/createUserMsg.do", '',
				function() {
					$modal.modal();
				});
	})
});