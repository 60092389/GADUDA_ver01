package kr.co.gaduda.furniture.dto;

public class FurnitureDTO {
	private int max_fur_width;
	private int max_fur_height;
	private int max_fur_depth;
	private int min_fur_width;
	private int min_fur_height;
	private int min_fur_depth;
	private String fur_concept;
	private String fur_kind;

	public String getFur_kind() {
		return fur_kind;
	}

	public void setFur_kind(String fur_kind) {
		this.fur_kind = fur_kind;
	}

	public int getMax_fur_width() {
		return max_fur_width;
	}

	public void setMax_fur_width(int max_fur_width) {
		this.max_fur_width = max_fur_width;
	}

	public int getMax_fur_height() {
		return max_fur_height;
	}

	public void setMax_fur_height(int max_fur_height) {
		this.max_fur_height = max_fur_height;
	}

	public int getMax_fur_depth() {
		return max_fur_depth;
	}

	public void setMax_fur_depth(int max_fur_depth) {
		this.max_fur_depth = max_fur_depth;
	}

	public int getMin_fur_width() {
		return min_fur_width;
	}

	public void setMin_fur_width(int min_fur_width) {
		this.min_fur_width = min_fur_width;
	}

	public int getMin_fur_height() {
		return min_fur_height;
	}

	public void setMin_fur_height(int min_fur_height) {
		this.min_fur_height = min_fur_height;
	}

	public int getMin_fur_depth() {
		return min_fur_depth;
	}

	public void setMin_fur_depth(int min_fur_depth) {
		this.min_fur_depth = min_fur_depth;
	}

	public String getFur_concept() {
		return fur_concept;
	}

	public void setFur_concept(String fur_concept) {
		this.fur_concept = fur_concept;
	}
}