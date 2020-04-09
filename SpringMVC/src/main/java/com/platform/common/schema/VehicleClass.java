package com.platform.common.schema;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Table(name = "vehicleclass")
@Data
public class VehicleClass {
	@Id
	@Column(name="classname")
	String className;
	@Column(name="brandname")
	String brandName;
	@Column(name="inserttime")
	Date insertTime;
	
	@Column(name="operatetime")
	Date operateTime;

}
