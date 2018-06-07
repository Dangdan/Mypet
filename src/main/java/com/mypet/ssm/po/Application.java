package com.mypet.ssm.po;

import java.util.Date;

/**
 * 申请表类
 * 
 * @author Dan
 *
 */
public class Application {

	/**
	 * 表id
	 */
	private Long aid;
	/**
	 * 申请人
	 */
	private String requestname;
	private User requestUser;
	/**
	 * 发布人
	 */
	private String publishname;
	public User getRequestUser() {
		return requestUser;
	}

	public void setRequestUser(User requestUser) {
		this.requestUser = requestUser;
	}

	public User getPublishUser() {
		return publishUser;
	}

	public void setPublishUser(User publishUser) {
		this.publishUser = publishUser;
	}

	private User publishUser;
	/**
	 * 所申请宠物名字
	 */
	private String petname;
	private Pet requestPet;
	public Pet getRequestPet() {
		return requestPet;
	}

	public void setRequestPet(Pet requestPet) {
		this.requestPet = requestPet;
	}

	/**
	 * 表创建时间
	 */
	private Date created;
	/**
	 * 表更新时间
	 */
	private Date updated;
	/**
	 * 表状态 "申请中" "对方已接受" "对方已拒绝"
	 * 
	 */
	private String status;

	public Long getAid() {
		return aid;
	}

	public void setAid(Long aid) {
		this.aid = aid;
	}

	public String getRequestname() {
		return requestname;
	}

	public void setRequestname(String requestname) {
		this.requestname = requestname == null ? null : requestname.trim();
	}

	public String getPublishname() {
		return publishname;
	}

	public void setPublishname(String publishname) {
		this.publishname = publishname == null ? null : publishname.trim();
	}

	public String getPetname() {
		return petname;
	}

	public void setPetname(String petname) {
		this.petname = petname == null ? null : petname.trim();
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status == null ? null : status.trim();
	}
}