package kr.co.gaduda.furniture_arr.vo;

public class FurnitureArrGoodListVO {
	
	private String _id;
	private int fur_arr_plan_no;
	private String mem_id;
	private String mem_nickname;
	private String mem_profile_pic;
	private String fur_arr_plan_good_date;
	public String get_id() {
		return _id;
	}
	public void set_id(String _id) {
		this._id = _id;
	}
	public int getFur_arr_plan_no() {
		return fur_arr_plan_no;
	}
	public void setFur_Arr_plan_no(int fur_Arr_plan_no) {
		this.fur_arr_plan_no = fur_Arr_plan_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public String getMem_profile_pic() {
		return mem_profile_pic;
	}
	public void setMem_profile_pic(String mem_profile_pic) {
		this.mem_profile_pic = mem_profile_pic;
	}
	public String getFur_arr_plan_good_date() {
		return fur_arr_plan_good_date;
	}
	public void setFur_arr_plan_good_date(String fur_arr_plan_good_date) {
		this.fur_arr_plan_good_date = fur_arr_plan_good_date;
	}
	@Override
	public String toString() {
		return "FurnitureArrGoodListVO [_id=" + _id + ", fur_Arr_plan_no=" + fur_arr_plan_no + ", mem_id=" + mem_id
				+ ", mem_nickname=" + mem_nickname + ", mem_profile_pic=" + mem_profile_pic
				+ ", fur_arr_plan_good_date=" + fur_arr_plan_good_date + "]";
	}
	
	

}
