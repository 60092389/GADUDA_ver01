package kr.co.gaduda.furniture.vo;

public class FurnitureScrapListVO {
   private String mem_id;
   private String mem_nickname;
   private String fur_scrap_date;
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
   public String getFur_scrap_date() {
      return fur_scrap_date;
   }
   public void setFur_scrap_date(String fur_scrap_date) {
      this.fur_scrap_date = fur_scrap_date;
   }
   
   @Override
   public String toString(){
      return mem_id + "," + mem_nickname + "," + fur_scrap_date;
   }
   
   
}
