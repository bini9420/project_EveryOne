package model;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class MemberBean {
	
	private final String message = " �Է� �ʼ�";
	
	//table�� ���� ���� �߰�
	private MultipartFile upload;
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		System.out.println("setUpload_upload: "+upload); //���� �̸��� �ƴ϶� �ּҰ� ��.
		this.upload = upload;
		if(this.upload != null) { //������ ����������
			System.out.println(upload.getName()); //name�Ӽ���
			System.out.println(upload.getOriginalFilename()); //������ �̸�
			image = upload.getOriginalFilename(); //�̹��� ������ ������ �̸��� ����
		}
	}
	
	private String upload2;
	public String getUpload2() {
		return upload2;
	}
	public void setUpload2(String upload2) {
		this.upload2 = upload2;
	}

	@NotEmpty(message="���̵�"+message)
	private String id;
	
	@NotEmpty(message="�̸�"+message)
	private String name;
	
	@NotEmpty(message="��й�ȣ"+message)
	private String password;
	
	
	@NotBlank(message="��ȣ ���ڸ� ���� �ʼ�")
	@Length(max=3, message="��ȣ ���ڸ��� �ִ� 3�ڸ� �Է�")
	private String phone1;
	
	@NotBlank(message="��ȣ �߰��ڸ�"+message)
	@Length(max=4, message="��ȣ �߰��ڸ��� �ִ� 4�ڸ� �Է�")
	private String phone2;
	
	@NotBlank(message="��ȣ ���ڸ�"+message)
	@Length(max=4, message="��ȣ ���ڸ� �ִ� 4�ڸ� �Է�")
	private String phone3;
	
	@NotBlank(message = "�̸���"+message)
	private String email1;
	
	@NotBlank(message = "�̸����ּ� ���� �ʼ�")
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