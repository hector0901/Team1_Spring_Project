package co.sp.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.sp.beans.AdminVO;
import co.sp.beans.MemberVO;
import co.sp.mapper.MemberMapper;

@Repository
public class MemberDAO {
	
	@Autowired
	private MemberMapper memberMapper;
	
	// 아이디 중복체크
	public String checkMemberIdExist(String member_id) {
		return memberMapper.checkMemberIdExist(member_id);
	}
	
	// 회원 가입
	public void member_create(MemberVO joinMemberBean) {
		memberMapper.member_create(joinMemberBean);
	}
	
	public MemberVO getLoginmemberInfo(MemberVO tempLoginMemberBean) {
		return memberMapper.getLoginmemberInfo(tempLoginMemberBean);
	} //회원 로그인
	
	public MemberVO getupdatememberInfo(int member_no) {
		return memberMapper.getupdatememberInfo(member_no);
	} //수정용 조회
	
	public void updatememberInfo(MemberVO updateMemberBean) {
		memberMapper.updatememberInfo(updateMemberBean);
	}  //수정
	
	public void deleteMemberInfo(MemberVO deleteMemberBean) {
		memberMapper.deleteMemberInfo(deleteMemberBean);
	} //삭제
	
	public MemberVO getdeletememberInfo(int member_no) {
		return memberMapper.getdeletememberInfo(member_no);
	} //조회

	

}








