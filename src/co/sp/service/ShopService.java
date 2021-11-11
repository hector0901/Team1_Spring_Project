package co.sp.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.sp.beans.AdminVO;
import co.sp.beans.Admin_Category_ShopVO;
import co.sp.beans.ShopVO;
import co.sp.dao.ShopDAO;

@Service
public class ShopService {
  
  @Autowired
  private ShopDAO shopDAO;

  @Resource(name = "loginBean2")
  private AdminVO loginBean2;
  
  /**
   * 가게 등록
   * @param RegShopBean
   */
  public void shop_create(ShopVO RegShopBean) {
    shopDAO.shop_create(RegShopBean);
  }
  

}
