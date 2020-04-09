package com.platform.contract.schema.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
//创建的数据库表名称
@Table(name = "partya")
@Data
public class PartyA {
	@Id
	@Column(name="id")
	int id;
	@Column(name="contractno")
	String contractNo;
	@Column(name="orgname")
	String orgName;
	@Column(name="businessname")
	String businessName;
	@Column(name="mobile")
	String mobile;

}
