package sale.model;

public class orderInfoBean {
  private int onum;
  private String id;
  private int pnum;
  private int pamount;
  private int price;
  private String way;
  private String status;
  private String orderdate;
  private int totalPrice;
  
public int getTotalPrice() {
	return totalPrice;
}
public void setTotalPrice(int totalPrice) {
	this.totalPrice = totalPrice;
}
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
public String getOrderdate() {
	return orderdate;
}
public void setOrderdate(String orderdate) {
	this.orderdate = orderdate;
}
  
  
  
  
}
