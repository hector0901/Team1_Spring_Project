package co.sp.dao;

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
  
  
  
  

}
