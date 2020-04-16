package com.platform.contract.schema.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
//创建的数据库表名称
@Table(name = "partya")
@Data
public class PartyA {
	@Id
	@Column(name="contractno")
	String contractNo;
	@Column(name="orgcode")
	String orgCode;
	@Column(name="orgname")
	String orgName;
	@Column(name="businesscode")
	String businessCode;
	@Column(name="businessname")
	String businessName;
	@Column(name="mobile")
	String mobile;
	@OneToOne(fetch = FetchType.LAZY)	
	@JoinColumn(name = "contractno", nullable = false, insertable = false, updatable = false)
	MainContract mainContract;

}
