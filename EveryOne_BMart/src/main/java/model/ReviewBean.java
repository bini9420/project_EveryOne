package model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

public class ReviewBean {
	private int rnum;
	private String id;
	private int pnum;
	
	@NotBlank
	private String rcomment;
	private String image;
	private String rdate;
	
	@NotNull
	private int score;
	private int onum;
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getRcomment() {
		return rcomment;
	}
	public void setRcomment(String rcomment) {
		this.rcomment = rcomment;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getOnum() {
		return onum;
	}
	public void setOnum(int onum) {
		this.onum = onum;
	}
	
	
	//���� ���� ���ε带 ���� ���� �߰�
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
	
}
