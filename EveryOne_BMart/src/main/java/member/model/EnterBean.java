package member.model;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class EnterBean {

	private String eno; //입점요청: A-
	private String writer;
	private String writeday;
	
	@NotEmpty(message="제목을 입력하세요")
	private String title;
	
	@NotEmpty(message="사업자 코드를 입력하세요")
	private String businesscode;
	
	@NotEmpty(message="우편번호를 입력하세요")
	private String postnum;
	
	@NotEmpty(message="주소를 입력하세요")
	private String addr1;
	
	@NotEmpty(message="상세주소를 입력하세요")
	private String addr2;
	
	private int request;
	private String reason;
	private String originname;
	private String updatename; //수정, 삭제하려는 파일명
	private int approval;
	private String approveday;
	private String okimage;
	private int dstatus;
	
	//DB 테이블에 존재하지 않는 변수 추가
	private MultipartFile upload;
	
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		System.out.println("setUpload()");
		//System.out.println("Upload: " + upload);
		//org.springframework.web.multipart.commons.CommonsMultipartFile@6cd7f0cd => MultipartFile의 참조변수 upload의 주소
		
		this.upload = upload;
		if(this.upload != null) {
			System.out.println(upload.getName()); //upload
			System.out.println(upload.getOriginalFilename()); //진짜 file 이름
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
