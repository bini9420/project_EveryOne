package model;

import java.sql.Date;

import org.hibernate.validator.constraints.NotEmpty;

public class DescriptionBean {
	
	private int dnum;
	private String id;
	
	@NotEmpty(message = "제목을 입력해주세요")
	private String dsubject;
	
	@NotEmpty(message = "내용을 입력해주세요")
	private String dcontent;
	
	private String password;
	private Date ddate;
	private int ref;
	private int re_step;
	private int re_level;
	
	public int getDnum() {
		return dnum;
	}
	public void setDnum(int dnum) {
		this.dnum = dnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDsubject() {
		return dsubject;
	}
	public void setDsubject(String dsubject) {
		this.dsubject = dsubject;
	}
	public String getDcontent() {
		return dcontent;
	}
	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getDdate() {
		return ddate;
	}
	public void setDdate(Date ddate) {
		this.ddate = ddate;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	
	
	
}
