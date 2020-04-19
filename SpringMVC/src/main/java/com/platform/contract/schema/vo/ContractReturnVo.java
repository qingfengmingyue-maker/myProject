package com.platform.contract.schema.vo;

import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
@Data
public class ContractReturnVo {

   private String policyNo;//保单号
   private String contractNo;//合同号
   private String ownerName;//车主
   private String brandName;
   private String className;
   private String modelName;
   private String carState;
   private String serviceType;
   private BigDecimal settleAmount;
   private Character serviceDate;
   private String orgName;
   @JsonFormat(pattern="yyyy-MM-dd")
   private Date insertTime;
   @JsonFormat(pattern="yyyy-MM-dd")
   private Date operateTime;
   //private String businessName;
   //private String operateCode;
   private String operateName;
   //"0"代表暂存  "1"代表保存
   private Character saveType;
}
