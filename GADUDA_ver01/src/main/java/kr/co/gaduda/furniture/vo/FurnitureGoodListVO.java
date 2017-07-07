package kr.co.gaduda.furniture.vo;


public class FurnitureGoodListVO {
   private int fur_no;
   private String mem_id;
   private String mem_nickname;
   private String fur_good_date;
   public int getFur_no() {
      return fur_no;
   }
   public void setFur_no(int fur_no) {
      this.fur_no = fur_no;
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
   public String getFur_good_date() {
      return fur_good_date;
   }
   public void setFur_good_date(String fur_good_date) {
      this.fur_good_date = fur_good_date;
   }
   @Override
   public String toString() {
      return "MongoFurGoodVO [fur_no=" + fur_no + ", mem_id=" + mem_id + ",mem_nickname=" + mem_nickname + ",fur_good_date=" + fur_good_date +"]";
   }
   
   
}
