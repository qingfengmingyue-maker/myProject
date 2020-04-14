package com.platform.user.schema.vo;

import com.platform.common.schema.vo.PageVo;

import lombok.Data;
@Data
public class UserMsgVo extends PageVo {

	private String userCode;
	
	private String userName;
	
	private String telPhone;
	
	private String orgCode;
}
