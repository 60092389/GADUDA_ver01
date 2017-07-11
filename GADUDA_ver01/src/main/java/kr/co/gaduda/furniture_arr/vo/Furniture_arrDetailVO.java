package kr.co.gaduda.furniture_arr.vo;

import java.util.List;

public class Furniture_arrDetailVO {
	
	private String fur_arr_plan_img_loc;
	private int fur_arr_plan_no;
	private String fur_arr_name;
	private String mem_id;
	private String mem_nickname;
	private String mem_profile_pic;
	private String fur_arr_contents;
	private String fur_arr_create_date;
	private int fur_arr_plan_good_num;
	private int fur_arr_plan_repl_num;
	private int fur_arr_plan_scrap_num;
	private int total_fur_price;
	private String fur_arr_hashtags;
	private String fur_arr_concepts;
	private String fur_arr_rooms;
	private List<Other_Furniture_arrVO> other_furniture_arrList;
	
	
	
	public String getMem_profile_pic() {
		return mem_profile_pic;
	}
	public void setMem_profile_pic(String mem_profile_pic) {
		this.mem_profile_pic = mem_profile_pic;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public String getFur_arr_plan_img_loc() {
		return fur_arr_plan_img_loc;
	}
	public void setFur_arr_plan_img_loc(String fur_arr_plan_img_loc) {
		this.fur_arr_plan_img_loc = fur_arr_plan_img_loc;
	}
	public int getFur_arr_plan_no() {
		return fur_arr_plan_no;
	}
	public void setFur_arr_plan_no(int fur_arr_plan_no) {
		this.fur_arr_plan_no = fur_arr_plan_no;
	}
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
	public String getFur_arr_contents() {
		return fur_arr_contents;
	}
	public void setFur_arr_contents(String fur_arr_contents) {
		this.fur_arr_contents = fur_arr_contents;
	}
	public String getFur_arr_create_date() {
		return fur_arr_create_date;
	}
	public void setFur_arr_create_date(String fur_arr_create_date) {
		this.fur_arr_create_date = fur_arr_create_date;
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
	public int getFur_arr_plan_scrap_num() {
		return fur_arr_plan_scrap_num;
	}
	public void setFur_arr_plan_scrap_num(int fur_arr_plan_scrap_num) {
		this.fur_arr_plan_scrap_num = fur_arr_plan_scrap_num;
	}
	public int getTotal_fur_price() {
		return total_fur_price;
	}
	public void setTotal_fur_price(int total_fur_price) {
		this.total_fur_price = total_fur_price;
	}
	public String getFur_arr_hashtags() {
		return fur_arr_hashtags;
	}
	public void setFur_arr_hashtags(String fur_arr_hashtags) {
		this.fur_arr_hashtags = fur_arr_hashtags;
	}
	public String getFur_arr_concepts() {
		return fur_arr_concepts;
	}
	public void setFur_arr_concepts(String fur_arr_concepts) {
		this.fur_arr_concepts = fur_arr_concepts;
	}
	public String getFur_arr_rooms() {
		return fur_arr_rooms;
	}
	public void setFur_arr_rooms(String fur_arr_rooms) {
		this.fur_arr_rooms = fur_arr_rooms;
	}
	
	public List<Other_Furniture_arrVO> getOther_furniture_arrList() {
		return other_furniture_arrList;
	}
	public void setOther_furniture_arrList(List<Other_Furniture_arrVO> other_furniture_arrList) {
		this.other_furniture_arrList = other_furniture_arrList;
	}
	@Override
	public String toString() {
		return "Furniture_arrDetailVO [fur_arr_plan_img_loc=" + fur_arr_plan_img_loc + ", fur_arr_plan_no="
				+ fur_arr_plan_no + ", fur_arr_name=" + fur_arr_name + ", mem_id=" + mem_id + ", mem_nickname="
				+ mem_nickname + ", fur_arr_contents=" + fur_arr_contents + ", fur_arr_create_date="
				+ fur_arr_create_date + ", fur_arr_plan_good_num=" + fur_arr_plan_good_num + ", fur_arr_plan_repl_num="
				+ fur_arr_plan_repl_num + ", fur_arr_plan_scrap_num=" + fur_arr_plan_scrap_num + ", total_fur_price="
				+ total_fur_price + ", fur_arr_hashtags=" + fur_arr_hashtags + ", fur_arr_concepts=" + fur_arr_concepts
				+ ", fur_arr_rooms=" + fur_arr_rooms + ", other_furniture_arrList=" + other_furniture_arrList + "]";
	}
	
}
