package co.sp.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.sp.beans.MemberVO;
import co.sp.mapper.MemberMapper;

@Repository
public class MemberDAO {
	
	@Autowired
	private MemberMapper memberMapper;
	
	// ���̵� �ߺ�üũ
	public String checkMemberIdExist(String member_id) {
		return memberMapper.checkMemberIdExist(member_id);
	}
	
	// ȸ�� ����
	public void member_create(MemberVO joinMemberBean) {
		memberMapper.member_create(joinMemberBean);
	}
	

	

}








