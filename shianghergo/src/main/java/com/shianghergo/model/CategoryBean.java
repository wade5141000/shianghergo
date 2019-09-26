package com.shianghergo.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="category")
public class CategoryBean implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String name;
	private Set<ItemBean> items;
	private Set<GroupsBean> groups;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@OneToMany(fetch = FetchType.EAGER,mappedBy="categoryBean")
	public Set<ItemBean> getItems() {
		return items;
	}
	public void setItems(Set<ItemBean> items) {
		this.items = items;
	}
	@OneToMany(fetch = FetchType.EAGER,mappedBy="categoryBean")
	public Set<GroupsBean> getGroups() {
		return groups;
	}
	public void setGroups(Set<GroupsBean> groups) {
		this.groups = groups;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "CategoryBean [id=" + id + ", name=" + name + ", items=" + items + ", groups=" + groups + "]";
	}
	
	
	
	
}
