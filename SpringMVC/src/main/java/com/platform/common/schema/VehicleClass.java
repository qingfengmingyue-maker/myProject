package com.platform.common.schema;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name = "vehicleclass")
@Data
@Entity
//创建的数据库表名称
@AllArgsConstructor
@NoArgsConstructor
public class VehicleClass {
	@Id
	@Column(name="classname")
	String className;
	@Column(name="brandname")
	String brandName;
	@Column(name="inserttime")
	Date insertTime;

}
