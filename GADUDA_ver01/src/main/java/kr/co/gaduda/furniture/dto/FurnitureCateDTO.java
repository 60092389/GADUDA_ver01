package kr.co.gaduda.furniture.dto;

public class FurnitureCateDTO {

	private String room_kind_def_name;
	private String fur_kind_def_name;
	private String concept_name;
	private String array_option;
	public String getRoom_kind_def_name() {
		return room_kind_def_name;
	}
	public void setRoom_kind_def_name(String room_kind_def_name) {
		this.room_kind_def_name = room_kind_def_name;
	}
	
	public String getFur_kind_def_name() {
		return fur_kind_def_name;
	}
	public void setFur_kind_def_name(String fur_kind_def_name) {
		this.fur_kind_def_name = fur_kind_def_name;
	}
	public String getConcept_name() {
		return concept_name;
	}
	public void setConcept_name(String concept_name) {
		this.concept_name = concept_name;
	}
	public String getArray_option() {
		return array_option;
	}
	public void setArray_option(String array_option) {
		this.array_option = array_option;
	}
	@Override
	public String toString() {
		return "FurnitureCateDTO [room_kind_def_name=" + room_kind_def_name + ", fur_kind_def_name=" + fur_kind_def_name
				+ ", concept_name=" + concept_name + ", array_option=" + array_option + "]";
	}
	 

	
	
}
