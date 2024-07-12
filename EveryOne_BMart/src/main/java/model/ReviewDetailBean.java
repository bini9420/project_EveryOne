package model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

public class ReviewDetailBean { //review, product join Bean
	private int rnum;
	private int pnum;
	private String image;
	@NotNull
	private int score;
	@NotBlank
	private String id;
	@NotBlank
	private String pname;
	private String rcomment;
	private String rdate;
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getRcomment() {
		return rcomment;
	}
	public void setRcomment(String rcomment) {
		this.rcomment = rcomment;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
}
