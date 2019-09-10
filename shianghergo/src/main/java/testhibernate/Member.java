package testhibernate;

public class Member {

	
	private Long id;
	private String name;
	private Integer age;
	private String address;
	private Long category_id;
	private byte[] image;
	
	
	public Long getCategory_id() {
		return category_id;
	}
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	public void setCategory_id(Long category_id) {
		this.category_id = category_id;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "Member [id=" + id + ", name=" + name + ", age=" + age + ", address=" + address + ", category_id="
				+ category_id + "]";
	}
	
	
	
}
