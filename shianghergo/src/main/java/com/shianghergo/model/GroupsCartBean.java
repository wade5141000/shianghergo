package com.shianghergo.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="groups_cart")
public class GroupsCartBean implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	
	private Integer id;
	private Integer member_id;
	private Integer groups_id;
	private Integer groups_item_id;
	private Integer price;
	private Integer amount;
	private String name;
	
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
	public Integer getGroups_item_id() {
		return groups_item_id;
	}
	public void setGroups_item_id(Integer groups_item_id) {
		this.groups_item_id = groups_item_id;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	

}
