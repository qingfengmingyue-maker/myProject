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
@Table(name = "regulation")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Regulation {
	@Id
	@Column(name="businessno")
	public String businessNo;
	@Column(name="groupNo")
	public String groupNo;
	@Column(name="maxNo")
	public String maxNo;
	@Column(name="inserttime" ,insertable = false, updatable = false )
	public Date insertTime;

}
