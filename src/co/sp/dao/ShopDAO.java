package co.sp.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.sp.beans.ShopVO;
import co.sp.mapper.ShopMapper;

@Repository
public class ShopDAO {
  
  @Autowired
  private ShopMapper shopMapper;
  
  /**
   * 가게 등록
   * @param RegShopBean
   */
  public void shop_create(ShopVO RegShopBean) {
    shopMapper.shop_create(RegShopBean);
  }
  
  
  /**
   * 가게 목록(검색 + 페이징은 구현되지 않았음)
   * @return
   */
  public List<ShopVO> shop_list_search_paging(int category_no) {
    return shopMapper.shop_list_search_paging(category_no);
  }
  
  
  
  
  

}
