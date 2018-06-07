package com.mypet.ssm.po;

import java.util.Date;

/**
 * 用户类
 * 
 * @author Dan
 *
 */
public class User {
	/**
	 * 用户id
	 */
	private Long id;
	/**
	 * 用户名
	 */
	private String username;
	/**
	 * 用户密码
	 */
	private transient String pwd;
	/**
	 * 用户身份(领养者，发布者)
	 */
	private String identity;
	/**
	 * 用户性别(男/女)
	 */
	private String sex;
	/**
	 * 用户年龄
	 */
	private Byte age;
	/**
	 * 用户地址
	 */
	private String address;
	/**
	 * 用户电话
	 */
	private String phone;
	/**
	 * 用户邮箱
	 */
	private String email;
	/**
	 * 用户创建日期
	 */
	private Date created;
	/**
	 * 用户更新日期
	 */
	private Date updated;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username == null ? null : username.trim();
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd == null ? null : pwd.trim();
	}

	public String getIdentity() {
		return identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity == null ? null : identity.trim();
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex == null ? null : sex.trim();
	}

	public Byte getAge() {
		return age;
	}

	public void setAge(Byte age) {
		this.age = age;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address == null ? null : address.trim();
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone == null ? null : phone.trim();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email == null ? null : email.trim();
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Date getUpdated() {
		return updated;
	}

	public void setUpdated(Date updated) {
		this.updated = updated;
	}
}