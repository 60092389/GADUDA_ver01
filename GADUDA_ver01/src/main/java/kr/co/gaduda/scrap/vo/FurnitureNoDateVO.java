package kr.co.gaduda.scrap.vo;

import java.util.Date;

public class FurnitureNoDateVO {
	
	private int fur_scrap_no;
	private int fur_no;
	private String fur_scrap_date;
	
	

	public int getFur_scrap_no() {
		return fur_scrap_no;
	}
	public void setFur_scrap_no(int fur_scrap_no) {
		this.fur_scrap_no = fur_scrap_no;
	}
	public int getFur_no() {
		return fur_no;
	}
	public String getFur_scrap_date() {
		return fur_scrap_date;
	}
	public void setFur_scrap_date(String fur_scrap_date) {
		this.fur_scrap_date = fur_scrap_date;
	}
	public void setFur_no(int fur_no) {
		this.fur_no = fur_no;
	}
	@Override
	public String toString() {
		return "FurnitureNoDateVO [fur_scrap_no=" + fur_scrap_no + ", fur_no=" + fur_no + ", fur_scrap_date="
				+ fur_scrap_date + "]";
	}


}
