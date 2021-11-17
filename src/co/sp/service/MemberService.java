package co.sp.service;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import co.sp.beans.AdminVO;
import co.sp.beans.MemberVO;
import co.sp.beans.Page;
import co.sp.dao.MemberDAO;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class MemberService {
  
  @Value("${page.listcount}")
  private int page_listcount;
  
  @Value("${page.pa}")
  private int page_pa;
  
  @Value("${path.upload}")
  private String path_upload;

  @Autowired
  private MemberDAO memberDAO;

  @Resource(name = "loginBean")
  private MemberVO loginBean;

  
  // 파일을 저장하는 메소드로 중복파일이 올라오면 덮어쓰기가 됨
  // 따라서 파일이름 앞에 현재 시간을 더해 구분
  private String saveUploadFile(MultipartFile upload_file) {
    
    String file_name = System.currentTimeMillis() + "_" + upload_file.getOriginalFilename();
    
    try {
      upload_file.transferTo(new File(path_upload + "/" + file_name));
    } catch (Exception e) {
      e.printStackTrace();
    }

    return file_name;
    
  }

  // ID 중복 체크
  public boolean checkMemberIdExist(String member_id) {
    String id_check = memberDAO.checkMemberIdExist(member_id);

    if (id_check == null) {
      return true; // DB에 중복된 ID가 없는 경우
    } else {
      return false; // DB에 중복된 ID가 있는 경우
    }

  }

  // 회원 가입
  public void member_create(MemberVO joinMemberBean) {
    
    MultipartFile upload_file = joinMemberBean.getUpload_file();
    
    if(upload_file.getSize() > 0) {
      String file_name = saveUploadFile(upload_file);
      joinMemberBean.setMember_profile(file_name);
      System.out.println(file_name);
    }   
    memberDAO.member_create(joinMemberBean);         
  }

  /**
   * 회원 로그인
   * 
   * @param tempLoginMemberBean
   */
  public void getLoginmemberInfo(MemberVO tempLoginMemberBean) {
    tempLoginMemberBean.setMember_name(loginBean.getMember_name());
    tempLoginMemberBean = memberDAO.getLoginmemberInfo(tempLoginMemberBean);

    if (tempLoginMemberBean != null) {
      loginBean.setMember_no(tempLoginMemberBean.getMember_no());
      loginBean.setMember_name(tempLoginMemberBean.getMember_name());
      loginBean.setMemberLogin(true);
    }
  }

  public void getupdatememberInfo(MemberVO updateMemberBean) {
    MemberVO tempUpdateMemberBean = memberDAO.getupdatememberInfo(loginBean.getMember_no());

    updateMemberBean.setMember_id(tempUpdateMemberBean.getMember_id());
    updateMemberBean.setMember_pw(tempUpdateMemberBean.getMember_pw());
    updateMemberBean.setMember_pw2(tempUpdateMemberBean.getMember_pw2());
    updateMemberBean.setMember_name(tempUpdateMemberBean.getMember_name());
    updateMemberBean.setMember_social(tempUpdateMemberBean.getMember_social());
    updateMemberBean.setMember_nickname(tempUpdateMemberBean.getMember_nickname());
    updateMemberBean.setMember_tel(tempUpdateMemberBean.getMember_tel());
    updateMemberBean.setMember_email(tempUpdateMemberBean.getMember_email());
    updateMemberBean.setMember_zipcode(tempUpdateMemberBean.getMember_zipcode());
    updateMemberBean.setMember_address1(tempUpdateMemberBean.getMember_address1());
    updateMemberBean.setMember_address2(tempUpdateMemberBean.getMember_address2());
    updateMemberBean.setMember_profile(tempUpdateMemberBean.getMember_profile());

    updateMemberBean.setMember_no(loginBean.getMember_no());

  }

  public void updatememberInfo(MemberVO updateMemberBean) {
    updateMemberBean.setMember_no(loginBean.getMember_no());

    memberDAO.updatememberInfo(updateMemberBean);
  }

  public void deleteMemberInfo(MemberVO deleteMemberBean) {
    deleteMemberBean.setMember_no(loginBean.getMember_no());
    memberDAO.deleteMemberInfo(deleteMemberBean);
  }

  //회원목록
  public List<MemberVO> member_list(int page) {
      
      int start = (page -1)* page_listcount;
      RowBounds rowBounds = new RowBounds(start, page_listcount);
      return memberDAO.member_list(rowBounds);
  }
  
  //회원목록 페이징
  public Page getMemberCnt(int currentPage) {
      int member_cnt = memberDAO.getMemberCnt();
      Page pageBean = new Page(member_cnt, currentPage, page_listcount, page_pa);
      
      return pageBean;
  }

}
