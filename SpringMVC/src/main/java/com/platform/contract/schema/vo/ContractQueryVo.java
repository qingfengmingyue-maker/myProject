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

   private String brandName;
   private String className;
   private String modelName;
   private String carState;
   private Date insertTime;
   private String servicetype;
   private BigDecimal settleAmount;
   private Character serviceDate;
   private String orgName;
   private Date insertTimeVo;
   private Date operateTime;
   private String businessName;
}
