package document.model;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class DocumentBean {
	private String dnum; //입점요청: A-, 물품등록: B-, 광고요청: C-, 휴업신청: D-
	
	@NotEmpty(message="결재종류를 선택하세요")
	private String dcategory; //'입점요청', '물품등록', '광고요청', '휴업신청'
	private String writer;
	private String writeday;
	
	@NotEmpty(message="제목을 입력하세요")
	private String title;
	
	@NotEmpty(message="내용을 입력하세요")
	private String dcontent;
	private int request;
	private String reason;
	private String orginname;
	private String updatename;//수정, 삭제하려는 파일명
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
			orginname = upload.getOriginalFilename();
		}
	}
	
	public DocumentBean() {
		super();
	}
	public DocumentBean(String dnum, String dcategory, String writer, String writeday, String title, String dcontent,
			int request, String reason, String orginname, String updatename, int approval, String approveday,
			String okimage, int dstatus) {
		super();
		this.dnum = dnum;
		this.dcategory = dcategory;
		this.writer = writer;
		this.writeday = writeday;
		this.title = title;
		this.dcontent = dcontent;
		this.request = request;
		this.reason = reason;
		this.orginname = orginname;
		this.updatename = updatename;
		this.approval = approval;
		this.approveday = approveday;
		this.okimage = okimage;
		this.dstatus = dstatus;
	}
	
	public String getDnum() {
		return dnum;
	}
	public void setDnum(String dnum) {
		this.dnum = dnum;
	}
	public String getDcategory() {
		return dcategory;
	}
	public void setDcategory(String dcategory) {
		this.dcategory = dcategory;
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
	public String getDcontent() {
		return dcontent;
	}
	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
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
	public String getOrginname() {
		return orginname;
	}
	public void setOrginname(String orginname) {
		this.orginname = orginname;
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
