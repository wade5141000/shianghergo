package com.shianghergo.model;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
// 本類別封裝單筆出版社資料
@Entity
@Table(name="store")
public class StoreBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer		id;
	private Integer		member_id;
	private String		name;
	private String		detail;
	private Integer		status;
	private Set<ItemBean> items = new LinkedHashSet<>();

	
	public StoreBean(Integer id, Integer member_id, String name, String detail, Integer status) {
		this.id = id;
		this.member_id = member_id;
		this.name = name;
		this.detail = detail;
		this.status = status;
	}
	public StoreBean() {
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	@OneToMany(mappedBy="storeBean",fetch = FetchType.EAGER)
	public Set<ItemBean> getItems() {
		return items;
	}
	public void setItems(Set<ItemBean> items) {
		this.items = items;
	}
	
	
	public Integer getMember_id() {
		return member_id;
	}
	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
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

	public Integer getUrl() {
		return status;
	}

	public void setUrl(Integer status) {
		this.status = status;
	}
	
	public Integer getStatus() {
		return status;
	}
	
	public void setStatus(Integer status) {
		this.status = status;
	}
	
}