package model;

public class StateBean {
	private int snum; //�������(-1: �ݷ�, 0: ���, 1: ����, 10: �ӽ�����)
	private String sname; //������¸�
	
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
