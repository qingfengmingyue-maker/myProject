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
	public String citycode;
	@Column(name="cityname")
	public String cityname;
	@Column(name="orglevel")
	public String orglevel;
	@Column(name="uppercode")
	public String uppercode;
	@Column(name="inserttime")
	public Date inserttime;
	@Column(name="operatetime")
	public Date operatetime;

}
