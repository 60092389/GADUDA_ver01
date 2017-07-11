package kr.co.gaduda.furniture_arr.vo;

public class Furniture_arrVO {

	private int fur_arr_plan_no;
	private String mem_id;
	private String fur_arr_name;
	private String fur_arr_plan_img_loc;
	private String fur_arr_con;
	private String fur_arr_room_kind;
	private String room_name;

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
