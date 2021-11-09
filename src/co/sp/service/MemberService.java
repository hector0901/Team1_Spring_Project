package co.sp.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import co.sp.beans.AdminVO;
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
	
	/**
	 * 회원 로그인
	 * @param tempLoginMemberBean
	 */
	public void getLoginmemberInfo(MemberVO tempLoginMemberBean) {
		 tempLoginMemberBean.setMember_name(loginBean.getMember_name());
		 tempLoginMemberBean=memberDAO.getLoginmemberInfo(tempLoginMemberBean);
		
		if(tempLoginMemberBean !=null) {
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
	
}











