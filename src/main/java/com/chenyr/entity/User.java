package com.chenyr.entity;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable{
	private static final long serialVersionUID = -6772712692983023406L;
	private Integer id;
	private String usename;
	private String pasword;
	private Date createdUserTime;
	private Integer rank;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsename() {
		return usename;
	}
	public void setUsename(String usename) {
		this.usename = usename;
	}
	public String getPasword() {
		return pasword;
	}
	public void setPasword(String pasword) {
		this.pasword = pasword;
	}
	public Date getCreatedUserTime() {
		return createdUserTime;
	}
	public void setCreatedUserTime(Date createdUserTime) {
		this.createdUserTime = createdUserTime;
	}
	public Integer getRank() {
		return rank;
	}
	public void setRank(Integer rank) {
		this.rank = rank;
	}
}
