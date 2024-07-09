package member.model;



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
	
	
	@NotBlank(message="�ڵ�����ȣ"+message)
	private String phone;
	
	@NotBlank(message = "�̸����ּ�"+message)
	private String email;
	
	private String image;
	private String ownercode;
	private int state;
	
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getMessage() {
		return message;
	}
	public String getOwnercode() {
		return ownercode;
	}
	public void setOwnercode(String ownercode) {
		this.ownercode = ownercode;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
}