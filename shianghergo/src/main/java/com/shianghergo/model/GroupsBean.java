package com.shianghergo.model;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;


import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "groups")
public class GroupsBean implements Serializable {
	private static final long serialVersionUID = 1L;


	private Integer id;
//	private Integer member_id;
	private String start_time;
	private String end_time;
	private String status;
	private String name;
	private String detail; // 團購商品說明
	private String payment;// 付款方式
	private MemberBean memberBean;

	private Set<PlaceBean> place = new LinkedHashSet<>();
	
	
	private Set<Groups_ItemBean> groupsitem = new LinkedHashSet<>();
	
	private CategoryBean categoryBean;
	
	
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id")
	public CategoryBean getCategoryBean() {
		return categoryBean;
	}

	public void setCategoryBean(CategoryBean categoryBean) {
		this.categoryBean = categoryBean;
	}

	public GroupsBean(Integer id, Integer member_id, String start_time, String end_time, String status, String name,
			String detail, String payment, MemberBean memberBean) { // String category
		super();
		this.id = id;
//		this.member_id=member_id;
		this.start_time = start_time;
		this.end_time = end_time;
		this.status = status;
		this.name = name;
		this.detail = detail;
		this.payment = payment;
		this.memberBean = memberBean;


	}

	@Override
	public String toString() {
		return "GroupsBean [id=" + id + ", start_time=" + start_time + ", end_time=" + end_time + ", status=" + status
				+ ", name=" + name + ", detail=" + detail + ", payment=" + payment + ", groupsitem=" + groupsitem + "]";
	}

	public GroupsBean() {

	}

	// id由系統自動生成

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	@ManyToOne
	@JoinColumn(name = "member_id")
	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

	@OneToMany(mappedBy = "groupsBean", fetch = FetchType.EAGER) // 一對多
	public Set<Groups_ItemBean> getGroupsitem() {
		return groupsitem;
	}

	public void setGroupsitem(Set<Groups_ItemBean> groupsitem) {
		this.groupsitem = groupsitem;
	}
	
	@OneToMany(mappedBy = "groupsBean", fetch = FetchType.EAGER) // 一對多
	public Set<PlaceBean> getPlace() {
		return place;
	}

	public void setPlace(Set<PlaceBean> place) {
		this.place = place;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

}
