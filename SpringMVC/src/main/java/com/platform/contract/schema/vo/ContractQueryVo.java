package com.platform.contract.schema.vo;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.platform.common.schema.vo.PageVo;
@Data
public class ContractQueryVo extends PageVo {
	String policyNo;//保单号
	String contractNo;//合同号
	String ownerName;//车主
	String vinNo;//车架号
	//高级搜索页面中的查询条件
	String orgName;   //经销商名称
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date insertTime;   //保存日期起期
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date insertTime1;  //保存日期止期
	String carState;    //车辆状态
	String serviceType;  //服务类型
	String serviceDate;  //服务期限
	//"0"代表暂存  "1"代表保存
	String saveType;   //订单状态
}
