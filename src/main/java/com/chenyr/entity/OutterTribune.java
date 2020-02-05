package com.chenyr.entity;

import java.io.Serializable;
import java.util.List;

public class OutterTribune implements Serializable{
	private static final long serialVersionUID = 5421000171403178174L;

	private Integer id;
	
	private Integer tid;
	
	private String uname;
	
	private String uip;
	
	private String uagent;
	
	private String createdTime;
	
	private String comment;
	
	private List<InnerTribune> listOfTribunes;

	public String getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(String createdTime) {
		this.createdTime = createdTime;
	}

	public List<InnerTribune> getListOfTribunes() {
		return listOfTribunes;
	}

	public void setListOfTribunes(List<InnerTribune> listOfTribunes) {
		this.listOfTribunes = listOfTribunes;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUip() {
		return uip;
	}

	public void setUip(String uip) {
		this.uip = uip;
	}

	public String getUagent() {
		return uagent;
	}

	public void setUagent(String uagent) {
		this.uagent = uagent;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
}
