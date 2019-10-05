package com.shianghergo.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "place")
public class PlaceBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String address;
	private String longitude;
	private String latitude;
	private String time;
	
	private GroupsBean groupsBean;

	private Set<GroupsOrderBean> groupsOrder;
	
	@OneToMany(mappedBy = "place")
	public Set<GroupsOrderBean> getGroupsOrder() {
		return groupsOrder;
	}
	public void setGroupsOrder(Set<GroupsOrderBean> groupsOrder) {
		this.groupsOrder = groupsOrder;
	}

	public PlaceBean(Integer id, String address, String longitude, String latitude, String time,
			GroupsBean groupsBean) {
	
		this.id = id;
		this.address = address;
		this.longitude = longitude;
		this.latitude = latitude;
		this.time = time;
		this.groupsBean = groupsBean;
	}

	public PlaceBean() {
		
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	@ManyToOne
	@JoinColumn(name="groups_id")
	public GroupsBean getGroupsBean() {
		return groupsBean;
	}

	public void setGroupsBean(GroupsBean groupsBean) {
		this.groupsBean = groupsBean;
	}


//	@Override
//	public String toString() {
//		return "PlaceBean [id=" + id + ", address=" + address + ", longitude=" + longitude + ", latitude=" + latitude
//				+ ", time=" + time + ", groupsBean=" + groupsBean + "]";
//	}
	
	
	
	
	
	
	
	
}
