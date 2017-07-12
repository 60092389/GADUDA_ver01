package kr.co.gaduda.member.vo;

public class Following_VO {


   private String mem_id;
   private String fol_mem_id;
   public String getFol_mem_id() {
      return fol_mem_id;
   }

   public void setFol_mem_id(String fol_mem_id) {
      this.fol_mem_id = fol_mem_id;
   }
   private String fol_kind;

   public String getFol_kind() {
      return fol_kind;
   }

   public void setFol_kind(String fol_kind) {
      this.fol_kind = fol_kind;
   }

   public String getMem_id() {
      return mem_id;
   }

   public void setMem_id(String mem_id) {
      this.mem_id = mem_id;
   }
   @Override
   public String toString() {
      return "Following_VO [mem_id=" + mem_id + ", fol_kind=" + fol_kind + "]";
   }
}