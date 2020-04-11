package com.platform.contract.schema.vo;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

import com.platform.common.schema.vo.PageVo;
@Data
public class ContractQueryVo extends PageVo {
	String policyNo;//保单号
	String contractNo;//合同号
	String ownerName;//车主
	String vinNo;//车架号
	//高级搜索页面中的查询条件
	String policyNoComplex;  //保单号
	String orgNameComplex;   //经销商名称
	Date insertTimeComplex;   //保存日期起期
	Date insertTime1Complex;  //保存日期止期
	String contractNoComplex; //合同号
	String vinNoComplex;      //车架号
	String ownerNameComplex;  //车主
	String carStateComplex;    //车辆状态
	String serviceTypeComplex;  //服务类型
	Character serviceDateComplex;  //服务期限
    String queryType;   //查询类型是简单查询还是复杂查询
}
