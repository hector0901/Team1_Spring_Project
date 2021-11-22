package co.sp.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.sp.beans.ShopVO;
import co.sp.beans.Shop_ReplyVO;
import co.sp.mapper.ShopMapper;
import co.sp.service.ShopService;

@Repository
public class ShopDAO {
  
  @Autowired
  private ShopMapper shopMapper;
  
  /**
   * ���� ���
   * @param RegShopBean
   */
  public void shop_create(ShopVO RegShopBean) {
    shopMapper.shop_create(RegShopBean);
  }
  
  
  /**
   * ���� ���(�˻� + ����¡�� �������� �ʾ���)
   * @return
   */
  public List<ShopVO> shop_list_search_paging(int category_no, RowBounds rowBounds) {
    return shopMapper.shop_list_search_paging(category_no, rowBounds);
  }
  
  //���� ��������
  public ShopVO getShopInfo(int shop_no) {
	  return shopMapper.getShopInfo(shop_no);
  }
  
  //���� ��� ����¡
  public int getShopCnt() {
	  return shopMapper.getShopCnt();
  }
  
  //���� ����
  public void updateShopInfo(ShopVO updateShopBean) {
	  shopMapper.updateShopInfo(updateShopBean);
  }
  
  //���� ����
  public void deleteShopInfo(int shop_no) {
	  shopMapper.deleteShopInfo(shop_no);
  }
  
  /**
   * ��ۼ� ���� ���
   * @return
   */
  public List<ShopVO> recommend_list(int category_no) {
    return shopMapper.recommend_list(category_no);
  }
  
  
  
  
  

}
