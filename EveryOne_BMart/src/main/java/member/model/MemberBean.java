package member.model;



import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

public class MemberBean {
	
	private final String message = " 입력 필수";
	
	@NotEmpty(message="아이디"+message)
	private String id;
	
	@NotEmpty(message="이름"+message)
	private String name;
	
	@NotEmpty(message="비밀번호"+message)
	private String password;
	
	
	@NotBlank(message="핸드폰번호"+message)
	private String phone;
	
	@NotBlank(message = "이메일주소"+message)
	private String email;
	
	private String address;
	private String addr1;
	private String addr2;
	private String image;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getMessage() {
		return message;
	}
	public MemberBean() {
		super();
	}
	public MemberBean(String id, String name, String password, String phone, String email, String address, String addr1,
			String addr2, String image) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.image = image;
	}
	
	
	
	
	
	
	
	
}