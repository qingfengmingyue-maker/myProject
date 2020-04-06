package com.platform.user.schema.model;

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
@Table(name = "usermsg")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class UserMsg {
	@Id
	@Column(name="usercode")
	private String userCode;
	
	@Column(name="userpwd")
	private String userPwd;
	
	@Column(name="orgname")
	private String orgName;
	
	@Column(name="username")
	private String userName;
	
	@Column(name="telphone")
	private String telPhone;
	
	@Column(name="postflag")
	private String postFlag;
	
	@Column(name="inserttime")
	private Date insertTime;
	
	@Column(name="operatetime")
	private Date operateTime;
}
