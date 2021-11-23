package co.sp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import co.sp.beans.Admin_Category_ShopVO;
import co.sp.beans.ShopVO;
import co.sp.beans.Shop_ReplyVO;

public interface ShopMapper {
  
  /**
   * 가게 등록
   * @param RegShopBean
   */
  @Insert("INSERT INTO shop(shop_no, category_no, admin_no, shop_name, shop_simple, shop_content, shop_zipcode, shop_address1, shop_address2, map, shop_main, " + 
          "shop_menu_img, shop_inside_img, shop_total_seat, shop_remain_seat, shop_rdate, shop_time) " +
          "VALUES (shop_no_seq.nextval, #{category_no}, #{admin_no}, #{shop_name}, #{shop_simple}, #{shop_content}, #{shop_zipcode}, #{shop_address1}, #{shop_address2}, " +
          "#{map}, #{shop_main,jdbcType=VARCHAR}, #{shop_menu_img,jdbcType=VARCHAR}, #{shop_inside_img,jdbcType=VARCHAR}, #{shop_total_seat}, #{shop_remain_seat}, sysdate, #{shop_time} )")
  void shop_create(ShopVO RegShopBean);
  
  /**
   * 카테고리별 목록
   * @return
   */
  @Select("SELECT shop_no, shop_name, shop_address1, shop_main, shop_menu_img, shop_inside_img, shop_total_seat, shop_remain_seat, shop_time " + 
          "FROM shop " + 
          "WHERE category_no = #{category_no} " + 
          "ORDER BY shop_no DESC")
  List<ShopVO> shop_list_search_paging(int category_no, RowBounds rowBounds);
  
  //가게 상세페이지
  @Select("select shop_name, shop_address1, shop_address2, shop_simple, shop_content, map, shop_main, shop_menu_img, shop_inside_img, shop_total_seat, shop_remain_seat, shop_time " +
          "from shop " +
		  "WHERE shop_no = #{shop_no} " +
          "order by shop_no desc")
  ShopVO getShopInfo(int shop_no);
  
  //가게 목록 페이징
  @Select("select count(*) from shop")
  int getShopCnt();
  
  
  //가게 수정
  @Update("update shop " +
          "set shop_simple=#{shop_simple}, shop_content=#{shop_content}, shop_total_seat=#{shop_total_seat}, shop_remain_seat=#{shop_remain_seat}, shop_time=#{shop_time} " +
		  "where shop_no=#{shop_no}")
  void updateShopInfo(ShopVO updateShopBean);
  
  //가게 삭제
  @Delete("delete from shop where shop_no = #{shop_no} ")
  void deleteShopInfo(int shop_no);
  
  /**
   * 카테고리별 댓글순 추천(정렬)
   * @return
   */
  @Select("SELECT s.shop_no, s.shop_name, s.shop_address1, s.shop_main, s.shop_menu_img, s.shop_inside_img, s.shop_total_seat, s.shop_remain_seat, s.shop_time, COUNT(r.shop_reply_no) AS cnt  " + 
          "FROM shop s, shop_reply r " + 
          "WHERE s.shop_no = r.shop_no AND s.category_no = #{category_no} " + 
          "GROUP BY s.shop_no, s.shop_name, s.shop_address1, s.shop_main, s.shop_menu_img, s.shop_inside_img, s.shop_total_seat, s.shop_remain_seat, s.shop_time " + 
          "ORDER BY cnt DESC"
          )
 List<ShopVO> recommend_list(int category_no, RowBounds rowBounds);
  
  @Select("select count(*) from shop")
  int getRecommendCnt();
  
  
  
  
}
