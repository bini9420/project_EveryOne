package model;

import org.hibernate.validator.constraints.NotBlank;

public class AddressBean {

	private int anum;
	private String id;
	
	@NotBlank(message = "배송지를 선택해주세요.")
	private String alias;
	@NotBlank
	private String post;
	@NotBlank
	private String addr1;
	@NotBlank
	private String addr2;
	
	
	public int getAnum() {
		return anum;
	}
	public void setAnum(int anum) {
		this.anum = anum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAlias() {
		return alias;
	}
	public void setAlias(String alias) {
		this.alias = alias;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
}
