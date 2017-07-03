package kr.co.gaduda.scrap.vo;

public class FurArrNoDateVO {
	private int fur_arr_plan_scrap_no;
	private int fur_arr_plan_no;
	private String fur_arr_plan_scrap_date;
	public int getFur_arr_plan_scrap_no() {
		return fur_arr_plan_scrap_no;
	}
	public void setFur_arr_plan_scrap_no(int fur_arr_plan_scrap_no) {
		this.fur_arr_plan_scrap_no = fur_arr_plan_scrap_no;
	}
	public int getFur_arr_plan_no() {
		return fur_arr_plan_no;
	}
	public void setFur_arr_plan_no(int fur_arr_plan_no) {
		this.fur_arr_plan_no = fur_arr_plan_no;
	}
	public String getFur_arr_plan_scrap_date() {
		return fur_arr_plan_scrap_date;
	}
	public void setFur_arr_plan_scrap_date(String fur_arr_plan_scrap_date) {
		this.fur_arr_plan_scrap_date = fur_arr_plan_scrap_date;
	}
	@Override
	public String toString() {
		return "FurArrNoDateVO [fur_arr_plan_scrap_no=" + fur_arr_plan_scrap_no + ", fur_arr_plan_no=" + fur_arr_plan_no
				+ ", fur_arr_plan_scrap_date=" + fur_arr_plan_scrap_date + "]";
	}
	
	
	

}
