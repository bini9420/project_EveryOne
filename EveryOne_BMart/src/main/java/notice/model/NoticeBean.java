package notice.model;

import java.sql.Date;

import org.hibernate.validator.constraints.NotEmpty;

public class NoticeBean {
	
	private int nnum;
	
	@NotEmpty(message = "제목을 입력해주세요.")
	private String subject;
	
	@NotEmpty(message = "내용을 입력해주세요.")
	private String content;
	private Date ndate;
	private int readcount;
	
	@NotEmpty(message = "하나를 선택하세요")
	private String noti;
	private String id;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	private String category;
	
	public Date getNdate() {
		return ndate;
	}
	public void setNdate(Date ndate) {
		this.ndate = ndate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getNnum() {
		return nnum;
	}
	public void setNnum(int nnum) {
		this.nnum = nnum;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getNoti() {
		return noti;
	}
	public void setNoti(String noti) {
		this.noti = noti;
	}
		
	
}
