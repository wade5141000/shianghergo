package com.shianghergo.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlTransient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "member")
public class MemberBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String account;
	private String password;
	private String name;
	private String address;
	private String email;
	private String phone;
	private Integer status;
	private String birthday;
	private Timestamp register_Time;
	private String fileName;//使用者傳入圖檔名
	private Blob coverImage;//二進位
	//	private MultipartFile image;//前端圖	
	//private Integer state;// 用户账号状态：0表示未激活，1表示激活
	//private String code;// 激活码
	private MultipartFile image;
	private Set<GroupsBean> groups = new LinkedHashSet<>();
	private Set<OrderBean> orders = new HashSet<>();
	private Set<GroupsOrderBean> groupOrders = new HashSet<>();
	
	@OneToMany(mappedBy="memberBean",fetch = FetchType.EAGER)
	public Set<GroupsBean> getGroupsbean() {
		return groups;
	}

	public void setGroupsbean(Set<GroupsBean> groups) {
		this.groups = groups;
	}
	
	@OneToMany
	@JoinColumn(name="fk_member_id")
	private List<Report_MemberBean> list = new ArrayList<>();
	
	public MemberBean(Integer id, String account, String password, String name, String address, String email,
			String phone, String birthday, Timestamp register_Time, String fileName, Blob coverImage,MultipartFile image,Integer status) {
		super();
		this.id = id;
		this.account = account;
		this.password = password;
		this.name = name;
		this.address = address;
		this.email = email;
		this.phone = phone;
		this.birthday = birthday;
		this.register_Time = register_Time;
		this.fileName = fileName;
		this.coverImage=coverImage;
		this.image = image;
		this.status=status;
	}
	
	public MemberBean()
	{
		
	}
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public Timestamp getRegister_Time() {
		return register_Time;
	}
	public void setRegister_Time(Timestamp registerTime) {
		this.register_Time = registerTime;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public Integer getStatus() {
		return status;
	}
	
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Blob getCoverImage() {
		return coverImage;
	}

	public void setCoverImage(Blob coverImage) {
		this.coverImage = coverImage;
	}
	@Override
	public String toString() {
		return "MemberBean [id=" + id + ", account=" + account + ", password=" + password + ", name=" + name
				+ ", address=" + address + ", email=" + email + ", phone=" + phone + ", birthday=" + birthday
				+ ", register_Time=" + register_Time + ", fileName=" + fileName + ", coverImage=" + coverImage
				+ ", image=" + image + ", status=" + status + "]";
	}

	@XmlTransient
	@Transient
	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}
	
	
	@OneToMany(fetch = FetchType.EAGER)
	@JoinColumn(name="member_id")
	public Set<OrderBean> getOrders() {
		return orders;
	}

	public void setOrders(Set<OrderBean> orders) {
		this.orders = orders;
	}

	@OneToMany(fetch = FetchType.EAGER)
	@JoinColumn(name="member_id")
	public Set<GroupsOrderBean> getGroupOrders() {
		return groupOrders;
	}

	public void setGroupOrders(Set<GroupsOrderBean> groupOrders) {
		this.groupOrders = groupOrders;
	}

	
}
