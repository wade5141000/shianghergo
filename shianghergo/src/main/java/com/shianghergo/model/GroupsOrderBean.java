package com.shianghergo.model;

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

@Entity
@Table(name="groups_order_info")
public class GroupsOrderBean {
		    		  
	private Integer id;
	private Integer member_id;
	private Integer groups_id;
	private String name;
	private String phone;
	private Integer status;
	private Integer price;
	private String time;
	private String payment;
//	private Integer place_id;
	
	private Set<GroupsOrderDetailBean> orderDetail;
	
	
	private PlaceBean place;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "place_id")
	public PlaceBean getPlace() {
		return place;
	}
	public void setPlace(PlaceBean place) {
		this.place = place;
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
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
	public Integer getGroups_id() {
		return groups_id;
	}
	public void setGroups_id(Integer groups_id) {
		this.groups_id = groups_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	
	@OneToMany(fetch=FetchType.EAGER)
	@JoinColumn(name="groups_order_info_id")
	public Set<GroupsOrderDetailBean> getOrderDetail() {
		return orderDetail;
	}
	public void setOrderDetail(Set<GroupsOrderDetailBean> orderDetail) {
		this.orderDetail = orderDetail;
	}
	
	
}
