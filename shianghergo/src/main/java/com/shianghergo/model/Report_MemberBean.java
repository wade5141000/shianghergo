package com.shianghergo.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="report_member")
public class Report_MemberBean implements Serializable  {


	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
   
	private Integer member_id;  //會員ID
	private Integer category_report_id;  //檢舉類別	
	private Integer store_id;    //商店ID
	
	private Integer target;     
	private String contents;   //內容
	private String time;    //時間
	private Integer status;  //狀態
	private String process_time;  //處理時間
	private String process_result;  //處理結果
	


	public Report_MemberBean() {

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public Integer getTarget() {
		return target;
	}

	public void setTarget(Integer target) {
		this.target = target;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Integer getCategory_report_id() {
		return category_report_id;
	}

	public void setCategory_report_id(Integer category_report_id) {
		this.category_report_id = category_report_id;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Integer  getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getProcess_time() {
		return process_time;
	}

	public void setProcess_time(String process_time) {
		this.process_time = process_time;
	}

	public String getProcess_result() {
		return process_result;
	}

	public void setProcess_result(String process_result) {
		this.process_result = process_result;
	}
	@Override
	public String toString() {
		return "Report_MemberBean [id=" + id + ", member_id=" + member_id + ", category_report_id=" + category_report_id
				+ ", store_id=" + store_id + ", target=" + target + ", contents=" + contents + ", time=" + time
				+ ", status=" + status + ", process_time=" + process_time + ", process_result=" + process_result + "]";
	}
}

