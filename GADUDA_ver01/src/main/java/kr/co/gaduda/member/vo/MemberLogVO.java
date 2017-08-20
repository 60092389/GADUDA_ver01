package kr.co.gaduda.member.vo;

import java.util.Date;

public class MemberLogVO {
	private String _id;
	private String mem_id;
	private String mem_acc_loc;
	private String mem_log_create_date;
	public String get_id() {
		return _id;
	}
	public void set_id(String _id) {
		this._id = _id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_acc_loc() {
		return mem_acc_loc;
	}
	public void setMem_acc_loc(String mem_acc_loc) {
		this.mem_acc_loc = mem_acc_loc;
	}
	
	public String getMem_log_create_date() {
		return mem_log_create_date;
	}
	public void setMem_log_create_date(String mem_log_create_date) {
		this.mem_log_create_date = mem_log_create_date;
	}
	@Override
	public String toString() {
		return "memberLogVO [_id=" + _id + ", mem_id=" + mem_id + ", mem_acc_loc=" + mem_acc_loc
				+ ", mem_log_create_date=" + mem_log_create_date + "]";
	}
	
	
	
}
