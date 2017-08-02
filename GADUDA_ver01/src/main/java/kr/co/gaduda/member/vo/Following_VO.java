package kr.co.gaduda.member.vo;

public class Following_VO {


	private String mem_id;
	private String fol_mem_id;
	private String status_fol_kind;
	private int fol_kind;
	private String mem_profile_pic;
	
	public String getStatus_fol_kind() {
		return status_fol_kind;
	}

	public void setStatus_fol_kind(String status_fol_kind) {
		this.status_fol_kind = status_fol_kind;
	}

	public String getFol_mem_id() {
		return fol_mem_id;
	}

	public void setFol_mem_id(String fol_mem_id) {
		this.fol_mem_id = fol_mem_id;
	}

	public int getFol_kind() {
		return fol_kind;
	}

	public void setFol_kind(int fol_kind) {
		this.fol_kind = fol_kind;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_profile_pic() {
		return mem_profile_pic;
	}

	public void setMem_profile_pic(String mem_profile_pic) {
		this.mem_profile_pic = mem_profile_pic;
	}

	@Override
	public String toString() {
		return "Following_VO [mem_id=" + mem_id + ", fol_kind=" + fol_kind + "]";
	}
}
