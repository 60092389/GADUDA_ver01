package kr.co.gaduda.furniture_arr.vo;

import org.springframework.data.annotation.Id;

public class crawling_furnitureVO {
 
   @Id
   private String _id;
   private String craw_fur_name;
   private String craw_fur_item_no;
   private String craw_fur_brand;
   private String craw_fur_price;
   private String craw_fur_room_kind_name;
   private String craw_fur_kind_name;
   private String craw_fur_brand_site;
   private String craw_fur_img;
   private String craw_fur_size;
   private String craw_fur_concept_name;
   private String arr_fur_name;
   

   public String getArr_fur_name() {
      return arr_fur_name;
   }
   public void setArr_fur_name(String arr_fur_name) {
      this.arr_fur_name = arr_fur_name;
   }
   @Override
   public String toString() {
      return "crawling_furnitureVO [_id=" + _id + ", craw_fur_name=" + craw_fur_name + ", craw_fur_item_no="
            + craw_fur_item_no + ", craw_fur_brand=" + craw_fur_brand + ", craw_fur_price=" + craw_fur_price
            + ", craw_fur_room_kind_name=" + craw_fur_room_kind_name + ", craw_fur_kind_name=" + craw_fur_kind_name
            + ", craw_fur_brand_site=" + craw_fur_brand_site + ", craw_fur_img=" + craw_fur_img + ", craw_fur_size="
            + craw_fur_size + ", craw_fur_concept_name=" + craw_fur_concept_name + "]";
   }
   public String get_id() {
      return _id;
   }
   public void set_id(String _id) {
      this._id = _id;
   }
   public String getCraw_fur_name() {
      return craw_fur_name;
   }
   public void setCraw_fur_name(String craw_fur_name) {
      this.craw_fur_name = craw_fur_name;
   }
   public String getCraw_fur_item_no() {
      return craw_fur_item_no;
   }
   public void setCraw_fur_item_no(String craw_fur_item_no) {
      this.craw_fur_item_no = craw_fur_item_no;
   }
   public String getCraw_fur_brand() {
      return craw_fur_brand;
   }
   public void setCraw_fur_brand(String craw_fur_brand) {
      this.craw_fur_brand = craw_fur_brand;
   }
   public String getCraw_fur_price() {
      return craw_fur_price;
   }
   public void setCraw_fur_price(String craw_fur_price) {
      this.craw_fur_price = craw_fur_price;
   }
   public String getCraw_fur_room_kind_name() {
      return craw_fur_room_kind_name;
   }
   public void setCraw_fur_room_kind_name(String craw_fur_room_kind_name) {
      this.craw_fur_room_kind_name = craw_fur_room_kind_name;
   }
   public String getCraw_fur_kind_name() {
      return craw_fur_kind_name;
   }
   public void setCraw_fur_kind_name(String craw_fur_kind_name) {
      this.craw_fur_kind_name = craw_fur_kind_name;
   }
   public String getCraw_fur_brand_site() {
      return craw_fur_brand_site;
   }
   public void setCraw_fur_brand_site(String craw_fur_brand_site) {
      this.craw_fur_brand_site = craw_fur_brand_site;
   }
   public String getCraw_fur_img() {
      return craw_fur_img;
   }
   public void setCraw_fur_img(String craw_fur_img) {
      this.craw_fur_img = craw_fur_img;
   }
   public String getCraw_fur_size() {
      return craw_fur_size;
   }
   public void setCraw_fur_size(String craw_fur_size) {
      this.craw_fur_size = craw_fur_size;
   }
   public String getCraw_fur_concept_name() {
      return craw_fur_concept_name;
   }
   public void setCraw_fur_concept_name(String craw_fur_concept_name) {
      this.craw_fur_concept_name = craw_fur_concept_name;
   }
}
