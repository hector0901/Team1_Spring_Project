package co.sp.service;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import co.sp.beans.AdminVO;
import co.sp.beans.Admin_Category_ShopVO;
import co.sp.beans.ShopVO;
import co.sp.dao.ShopDAO;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class ShopService {
 
  @Value("${path.upload}")
  private String path_upload;
  
  @Autowired
  private ShopDAO shopDAO;

  @Resource(name = "loginBean2")
  private AdminVO loginBean2;
  
  // 파일을 저장하는 메소드로 중복파일이 올라오면 덮어쓰기가 됨
  // 따라서 파일이름 앞에 현재 시간을 더해 구분
  /**
   * 파일 저장 메소드
   * @param upload_file1
   * @return
   */
  private String saveUploadFile1(MultipartFile upload_file1) {

    String file_name1 = System.currentTimeMillis() + "_" + upload_file1.getOriginalFilename();

    try {
      upload_file1.transferTo(new File(path_upload + "/" + file_name1));
    } catch (Exception e) {
      e.printStackTrace();
    }

    return file_name1;

  }
  
  private String saveUploadFile2(MultipartFile upload_file2) {

    String file_name2 = System.currentTimeMillis() + "_" + upload_file2.getOriginalFilename();

    try {
      upload_file2.transferTo(new File(path_upload + "/" + file_name2));
    } catch (Exception e) {
      e.printStackTrace();
    }

    return file_name2;

  }
  
  private String saveUploadFile3(MultipartFile upload_file3) {

    String file_name3 = System.currentTimeMillis() + "_" + upload_file3.getOriginalFilename();

    try {
      upload_file3.transferTo(new File(path_upload + "/" + file_name3));
    } catch (Exception e) {
      e.printStackTrace();
    }

    return file_name3;

  }
  
  /**
   * 가게 등록
   * @param RegShopBean
   */
  public void shop_create(ShopVO RegShopBean) {

    MultipartFile upload_file1 = RegShopBean.getUpload_file1();
    MultipartFile upload_file2 = RegShopBean.getUpload_file2();
    MultipartFile upload_file3 = RegShopBean.getUpload_file3();

    if (upload_file1.getSize() > 0) {
      String file_name1 = saveUploadFile1(upload_file1);
      RegShopBean.setShop_main(file_name1);
      System.out.println(file_name1);
    }
    
    if (upload_file2.getSize() > 0) {
      String file_name2 = saveUploadFile2(upload_file2);
      RegShopBean.setShop_menu_img(file_name2);
      System.out.println(file_name2);
    }
    
    if (upload_file3.getSize() > 0) {
      String file_name3 = saveUploadFile3(upload_file3);
      RegShopBean.setShop_inside_img(file_name3);
      System.out.println(file_name3);
    }

    shopDAO.shop_create(RegShopBean);
    
  }
  
  /**
   * 카테고리별 가게 목록
   * @return
   */
  public List<ShopVO> shop_list_search_paging(int category_no) {
    return shopDAO.shop_list_search_paging(category_no);
  }
  
  
  //가게 상세페이지
  public ShopVO getShopInfo(int shop_no) {
	  return shopDAO.getShopInfo(shop_no);
  }
  //가게 수정
  public void updateShopInfo(ShopVO updateShopBean) {
	  shopDAO.updateShopInfo(updateShopBean);
  }
  
  //가게 삭제
  public void deleteShopInfo(int shop_no) {
	  shopDAO.deleteShopInfo(shop_no);
  }
  
  

}
