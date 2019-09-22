package com.shianghergo.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "groups_item")
public class Groups_ItemBean implements Serializable {
	private static final long serialVersionUID = 1L;


	private Integer id;
	private String  name;
	private String  detail;
	private Integer price;
	private Blob    image;
	private GroupsBean groupsBean;
	
	private MultipartFile  productImage;

	@Transient
	public MultipartFile getProductImage() {
		return productImage;
	}

	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}
	
	public Groups_ItemBean() {
		
	}

	public Groups_ItemBean(Integer id, String name, String detail, Integer price, Blob image, GroupsBean groupsBean) {
		super();
		this.id = id;
		this.name = name;
		this.detail = detail;
		this.price = price;
//		this.groups_id=groups_id;
		this.groupsBean = groupsBean;
	}
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

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Blob getImage() {
		return image;
	}

	public void setImage(Blob image) {
		this.image = image;
	}

	@ManyToOne
	@JoinColumn(name="groups_id")
	public GroupsBean getGroupsBean() {
		return groupsBean;
	}

	public void setGroupsBean(GroupsBean groupsBean) {
		this.groupsBean = groupsBean;
	}

	@Override
	public String toString() {
		return "Groups_ItemBean [id=" + id + ", name=" + name + ", detail=" + detail + ", price=" + price + ", image="
				+ image + "]";
	}
	
}
