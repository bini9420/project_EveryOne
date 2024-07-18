package model;

import java.sql.Date;

import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class ProductBBean {
	    private int pnum;
	    private String id;
	    @NotEmpty(message = "상품이름을 입력해주세요.")
	    private String pname;
	    private String pimage;
	    @Min(value = 1, message="가격을 입력해주세요.")
	    private double price;
	    @NotEmpty(message = "상품용량을 입력해주세요.")
	    private String capacity;
	    @NotEmpty(message = "상품설명을 입력해주세요.")
	    private String pcontent;
	    @NotEmpty(message = "유통기한을 입력해주세요.")
	    private String expritydate;
	    @NotEmpty(message = "원산지를 입력해주세요.")
	    private String origin;
	    @Min(value = 1, message = "최소 1개 이상 입력해주세요.")
	    private int stock;
	    @NotEmpty(message = "상품카테고리를 입력해주세요.")
	    private String pcategory;
	    private Date inputdate;
	    private int ordercount;
	    private MultipartFile upload;
		private String upload2;
		private int ad;
		
		public int getAd() {
			return ad;
		}
		public void setAd(int ad) {
			this.ad = ad;
		}
		public MultipartFile getUpload() {
			return upload;
		}
		public void setUpload(MultipartFile upload) {
			System.out.println("setUpload()");
			System.out.println("upload:" + upload);
			
			this.upload = upload;
			if(this.upload != null) {
				System.out.println(upload.getName()); // upload
				System.out.println(upload.getOriginalFilename());
				pimage = upload.getOriginalFilename();
			}
		}
		
		public String getUpload2() {
			return upload2;
		}
		public void setUpload2(String upload2) {
			this.upload2 = upload2;
		}
		public int getPnum() {
			return pnum;
		}
		public void setPnum(int pnum) {
			this.pnum = pnum;
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
		public String getPimage() {
			return pimage;
		}
		public void setPimage(String pimage) {
			this.pimage = pimage;
		}
		public double getPrice() {
			return price;
		}
		public void setPrice(double price) {
			this.price = price;
		}
		public String getCapacity() {
			return capacity;
		}
		public void setCapacity(String capacity) {
			this.capacity = capacity;
		}
		public String getPcontent() {
			return pcontent;
		}
		public void setPcontent(String pcontent) {
			this.pcontent = pcontent;
		}
		public String getExpritydate() {
			return expritydate;
		}
		public void setExpritydate(String expritydate) {
			this.expritydate = expritydate;
		}
		public String getOrigin() {
			return origin;
		}
		public void setOrigin(String origin) {
			this.origin = origin;
		}
		public int getStock() {
			return stock;
		}
		public void setStock(int stock) {
			this.stock = stock;
		}
		public String getPcategory() {
			return pcategory;
		}
		public void setPcategory(String pcategory) {
			this.pcategory = pcategory;
		}
		public Date getInputdate() {
			return inputdate;
		}
		public void setInputdate(Date inputdate) {
			this.inputdate = inputdate;
		}
		public int getOrdercount() {
			return ordercount;
		}
		public void setOrdercount(int ordercount) {
			this.ordercount = ordercount;
		}

}
