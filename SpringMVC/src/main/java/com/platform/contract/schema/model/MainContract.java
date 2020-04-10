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
	@Column(name="policyno")
	String policyNo;
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
