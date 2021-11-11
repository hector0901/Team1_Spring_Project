package co.sp.mapper;

import org.apache.ibatis.annotations.Insert;

import co.sp.beans.Admin_Category_ShopVO;
import co.sp.beans.ShopVO;

public interface ShopMapper {
  
  /**
   * 가게 등록
   * @param RegShopBean
   */
  @Insert("INSERT INTO shop(shop_no, category_no, admin_no, shop_name, shop_content, shop_zipcode, shop_address1, shop_address2, map, shop_main, " + 
          "shop_menu_img, shop_inside_img, shop_total_seat, shop_remain_seat, shop_rdate) " +
          "VALUES (shop_no_seq.nextval, #{category_no}, #{admin_no}, #{shop_name}, #{shop_content}, #{shop_zipcode}, #{shop_address1}, #{shop_address2}, " +
          "#{map}, #{shop_main}, #{shop_menu_img}, #{shop_inside_img}, #{shop_total_seat}, #{shop_remain_seat}, sysdate)")
  void shop_create(ShopVO RegShopBean);
  
  
  
}
