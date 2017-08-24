package kr.co.gaduda.member.dto;


public class MemberAccHistoryDTO {
	
	private String mem_id;
	private String mem_acc_kind;

	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_acc_kind() {
		return mem_acc_kind;
	}
	public void setMem_acc_kind(String mem_acc_kind) {
		this.mem_acc_kind = mem_acc_kind;
	}
	
	@Override
	public String toString() {
		return "MemberAccHistoryDTO [mem_id=" + mem_id + ", mem_acc_kind=" + mem_acc_kind + "]";
	}

	
	

}
