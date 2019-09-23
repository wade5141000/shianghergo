package com.shianghergo.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "message")
public class MessageBean implements Serializable{

	private static final long serialVersionUID = 1L;
	private Integer id;
	private String contents;
	private String time;
	private Integer status;
	private Integer member_id;
	private Integer target;
	private String title;
	
	public MessageBean(Integer id, Integer member_id, Integer target, String title, String contents, String time,
			Integer status) {
		super();
		this.id = id;
		this.member_id = member_id;
		this.target = target;
		this.title = title;
		this.contents = contents;
		this.time = time;
		this.status = status;
	}
	
	public MessageBean() {
		
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getMember_id() {
		return member_id;
	}

	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}

	public Integer getTarget() {
		return target;
	}

	public void setTarget(Integer target) {
		this.target = target;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}
