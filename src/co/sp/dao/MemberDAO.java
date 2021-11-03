package co.sp.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.sp.beans.MemberVO;
import co.sp.mapper.MemberMapper;

@Repository
public class MemberDAO {
	
	@Autowired
	private MemberMapper memberMapper;
	
	// 아이디 중복체크
	public String double_id_check(String member_id) {
		return memberMapper.double_id_check(member_id);
	}
	
	// 회원 가입
	public void member_create(MemberVO joinMemberBean) {
		memberMapper.member_create(joinMemberBean);
	}
	

}








