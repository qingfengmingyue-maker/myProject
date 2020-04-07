package com.platform.organiz.schema.model;

import lombok.Data;

import com.platform.common.schema.vo.PageVo;

@Data
public class OrganizationVo extends PageVo{
	String orgCode;
	String orgName;
	String creditCode;
}
