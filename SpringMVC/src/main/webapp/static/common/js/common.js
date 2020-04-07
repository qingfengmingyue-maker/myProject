//删除  修改 浏览 之前校验只能选择一条数据  
function selectOne(){
	var delList=$("input[name=checkCode]:checked");
	var codeList= new Array();
	for(var i=0;i<delList.length;i++){					
		if(delList[i].checked){						
			codeList[i]=delList[i].id;			
		  }
	}
	if(codeList.length>1){
		alert("请选择一条数据！");
		$("input[type=checkbox]").attr("checked",false);
	}else if(codeList.length<1){
		alert("请选择一条数据！");
	}else{
		return codeList;
	}
}