package com.platform.user.schema.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
//创建的数据库表名称
@Table(name = "user")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class User {
//	@Id
//	@Column(name="usercode")
//	public String usercode;
//	@Column(name="orgname")
//	public String orgname;
//	@Column(name="username")
//	public String username;
//	@Column(name="telphone")
//	public String telphone;
//	@Column(name="postflag")
//	public String postflag;
//	@Column(name="inserttime")
//	public Date inserttime;
//	@Column(name="operatetime")
//	public Date operatetime;


//  //关键字生成模式
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)//设置为自动递增
  @Column(name="id")
  public Integer id;

  @Column(name="username")
  public String userName;

  @Column(name="password")
  public String passWord;
//
//public Integer getId() {
//	return id;
//}
//
//public void setId(Integer id) {
//	this.id = id;
//}
//
//public String getUserName() {
//	return userName;
//}
//
//public void setUserName(String userName) {
//	this.userName = userName;
//}
//
//public String getPassWord() {
//	return passWord;
//}
//
//public void setPassWord(String passWord) {
//	this.passWord = passWord;
//}
  
  //省略了get和set方法
}
