package co.sp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import co.sp.beans.Admin_Category_ShopVO;
import co.sp.beans.ShopVO;

public interface ShopMapper {
  
  /**
   * ���� ���
   * @param RegShopBean
   */
  @Insert("INSERT INTO shop(shop_no, category_no, admin_no, shop_name, shop_simple, shop_content, shop_zipcode, shop_address1, shop_address2, map, shop_main, " + 
          "shop_menu_img, shop_inside_img, shop_total_seat, shop_remain_seat, shop_rdate, shop_time) " +
          "VALUES (shop_no_seq.nextval, #{category_no}, #{admin_no}, #{shop_name}, #{shop_simple}, #{shop_content}, #{shop_zipcode}, #{shop_address1}, #{shop_address2}, " +
          "#{map}, #{shop_main,jdbcType=VARCHAR}, #{shop_menu_img,jdbcType=VARCHAR}, #{shop_inside_img,jdbcType=VARCHAR}, #{shop_total_seat}, #{shop_remain_seat}, sysdate, #{shop_time} )")
  void shop_create(ShopVO RegShopBean);
  
  /**
   * ī�װ��� ���
   * @return
   */
  @Select("SELECT shop_no, shop_name, shop_address1, shop_main, shop_menu_img, shop_inside_img, shop_total_seat, shop_remain_seat, shop_time " + 
          "FROM shop " + 
          "WHERE category_no = #{category_no} " + 
          "ORDER BY shop_no DESC")
  List<ShopVO> shop_list_search_paging(int category_no);
  
  //���� ��������
  @Select("select shop_name, shop_address1, shop_address2, shop_simple, shop_content, map, shop_main, shop_menu_img, shop_inside_img, shop_total_seat, shop_remain_seat, shop_time " +
          "from shop " +
		  "WHERE shop_no = #{shop_no} " +
          "order by shop_no desc")
  ShopVO getShopInfo(int shop_no);
  
  
  //���� ����
  @Update("update shop " +
          "set shop_simple=#{shop_simple}, shop_content=#{shop_content}, shop_total_seat=#{shop_total_seat}, shop_remain_seat=#{shop_remain_seat}, shop_time=#{shop_time} " +
		  "where shop_no=#{shop_no}")
  void updateShopInfo(ShopVO updateShopBean);
  
  //���� ����
  @Delete("delete from shop where shop_no = #{shop_no} ")
  void deleteShopInfo(int shop_no);
  
  
  
  
  
  
}
