package com.platform.common.schema;



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
@Table(name = "baseorganization")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class BaseOrganization {
	@Id
	@Column(name="citycode")
	public String cityCode;
	@Column(name="cityname")
	public String cityName;
	@Column(name="orglevel")
	public String orgLevel;
	@Column(name="uppercode")
	public String upperCode;
	@Column(name="inserttime")
	public Date insertTime;
	@Column(name="operatetime")
	public Date operateTime;

}
