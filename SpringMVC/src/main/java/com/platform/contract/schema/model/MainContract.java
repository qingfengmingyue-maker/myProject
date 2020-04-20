package com.platform.contract.schema.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Entity
//创建的数据库表名称
@Table(name = " maincontract")
@Data
public class MainContract {
	@Id
	@Column(name="contractno")
	String contractNo;
	@Column(name="servicetype")
	String serviceType;
	@Column(name="servicedate")
	String serviceDate;
	@Column(name="settleamount")
	BigDecimal settleAmount;
	@Column(name="settleprice")
	BigDecimal settlePrice;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name="startdate")
	Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name="enddate")
	Date endDate;
	@Column(name="saleuser")
	String saleUser;
	@Column(name="appendmsg")
	String appendMsg;
	@Column(name="remark")
	String reMark;
	@Column(name="policyno")
	String policyNo;
	//暂存还是保存标识 0为暂存，1为保存
	@Column(name="savetype")
	String saveType;
	//注销状态：0 为已注销，1为未注销
	@Column(name="canceltype")
	String cancelType;
	@Column(name="inserttime" ,insertable = false, updatable = false)
	Date insertTime;
	@Column(name="operatetime")
	Date operateTime;
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "mainContract")	
	PartyA partyA;
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "mainContract")	
	PartyB partyB;
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "mainContract")	
	VehicleMsg vehicleMsg;
	
}
