package kr.co.gaduda.scrap.vo;

public class FurnitureBasicVO {
	private String fur_name;
	private int fur_price;
	private String fur_brand_name;
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
	
	@Override
	public String toString() {
		return "FurnitureBasicVO [fur_name=" + fur_name + ", fur_price=" + fur_price + ", fur_brand_name="
				+ fur_brand_name + "]";
	}
	

}
