package kr.co.gaduda.furniture_arr.vo;

public class Furniture_arrVO {

	private int fur_arr_plan_no;
	private String mem_id;
	private String fur_arr_name;
	private String fur_arr_plan_img_loc;
	private String fur_arr_con;
	private String fur_arr_room_kind;
	private String room_name;
	
	//2017-08-07 추가
	private String fur_arr_create_date;
	private String mem_nickname;
	private String mem_profile_pic;

	public String getFur_arr_create_date() {
		return fur_arr_create_date;
	}

	public void setFur_arr_create_date(String fur_arr_create_date) {
		this.fur_arr_create_date = fur_arr_create_date;
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

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	private int fur_arr_plan_scrap_num;
	private int fur_arr_plan_good_num;
	private int fur_arr_plan_repl_num;

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

	public String getFur_arr_name() {
		return fur_arr_name;
	}

	public void setFur_arr_name(String fur_arr_name) {
		this.fur_arr_name = fur_arr_name;
	}

	public String getFur_arr_plan_img_loc() {
		return fur_arr_plan_img_loc;
	}

	public void setFur_arr_plan_img_loc(String fur_arr_plan_img_loc) {
		this.fur_arr_plan_img_loc = fur_arr_plan_img_loc;
	}

	public String getFur_arr_con() {
		return fur_arr_con;
	}

	public void setFur_arr_con(String fur_arr_con) {
		this.fur_arr_con = fur_arr_con;
	}

	public String getFur_arr_room_kind() {
		return fur_arr_room_kind;
	}

	public void setFur_arr_room_kind(String fur_arr_room_kind) {
		this.fur_arr_room_kind = fur_arr_room_kind;
	}

	public int getFur_arr_plan_scrap_num() {
		return fur_arr_plan_scrap_num;
	}

	public void setFur_arr_plan_scrap_num(int fur_arr_plan_scrap_num) {
		this.fur_arr_plan_scrap_num = fur_arr_plan_scrap_num;
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
		return "Furniture_arrVO [fur_arr_plan_no=" + fur_arr_plan_no + ", mem_id=" + mem_id + ", fur_arr_name="
				+ fur_arr_name + ", fur_arr_plan_img_loc=" + fur_arr_plan_img_loc + ", fur_arr_con=" + fur_arr_con
				+ ", fur_arr_room_kind=" + fur_arr_room_kind + ", fur_arr_plan_scrap_num=" + fur_arr_plan_scrap_num
				+ ", fur_arr_plan_good_num=" + fur_arr_plan_good_num + ", fur_arr_plan_repl_num="
				+ fur_arr_plan_repl_num + "]";
	}

}
