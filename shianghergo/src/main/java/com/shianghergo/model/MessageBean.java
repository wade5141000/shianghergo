package com.shianghergo.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "message")
public class MessageBean implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private MemberBean targetBean;
	
	
	private Integer id;
	private String contents;
	private String time;
	private Integer status;
	//private Integer member_id;
	private Integer target;
	private String title;
	private MemberBean memberBean;

	public MessageBean(Integer id, String contents, String time, Integer status, Integer target, String title,
			MemberBean memberBean) {
		super();
		this.id = id;
		this.contents = contents;
		this.time = time;
		this.status = status;
		this.target = target;
		this.title = title;
		this.memberBean = memberBean;
	}

	public MessageBean() {
		
	}
	
	@Transient
	public MemberBean getTargetBean() {
		return targetBean;
	}

	public void setTargetBean(MemberBean targetBean) {
		this.targetBean = targetBean;
	}

	@ManyToOne
	@JoinColumn(name="member_id")
	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
//	public Integer getMember_id() {
//		return member_id;
//	}
//
//	public void setMember_id(Integer member_id) {
//		this.member_id = member_id;
//	}

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
