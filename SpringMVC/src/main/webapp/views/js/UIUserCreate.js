 function submitForm() {
		if (fm.userName.value == "") {
			alert("用户名不能为空!");
		}else if (fm.passWord.value == "") {
			alert("密码不能为空!");
		}else{
		   fm.submit();
		}
	}