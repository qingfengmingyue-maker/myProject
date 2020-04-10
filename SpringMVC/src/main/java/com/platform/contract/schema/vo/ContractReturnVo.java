package com.platform.contract.schema.vo;

import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
@Data
public class ContractReturnVo {

	String policyNo;//保单号
	String contractNo;//合同号
	String ownerName;//车主
   private String brandName;
   private String className;
   private String modelName;
   private String carState;
   @JsonFormat(pattern="yyyy-MM-dd")
   private Date insertTime;
   private String serviceType;
   private BigDecimal settleAmount;
   private Character serviceDate;
   private String orgName;
   @JsonFormat(pattern="yyyy-MM-dd")
   private Date insertTimeVo;
   @JsonFormat(pattern="yyyy-MM-dd")
   private Date operateTime;
   private String businessName;
}
