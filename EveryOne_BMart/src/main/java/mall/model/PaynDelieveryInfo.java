package mall.model;

import org.hibernate.validator.constraints.NotBlank;

public class PaynDelieveryInfo {
	
	@NotBlank(message = "��۹���� �������ּ���.")
	private String way;
	@NotBlank(message = "���������� �������ּ���.")
	private String payment;
	@NotBlank(message = "������� �������ּ���.")
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
