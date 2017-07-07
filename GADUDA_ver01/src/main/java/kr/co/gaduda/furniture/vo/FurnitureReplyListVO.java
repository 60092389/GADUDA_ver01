package kr.co.gaduda.furniture.vo;

public class FurnitureReplyListVO {
	
	private String _id;
	private String mem_id;
	private String mem_nickname;
	private String fur_rep_contents;
	private String fur_rep_write_date;
	
	
	
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
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public String getFur_rep_contents() {
		return fur_rep_contents;
	}
	public void setFur_rep_contents(String fur_rep_contents) {
		this.fur_rep_contents = fur_rep_contents;
	}
	public String getFur_rep_write_date() {
		return fur_rep_write_date;
	}
	public void setFur_rep_write_date(String fur_rep_write_date) {
		this.fur_rep_write_date = fur_rep_write_date;
	}
	@Override
	public String toString() {
		return "FurnitureReplyListVO [_id=" + _id + ", mem_id=" + mem_id + ", mem_nickname=" + mem_nickname
				+ ", fur_rep_contents=" + fur_rep_contents + ", fur_rep_write_date=" + fur_rep_write_date + "]";
	}
	
	

	
	

}
