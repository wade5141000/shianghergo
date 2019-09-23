package com.shianghergo.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="cart")
public class CartBean implements Serializable{
	

	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer item_id;
	private Integer member_id;
	private Integer store_id;
	private String name;
	private Integer price;
	private Integer amount;
	
	public CartBean(Integer item_id, Integer member_id, Integer store_id, String name, Integer price, Integer amount) {
		super();
		this.item_id = item_id;
		this.member_id = member_id;
		this.store_id = store_id;
		this.name = name;
		this.price = price;
		this.amount = amount;
	}

	public CartBean() {
		
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getItem_id() {
		return item_id;
	}
	public void setItem_id(Integer item_id) {
		this.item_id = item_id;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	
	@Override
	public String toString() {
		return "cartBean [item_id=" + item_id + ", member_id=" + member_id + ", store_id=" + store_id + ", name=" + name
				+ ", price=" + price + ", amount=" + amount + "]";
	}
	
}
