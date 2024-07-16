package model;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class MemberBean {
	
	private final String message = " 입력 필수";
	
	//table에 없는 변수 추가
	private MultipartFile upload;
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		System.out.println("setUpload_upload: "+upload); //파일 이름이 아니라 주소가 들어감.
		this.upload = upload;
		if(this.upload != null) { //파일을 선택했으면
			System.out.println(upload.getName()); //name속성값
			System.out.println(upload.getOriginalFilename()); //파일의 이름
			image = upload.getOriginalFilename(); //이미지 변수에 파일의 이름을 넣음
		}
	}
	
	private String upload2;
	public String getUpload2() {
		return upload2;
	}
	public void setUpload2(String upload2) {
		this.upload2 = upload2;
	}

	@NotEmpty(message="아이디"+message)
	private String id;
	
	@NotEmpty(message="이름"+message)
	private String name;
	
	@NotEmpty(message="비밀번호"+message)
	private String password;
	
	
	@NotBlank(message="번호 앞자리 선택 필수")
	@Length(max=3, message="번호 앞자리는 최대 3자리 입력")
	private String phone1;
	
	@NotBlank(message="번호 중간자리"+message)
	@Length(max=4, message="번호 중간자리는 최대 4자리 입력")
	private String phone2;
	
	@NotBlank(message="번호 끝자리"+message)
	@Length(max=4, message="번호 끝자리 최대 4자리 입력")
	private String phone3;
	
	@NotBlank(message = "이메일"+message)
	private String email1;
	
	@NotBlank(message = "이메일주소 선택 필수")
	private String email2;
	
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
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
}