package com.platform.contract.schema.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;
@Entity
//创建的数据库表名称
@Table(name = "mainservice")
@Data
public class MainService {
	@Id
	@Column(name="contractno")
	String contractNo;
	@Column(name="servicetype")
	String serviceType;
	@Column(name="servicedate")
	Date serviceDate;
	@Column(name="settleamount")
	BigDecimal settleAmount;
	@Column(name="settleprice")
	BigDecimal settlePrice;
	@Column(name="startdate")
	Date startDate;
	@Column(name="enddate")
	Date endDate;
	@Column(name="saleuser")
	String saleUser;
	@Column(name="appendmsg")
	String appendMsg;
	@Column(name="remark")
	String reMark;
	
	@Column(name="inserttime" ,insertable = false, updatable = false)
	Date insertTime;
	@Column(name="operatetime")
	Date operateTime;
}
