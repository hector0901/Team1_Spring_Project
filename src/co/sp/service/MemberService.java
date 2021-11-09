package co.sp.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.sp.beans.MemberVO;
import co.sp.dao.MemberDAO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Resource(name = "loginBean")
	private MemberVO loginBean;
	
	// ID 중복 체크
	public boolean checkMemberIdExist(String member_id) {	
		String id_check = memberDAO.checkMemberIdExist(member_id);
		
		if(id_check == null) {
			return true;                  //  DB에 중복된 ID가 없는 경우
		} else {
			return false;		  	      //  DB에 중복된 ID가 있는 경우
		}
		
	}
	
	// 회원 가입
	public void member_create(MemberVO joinMemberBean) {
		memberDAO.member_create(joinMemberBean);
	}
	
	// 회원 로그인
	public void getLoginMemberInfo(MemberVO tempLoginMemberBean) {
      
	  MemberVO tempLoginMemberBean2 = memberDAO.getLoginMemberInfo(tempLoginMemberBean);
      
      if(tempLoginMemberBean2 != null) {
          loginBean.setMember_no(tempLoginMemberBean2.getMember_no());
          loginBean.setMember_name(tempLoginMemberBean2.getMember_name());
          
          loginBean.setMemberLogin(true);
      }
  }
	
	
}











