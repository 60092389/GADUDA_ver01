package kr.co.gaduda.scrap.vo;

import java.util.Date;

public class FurnitureScrapVO {
	
	private int fur_scrap_no;
	private int fur_no;
	private String fur_pic_loc;
	private String fur_name;
	private int fur_price;
	private String fur_brand_name;
	private String fur_scrap_date;
	private int fur_good_count;
	private int fur_scrap_count;
	private int fur_reply_count;
	
	
	
	
	public int getFur_no() {
		return fur_no;
	}
	public void setFur_no(int fur_no) {
		this.fur_no = fur_no;
	}
	public int getFur_scrap_no() {
		return fur_scrap_no;
	}
	public void setFur_scrap_no(int fur_scrap_no) {
		this.fur_scrap_no = fur_scrap_no;
	}
	
	public String getFur_pic_loc() {
		return fur_pic_loc;
	}
	public void setFur_pic_loc(String fur_pic_loc) {
		this.fur_pic_loc = fur_pic_loc;
	}
	public String getFur_name() {
		return fur_name;
	}
	public void setFur_name(String fur_name) {
		this.fur_name = fur_name;
	}
	public int getFur_price() {
		return fur_price;
	}
	public void setFur_price(int fur_price) {
		this.fur_price = fur_price;
	}
	public String getFur_brand_name() {
		return fur_brand_name;
	}
	public void setFur_brand_name(String fur_brand_name) {
		this.fur_brand_name = fur_brand_name;
	}
	public int getFur_good_count() {
		return fur_good_count;
	}
	public void setFur_good_count(int fur_good_count) {
		this.fur_good_count = fur_good_count;
	}
	public int getFur_scrap_count() {
		return fur_scrap_count;
	}
	public void setFur_scrap_count(int fur_scrap_count) {
		this.fur_scrap_count = fur_scrap_count;
	}
	public int getFur_reply_count() {
		return fur_reply_count;
	}
	public void setFur_reply_count(int fur_reply_count) {
		this.fur_reply_count = fur_reply_count;
	}

	public String getFur_scrap_date() {
		return fur_scrap_date;
	}
	public void setFur_scrap_date(String fur_scrap_date) {
		this.fur_scrap_date = fur_scrap_date;
	}
	
	@Override
	public String toString() {
		return "FurnitureScrapVO [fur_scrap_no=" + fur_scrap_no + ", fur_pic_loc=" + fur_pic_loc + ", fur_name="
				+ fur_name + ", fur_price=" + fur_price + ", fur_brand_name=" + fur_brand_name + ", fur_scrap_date="
				+ fur_scrap_date + ", fur_good_count=" + fur_good_count + ", fur_scrap_count=" + fur_scrap_count
				+ ", fur_reply_count=" + fur_reply_count + "]";
	}
	

	
	
	

}
