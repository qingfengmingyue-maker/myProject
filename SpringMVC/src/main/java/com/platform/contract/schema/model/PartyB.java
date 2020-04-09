package com.platform.contract.schema.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
//创建的数据库表名称
@Table(name = "partyb")
@Data
public class PartyB {
	@Id
	@Column(name="id")
	int id;
	@Column(name="contractno")
	String contractNo;
	@Column(name="ownername")
	String ownerName;
	@Column(name="ownermobile")
	String ownerMobile;
	@Column(name="ownerdress")
	String ownerDress;
	@Column(name="documenttype")
	String documentType;
	@Column(name="documentno")
	String documentNo;


}
