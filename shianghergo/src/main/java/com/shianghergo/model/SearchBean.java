package com.shianghergo.model;

import java.math.BigDecimal;
import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="item")
public class SearchBean {
	@Id
	private BigDecimal id;
	private String name;	
	private BigDecimal category_id;
	private BigDecimal store_id;
	private BigDecimal reserve;
	private BigDecimal price;
	private String detail;
	private Blob coverImage;
	private String fileName;
	@Override
	public String toString() {
		return "SearchBean [id=" + id + ", name=" + name + ", category_id=" + category_id + ", store_id=" + store_id
				+ ", reserve=" + reserve + ", price=" + price + ", detail=" + detail + ",coverImage=" + coverImage
				+",fileName=" + fileName+"]";
	}
	public BigDecimal getId() {
		return id;
	}
	public void setId(BigDecimal id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public BigDecimal getCategory_id() {
		return category_id;
	}
	public void setCategory_id(BigDecimal category_id) {
		this.category_id = category_id;
	}
	public BigDecimal getStore_id() {
		return store_id;
	}
	public void setStore_id(BigDecimal store_id) {
		this.store_id = store_id;
	}
	public BigDecimal getReserve() {
		return reserve;
	}
	public void setReserve(BigDecimal reserve) {
		this.reserve = reserve;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getfileName() {
		return fileName;
	}
	public void setfileName(String fileName) {
		this.fileName = fileName;
	}
	public Blob getcoverImage() {
		return coverImage;
	}
	public void setcoverImage(Blob coverImage) {
		this.coverImage = coverImage;
	}

}