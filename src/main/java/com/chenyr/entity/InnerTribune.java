package com.chenyr.entity;

import java.io.Serializable;

public class InnerTribune implements Serializable{
	private static final long serialVersionUID = -3358169772936943781L;
	private Integer id;
	private Integer oid;
	private String iuname;
	private String iuip;
	private String iuagent;
	private String createdTimeInner;
	private String icomment;
	public String getCreatedTimeInner() {
		return createdTimeInner;
	}
	public void setCreatedTimeInner(String createdTimeInner) {
		this.createdTimeInner = createdTimeInner;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	public String getIuname() {
		return iuname;
	}
	public void setIuname(String iuname) {
		this.iuname = iuname;
	}
	public String getIuip() {
		return iuip;
	}
	public void setIuip(String iuip) {
		this.iuip = iuip;
	}
	public String getIuagent() {
		return iuagent;
	}
	public void setIuagent(String iuagent) {
		this.iuagent = iuagent;
	}
	public String getIcomment() {
		return icomment;
	}
	public void setIcomment(String icomment) {
		this.icomment = icomment;
	}
	
}
