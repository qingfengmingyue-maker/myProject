package com.platform.contract.schema.vo;

import lombok.Data;

import com.platform.common.schema.vo.PageVo;
@Data
public class ContractQueryVo extends PageVo {
	String policyNo;//保单号
	String contractNo;//合同号
	String ownerName;//车主
	String vinNo;//车架号
}
