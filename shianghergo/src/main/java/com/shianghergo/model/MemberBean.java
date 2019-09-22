package com.shianghergo.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

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
	private String register_Time;
	private String fileName;//使用者傳入圖檔名
	private Blob coverImage;//二進位
	//	private MultipartFile image;//前端圖	
	//private Integer state;// 用户账号状态：0表示未激活，1表示激活
	//private String code;// 激活码
	
	@OneToMany
	@JoinColumn(name="fk_member_id")
	private List<Report_MemberBean> list = new ArrayList<>();
	
	public MemberBean(Integer id, String account, String password, String name, String address, String email,
			String phone, Integer status, String birthday, String register_Time, String fileName) {
		super();
		this.id = id;
		this.account = account;
		this.password = password;
		this.name = name;
		this.address = address;
		this.email = email;
		this.phone = phone;
		this.status = status;
		this.birthday = birthday;
		this.register_Time = register_Time;
		this.fileName = fileName;
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
	public String getRegister_Time() {
		return register_Time;
	}
	public void setRegister_Time(String registerTime) {
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
				+ ", address=" + address + ", email=" + email + ", phone=" + phone + ", status=" + status
				+ ", birthday=" + birthday + ", register_Time=" + register_Time + ", fileName=" + fileName + "]";
	}

//	@XmlTransient
//	@Transient
//	public MultipartFile getImage() {
//		return image;
//	}
//
//	public void setImage(MultipartFile image) {
//		this.image = image;
//	}

	
}
