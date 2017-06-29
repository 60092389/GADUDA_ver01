package kr.co.gaduda.follow.dto;

public class FollowDTO {
	
	private String mem_id;
	private String fol_mem_id;
	private int fol_kind;
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
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
	
	

}
