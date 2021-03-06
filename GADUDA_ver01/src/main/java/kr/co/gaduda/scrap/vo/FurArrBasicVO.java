package kr.co.gaduda.scrap.vo;

public class FurArrBasicVO {
	
	private String fur_arr_name;
	private String mem_id;
	private String mem_nickname;
	private String fur_arr_plan_img_loc;
	private int fur_arr_plan_good_num;
	private int fur_arr_plan_repl_num;
	
	public String getFur_arr_name() {
		return fur_arr_name;
	}
	public void setFur_arr_name(String fur_arr_name) {
		this.fur_arr_name = fur_arr_name;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getFur_arr_plan_img_loc() {
		return fur_arr_plan_img_loc;
	}
	public void setFur_arr_plan_img_loc(String fur_arr_plan_img_loc) {
		this.fur_arr_plan_img_loc = fur_arr_plan_img_loc;
	}
	
	
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public int getFur_arr_plan_good_num() {
		return fur_arr_plan_good_num;
	}
	public void setFur_arr_plan_good_num(int fur_arr_plan_good_num) {
		this.fur_arr_plan_good_num = fur_arr_plan_good_num;
	}
	public int getFur_arr_plan_repl_num() {
		return fur_arr_plan_repl_num;
	}
	public void setFur_arr_plan_repl_num(int fur_arr_plan_repl_num) {
		this.fur_arr_plan_repl_num = fur_arr_plan_repl_num;
	}
	@Override
	public String toString() {
		return "FurArrBasicVO [fur_arr_name=" + fur_arr_name + ", mem_id=" + mem_id + ", mem_nickname=" + mem_nickname
				+ ", fur_arr_plan_img_loc=" + fur_arr_plan_img_loc + ", fur_arr_plan_good_num=" + fur_arr_plan_good_num
				+ ", fur_arr_plan_repl_num=" + fur_arr_plan_repl_num + "]";
	}
	
	

	
	
	

}
