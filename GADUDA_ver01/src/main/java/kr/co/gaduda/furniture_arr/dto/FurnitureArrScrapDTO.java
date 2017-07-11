package kr.co.gaduda.furniture_arr.dto;

public class FurnitureArrScrapDTO {
	
	private int fur_arr_plan_no;
	private String mem_id;
	public int getFur_arr_plan_no() {
		return fur_arr_plan_no;
	}
	public void setFur_arr_plan_no(int fur_arr_plan_no) {
		this.fur_arr_plan_no = fur_arr_plan_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	@Override
	public String toString() {
		return "FurnitureArrScrapDTO [fur_arr_plan_no=" + fur_arr_plan_no + ", mem_id=" + mem_id + "]";
	}

	
}
