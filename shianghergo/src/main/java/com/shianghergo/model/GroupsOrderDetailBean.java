package com.shianghergo.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="groups_order_detail")
public class GroupsOrderDetailBean implements Serializable{

	
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer groups_order_info_id;
	private Integer groups_item_id;
	private String name;
	private Integer amount;
	private Integer price;
	
	public GroupsOrderDetailBean(Integer id, Integer groups_order_info_id, Integer groups_item_id, String name,
			Integer amount, Integer price) {
		super();
		this.id = id;
		this.groups_order_info_id = groups_order_info_id;
		this.groups_item_id = groups_item_id;
		this.name = name;
		this.amount = amount;
		this.price = price;
	}
	
	public GroupsOrderDetailBean() {
		
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getGroups_order_info_id() {
		return groups_order_info_id;
	}
	public void setGroups_order_info_id(Integer groups_order_info_id) {
		this.groups_order_info_id = groups_order_info_id;
	}
	public Integer getGroups_item_id() {
		return groups_item_id;
	}
	public void setGroups_item_id(Integer groups_item_id) {
		this.groups_item_id = groups_item_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	
	
	
}
