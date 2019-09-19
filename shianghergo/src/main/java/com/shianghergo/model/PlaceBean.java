package com.shianghergo.model;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="place")
public class PlaceBean {

	private Integer id;
	private Integer groups_id;
	private String address;
	private String longitude;
	private String latitude;
	private String time;
	
	private Set<GroupsOrderBean> groupsOrder;
	
	@OneToMany(mappedBy = "place")
	public Set<GroupsOrderBean> getGroupsOrder() {
		return groupsOrder;
	}
	public void setGroupsOrder(Set<GroupsOrderBean> groupsOrder) {
		this.groupsOrder = groupsOrder;
	}
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getGroups_id() {
		return groups_id;
	}
	public void setGroups_id(Integer groups_id) {
		this.groups_id = groups_id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
}
