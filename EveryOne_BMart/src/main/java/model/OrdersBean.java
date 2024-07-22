package model;

import java.sql.Date;

import org.hibernate.validator.constraints.NotBlank;

public class OrdersBean {
	private int onum;
    private String id;
    private int pnum;
    private int pamount;
    private int price;
    
    @NotBlank(message = "요청사항을 입력해주세요.")
    private String contents;
    @NotBlank(message = "배송방법을 선택해주세요.")
    private String way;
    private int status;
    private String payment;
    private Date orderdate;
    
	public int getOnum() {
		return onum;
	}
	public void setOnum(int onum) {
		this.onum = onum;
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
	public int getPamount() {
		return pamount;
	}
	public void setPamount(int pamount) {
		this.pamount = pamount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
    
    
}
