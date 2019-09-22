package com.shianghergo.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlTransient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
// 本類別封裝單筆書籍資料
@Entity
@Table(name="item")
public class ItemBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer 	id ;
	private String  	name;
	private String  	category;
	private Integer  	store_id;
	private Integer  	reserve;
	private Integer  	price;
	private String		detail;
	@JsonIgnore
	private Blob    	coverImage;	
	private String  	fileName;
	
	//private String  	companyName;
	@JsonIgnoreProperties("items")
    private StoreBean storeBean;
    @JsonIgnore
    private MultipartFile productImage;
    @XmlTransient
    @Transient
    public MultipartFile getProductImage() {
    	return productImage;
    }
	
    public void setProductImage(MultipartFile productImage) {
    	this.productImage = productImage;
    }
    
	public ItemBean(Integer id, String name, String category, 
			Integer store_id, Integer reserve, Integer price, 
			String detail, Blob coverImage, String fileName) {
		this.id = id;
		this.name = name;
		this.category = category;
		this.store_id = store_id;
		this.reserve = 0;
		this.price = price;
		this.detail = detail;
		this.coverImage = coverImage;
		this.fileName = fileName;
	}
	
	public ItemBean(Integer id, String name, String category, 
			Integer store_id, Integer reserve, Integer price, 
			String detail, Blob coverImage, String fileName, StoreBean storeBean) {
		this.id = id;
		this.name = name;
		this.category = category;
		this.store_id = store_id;
		this.reserve = reserve;
		this.price = price;
		this.detail = detail;
		this.coverImage = coverImage;
		this.fileName = fileName;
		this.storeBean = storeBean;
	}
	
	public ItemBean() {
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {   // bookId
		return id;
	}
	public void setId(Integer ID) {
		this.id = ID;
	}
	
	
//	@ManyToOne(cascade=CascadeType.ALL)
	@ManyToOne()
	@JoinColumn(name="store_id") 
	public StoreBean getStoreBean() {
		return storeBean;
	}

	public void setStoreBean(StoreBean storeBean) {
		this.storeBean = storeBean;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	private String  priceStr = null;
	@Transient
	public String getPriceStr() {
		return priceStr;
	}

	public void setPriceStr(String priceStr) {
		this.priceStr = priceStr;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
		if (priceStr == null) {
			priceStr = String.valueOf(price);
		}
	}
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public Blob getCoverImage() {
		return coverImage;
	}
	public void setCoverImage(Blob coverImage) {
		this.coverImage = coverImage;
	}
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	@Transient
	public Integer getStore_id() {
		return store_id;
	}

	public void setStore_id(Integer store_id) {
		this.store_id = store_id;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Integer getReserve() {
		return reserve;
	}

	public void setReserve(Integer reserve) {
		this.reserve = reserve;
	}
}
