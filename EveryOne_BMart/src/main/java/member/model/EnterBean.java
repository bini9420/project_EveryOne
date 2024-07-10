package member.model;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class EnterBean {

	private String eno; //������û: A-
	private String writer;
	private String writeday;
	
	@NotEmpty(message="������ �Է��ϼ���")
	private String title;
	
	@NotEmpty(message="����� �ڵ带 �Է��ϼ���")
	private String businesscode;
	
	@NotEmpty(message="�����ȣ�� �Է��ϼ���")
	private String postnum;
	
	@NotEmpty(message="�ּҸ� �Է��ϼ���")
	private String addr1;
	
	@NotEmpty(message="���ּҸ� �Է��ϼ���")
	private String addr2;
	
	private int request;
	private String reason;
	private String originname;
	private String updatename; //����, �����Ϸ��� ���ϸ�
	private int approval;
	private String approveday;
	private String okimage;
	private int dstatus;
	
	//DB ���̺� �������� �ʴ� ���� �߰�
	private MultipartFile upload;
	
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		System.out.println("setUpload()");
		//System.out.println("Upload: " + upload);
		//org.springframework.web.multipart.commons.CommonsMultipartFile@6cd7f0cd => MultipartFile�� �������� upload�� �ּ�
		
		this.upload = upload;
		if(this.upload != null) {
			System.out.println(upload.getName()); //upload
			System.out.println(upload.getOriginalFilename()); //��¥ file �̸�
			originname = upload.getOriginalFilename();
		}
	}
	
	public String getEno() {
		return eno;
	}
	public void setEno(String eno) {
		this.eno = eno;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBusinesscode() {
		return businesscode;
	}
	public void setBusinesscode(String businesscode) {
		this.businesscode = businesscode;
	}
	public String getPostnum() {
		return postnum;
	}
	public void setPostnum(String postnum) {
		this.postnum = postnum;
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
	public int getRequest() {
		return request;
	}
	public void setRequest(int request) {
		this.request = request;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getOriginname() {
		return originname;
	}
	public void setOriginname(String originname) {
		this.originname = originname;
	}
	public String getUpdatename() {
		return updatename;
	}
	public void setUpdatename(String updatename) {
		this.updatename = updatename;
	}
	public int getApproval() {
		return approval;
	}
	public void setApproval(int approval) {
		this.approval = approval;
	}
	public String getApproveday() {
		return approveday;
	}
	public void setApproveday(String approveday) {
		this.approveday = approveday;
	}
	public String getOkimage() {
		return okimage;
	}
	public void setOkimage(String okimage) {
		this.okimage = okimage;
	}
	public int getDstatus() {
		return dstatus;
	}
	public void setDstatus(int dstatus) {
		this.dstatus = dstatus;
	}
	
}
