package com.platform.contract.schema.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Entity
//创建的数据库表名称
@Table(name = "vehiclemsg")
@Data
public class VehicleMsg {
	@Id
	@Column(name="contractno")
	String contractNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name="purchasedate")
	Date purchaseDate;
	@Column(name="carstate")
	String carState;
	@Column(name="usernature")
	String userNature;
	@Column(name="licenseno")
	String licenseNo;
	@Column(name="engineno")
	String engineNo;
	@Column(name="vinno")
	String vinNo;
	@Column(name="brandname")
	String brandName;
	@Column(name="classname")
	String className;
	@Column(name="modelname")
	String modelName;
	@Column(name="invoiceamount")
	BigDecimal invoiceAmount;
	@Column(name="purchaseamount")
	BigDecimal purchaseAmount;
	@Column(name="insurancetype")
	String insuranceType;
	@Column(name="insurancename")
	String insuranceName;
	@Column(name="licensefee")
	BigDecimal licenseFee;
	@Column(name="taxamount")
	BigDecimal taxAmount;
	@OneToOne(fetch = FetchType.LAZY)	
	@JoinColumn(name = "contractno", nullable = false, insertable = false, updatable = false)
	MainContract mainContract;
}
