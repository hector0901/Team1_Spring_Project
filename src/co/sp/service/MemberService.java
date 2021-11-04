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
	
	// ID �ߺ� üũ
	public boolean checkMemberIdExist(String member_id) {	
		String id_check = memberDAO.checkMemberIdExist(member_id);
		
		if(id_check == null) {
			return true;                  //  DB�� �ߺ��� ID�� ���� ���
		} else {
			return false;		  	      //  DB�� �ߺ��� ID�� �ִ� ���
		}
		
	}
	
	// ȸ�� ����
	public void member_create(MemberVO joinMemberBean) {
		memberDAO.member_create(joinMemberBean);
	}
	
	
}











