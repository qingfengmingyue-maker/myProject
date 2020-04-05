package com.platform.organiz.schema.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Entity
//创建的数据库表名称
@Table(name = "organization")
@Data
public class Organization {

	@Id
	@Column(name="orgCode")
	String orgCode;
	@Column(name="orgName")
	String orgName;
	@Column(name="cityName")
	String cityName;
	@Column(name="cityCode")
	String cityCode;
	@Column(name="creditcode")
	String creditcode;
	@Column(name="orgshortname")
	String orgShortName;
	@Column(name="postcode")
	String postCode;
	@Column(name="legalperson")
	String legalPerson;
	@Column(name="address")
	String address;
	@Column(name="telphone")
	String telphone;
	@Column(name="faxno")
	String faxno;
	@Column(name="orglevel")
	String orgLevel;
	@Column(name="orgstate")
	String orgState;
	@Column(name="upperorg")
	String upperorg;
	@Column(name="accountname")
	String accountName;
	@Column(name="accountno")
	String accountNo;
	@Column(name="bankname")
	String bankName;
	@Column(name="brandname")
	String brandName;
	@Column(name="inserttime" ,insertable = false, updatable = false)
	Date insertTime;
	@Column(name="operatetime",insertable = false)
	Date operateTime;

}
