/**
 * AjaxģʽEditҳ��֧��JS
 */

var submitInProgress = false;
function AjaxEdit(selector) {
	this.selector = selector;
	this.rules = {};
	this.messages = {};
	this.targetUrl = null;
	this.beforeSubmit = null;
	this.afterSuccess = null;
	this.afterFailure = null;
}
AjaxEdit.prototype.bindForm = function() {
	var innerForm = $(this.selector);
	var innerFormTargetUrl = this.targetUrl;
	var innerFormValidRules = this.rules;
	var innerFormValidMessages = this.messages;
	var innerFormBeforeSubmit = this.beforeSubmit;
	var innerFormAfterSuccess = this.afterSuccess;
	var innerFormAfterFailure = this.afterFailure;
	//����������ʱ������ֵ������callback��ʹ�á�
	var innerXMLHttpRequest="";
	var innerTextStatus="";
	var validData = {
		rules : innerFormValidRules,
		messages : innerFormValidMessages,

		ignore: "", 
		invalidHandler : function(e, validator) {
			var errors = validator.numberOfInvalids();
			if (errors) {
				var message = errors == 1 ? 'You missed 1 field. It has been highlighted below'
						: 'You missed ' + errors
								+ ' fields.  They have been highlighted below';
				$("div.error span").html(message);
				$("div.error").show();
			} else {
				$("div.error").hide();
			}
			;
		},
		errorPlacement : function(error, element) {
			error.css("color", "red").css("font-size","12px");
			var elem = $(element);
			if(elem.parent().attr("class").indexOf("input-group") != -1 || elem.parent().attr("class").indexOf("form_date") != -1){
				error.appendTo(elem.parent().parent());
			}else{
				error.appendTo(elem.parent());
			}
		},
		highlight: function(element, errorClass, validClass) { // element����ʱ����
			$(element).addClass("alert-danger error");
		},
		unhighlight: function(element, errorClass) { // elementͨ����֤ʱ����
			$(element).removeClass("alert-danger error");
		},
		success : $.noop,
		submitHandler : function() {
			if (submitInProgress) {
				return false;
			}
			if(innerFormBeforeSubmit!=null){ 
				innerFormBeforeSubmit(innerFormTargetUrl);
			}
			submitInProgress = true;
			$("div.error").hide();
//			alert(innerFormTargetUrl)
			$.ajax({
				// �ύ���ݵ����� POST GET
				type : "POST",
				// �ύ����ַ
				url : innerFormTargetUrl,
				// �ύ������
				data : innerForm.serialize(),
				// �������ݵĸ�ʽ
				datatype : "json",
				// "xml", "html", "script", "json", "jsonp", "text".
				// ������֮ǰ���õĺ���
				beforeSend : function() {
					var msgOption = {
						message : "���������У����Ժ�...",
						closeButton : false,
						animate : false,
						buttons : {},
					};
					bootbox.dialog(msgOption);
				},
				// �ɹ�����֮����õĺ���
				success : function(data) {
					var result = eval(data);
					var messageText = "";
					var success = true;
					if(result) {
						if (result.status == "200") {
							messageText = '�����ɹ�';
						} else {
							success= false;
							messageText = '����ʧ�ܣ�' + result.statusText;
						}
					}else {
						if (data == "success") {
							messageText = '�����ɹ�';
						} else {
							success= false;
							messageText = '����ʧ�ܣ�' + data;
						}
					}

					var msgOption = {
						message : messageText,
						closeButton : false,
						animate : false,
						buttons : {
							close : {
								label : "ȷ��",
								className : "btn-success",
								callback : function() {
									bootbox.hideAll();  
									if(success){
										if(innerFormAfterSuccess!=null){ 
											innerFormAfterSuccess(innerXMLHttpRequest, innerTextStatus,data);
										}
									}else{
										if(innerFormAfterFailure!=null){ 
										    innerFormAfterFailure(innerXMLHttpRequest, innerTextStatus,data);
										}
									}
									//����complete���õ�����������
									innerXMLHttpRequest = null;
									innerTextStatus = null;
								}
							}
						}
					};
					bootbox.dialog(msgOption);
				},
				// ����ִ�к���õĺ���
				complete : function(XMLHttpRequest, textStatus) {
					//alert(XMLHttpRequest.responseText);
					//alert(textStatus);
					// HideLoading();
					submitInProgress = false;
					//���óɹ���������������ʱ������ֵ������callback��ʹ�á�
					innerXMLHttpRequest=XMLHttpRequest;
					innerTextStatus = textStatus;
				},
				// ���ó���ִ�еĺ���
				error : function() {
				},
				clearForm : true,
			});
			return false;
		},
	// Odd workaround for errorPlacement not firing!
	};
	innerForm.validate(validData);
};
