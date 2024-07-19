package model;

public class StateBean {
	private int snum; //결재상태(-1: 반려, 0: 대기, 1: 승인, 10: 임시저장)
	private String sname; //결재상태명
	
	public StateBean() {
		super();
	}
	public StateBean(int snum, String sname) {
		super();
		this.snum = snum;
		this.sname = sname;
	}
	
	public int getSnum() {
		return snum;
	}
	public void setSnum(int snum) {
		this.snum = snum;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
}
