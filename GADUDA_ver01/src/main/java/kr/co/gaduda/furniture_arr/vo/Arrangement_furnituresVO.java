package kr.co.gaduda.furniture_arr.vo;

public class Arrangement_furnituresVO {
		
	private int fur_no;
	private String fur_pic_loc;
	private String fur_name;
	private int fur_price;
	
	public int getFur_no() {
		return fur_no;
	}
	public void setFur_no(int fur_no) {
		this.fur_no = fur_no;
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
	
	@Override
	public String toString() {
		return "Arrangement_furnituresVO [fur_no=" + fur_no + ", fur_pic_loc=" + fur_pic_loc + ", fur_name=" + fur_name
				+ ", fur_price=" + fur_price + "]";
	}	

}
