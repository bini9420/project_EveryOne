package mall.model;

import java.util.Arrays;

public class PayInfo {
	
	private String id;
	private int[] pnum;
	private int[] qty;
	private double[] orderprice;
	private String contents;
	private String way;
	private String status;
	private String payment;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int[] getPnum() {
		return pnum;
	}
	public void setPnum(int[] pnum) {
		this.pnum = pnum;
	}
	public int[] getQty() {
		return qty;
	}
	public void setQty(int[] qty) {
		this.qty = qty;
	}
	public double[] getOrderprice() {
		return orderprice;
	}
	public void setOrderprice(double[] orderprice) {
		this.orderprice = orderprice;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWay() {
		return way;
	}
	public void setWay(String way) {
		this.way = way;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	
	@Override
	public String toString() {
		return "PayRequest [id=" + id + ", pnum=" + Arrays.toString(pnum) + ", qty=" + Arrays.toString(qty)
				+ ", orderprice=" + Arrays.toString(orderprice) + ", contents=" + contents + ", way=" + way
				+ ", status=" + status + ", payment=" + payment + "]";
	}

}
