package mall.model;

import org.hibernate.validator.constraints.NotBlank;

public class PaynDelieveryInfo {
	
	@NotBlank(message = "배송방법을 선택해주세요.")
	private String way;
	@NotBlank(message = "결제수단을 선택해주세요.")
	private String payment;
	@NotBlank(message = "배송지를 선택해주세요.")
	private String alias;
	
	public String getWay() {
		return way;
	}
	public void setWay(String way) {
		this.way = way;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getAlias() {
		return alias;
	}
	public void setAlias(String alias) {
		this.alias = alias;
	}
	
	

}
