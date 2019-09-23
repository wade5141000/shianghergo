package com.shianghergo.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="order_info")
public class OrderBean implements Serializable {
	
	
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer member_id;
	private Integer store_id;
	private Integer item_count;
	private Integer price;
	private String order_time;
	private String payment;
	private String pay_time;
	private Integer status;
	private Set<OrderDetailBean> orderDetail = new HashSet<>();
	
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
	public Integer getStore_id() {
		return store_id;
	}
	public void setStore_id(Integer store_id) {
		this.store_id = store_id;
	}
	public Integer getItem_count() {
		return item_count;
	}
	public void setItem_count(Integer item_count) {
		this.item_count = item_count;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getOrder_time() {
		return order_time;
	}
	public void setOrder_time(String order_time) {
		this.order_time = order_time;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getPay_time() {
		return pay_time;
	}
	public void setPay_time(String pay_time) {
		this.pay_time = pay_time;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
	@OneToMany(fetch = FetchType.EAGER)
	@JoinColumn(name = "order_id")
	public Set<OrderDetailBean> getOrderDetail() {
		return orderDetail;
	}
	public void setOrderDetail(Set<OrderDetailBean> orderDetail) {
		this.orderDetail = orderDetail;
	}
	
	
}
