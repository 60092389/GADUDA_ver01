package kr.co.gaduda.room.vo;

public class RoomVO {
	
	private int room_no;
	private String room_name;
	private String mem_id;
	private String room_create_date;
	private int room_img_loc;
	private String room_img_src;
	
	public String getRoom_img_src() {
		return room_img_src;
	}
	public void setRoom_img_src(String room_img_src) {
		this.room_img_src = room_img_src;
	}
	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getRoom_create_date() {
		return room_create_date;
	}
	public void setRoom_create_date(String room_create_date) {
		this.room_create_date = room_create_date;
	}
	public int getRoom_img_loc() {
		return room_img_loc;
	}
	public void setRoom_img_loc(int room_img_loc) {
		this.room_img_loc = room_img_loc;
	}
	
}
