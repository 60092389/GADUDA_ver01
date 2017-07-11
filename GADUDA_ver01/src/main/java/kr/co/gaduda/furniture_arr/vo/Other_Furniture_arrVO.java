package kr.co.gaduda.furniture_arr.vo;

public class Other_Furniture_arrVO {
	
	private int fur_arr_plan_no;
	private String fur_arr_plan_img_loc;
	private String fur_arr_name;
	
	public int getFur_arr_plan_no() {
		return fur_arr_plan_no;
	}
	public void setFur_arr_plan_no(int fur_arr_plan_no) {
		this.fur_arr_plan_no = fur_arr_plan_no;
	}
	public String getFur_arr_plan_img_loc() {
		return fur_arr_plan_img_loc;
	}
	public void setFur_arr_plan_img_loc(String fur_arr_plan_img_loc) {
		this.fur_arr_plan_img_loc = fur_arr_plan_img_loc;
	}
	public String getFur_arr_name() {
		return fur_arr_name;
	}
	public void setFur_arr_name(String fur_arr_name) {
		this.fur_arr_name = fur_arr_name;
	}
	
	@Override
	public String toString() {
		return "Other_Furniture_arrVO [fur_arr_plan_no=" + fur_arr_plan_no + ", fur_arr_plan_img_loc="
				+ fur_arr_plan_img_loc + ", fur_arr_name=" + fur_arr_name + "]";
	}
	

}
