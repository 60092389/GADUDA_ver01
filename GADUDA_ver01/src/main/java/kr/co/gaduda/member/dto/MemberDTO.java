package kr.co.gaduda.member.dto;

import org.springframework.web.multipart.MultipartFile;

public class MemberDTO {
	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_nickname;
	private String mem_sex;
	private String mem_birth;
	private String mem_intro;
	private String mem_profile_pic;
	private String mem_orgname;
	private String mem_newname;
	private String mem_pw_chk;
	private MultipartFile file;
	public String getMem_pw_chk() {
		return mem_pw_chk;
	}
	public void setMem_pw_chk(String mem_pw_chk) {
		this.mem_pw_chk = mem_pw_chk;
	}
	
	public String getMem_orgname() {
		return mem_orgname;
	}
	public void setMem_orgname(String mem_orgname) {
		this.mem_orgname = mem_orgname;
	}
	public String getMem_newname() {
		return mem_newname;
	}
	public void setMem_newname(String mem_newname) {
		this.mem_newname = mem_newname;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public String getMem_sex() {
		return mem_sex;
	}
	public void setMem_sex(String mem_sex) {
		this.mem_sex = mem_sex;
	}
	public String getMem_birth() {
		return mem_birth;
	}
	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}
	public String getMem_intro() {
		return mem_intro;
	}
	public void setMem_intro(String mem_intro) {
		this.mem_intro = mem_intro;
	}
	public String getMem_profile_pic() {
		return mem_profile_pic;
	}
	public void setMem_profile_pic(String mem_profile_pic) {
		this.mem_profile_pic = mem_profile_pic;
	}
	@Override
	public String toString() {
		return "MemberDTO [mem_id=" + mem_id + ", mem_pw=" + mem_pw + ", mem_name=" + mem_name + ", mem_nickname="
				+ mem_nickname + ", mem_sex=" + mem_sex + ", mem_birth=" + mem_birth + ", mem_intro=" + mem_intro
				+ ", mem_profile_pic=" + mem_profile_pic + ", mem_orgname=" + mem_orgname + ", mem_newname="
				+ mem_newname + ", mem_pw_chk=" + mem_pw_chk + ", file=" + file + "]";
	}
	
	
}
