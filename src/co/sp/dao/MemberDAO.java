package co.sp.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import co.sp.beans.AdminVO;
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
	
	// ȸ�� ���
    public List<MemberVO> member_list(RowBounds rowBounds) {
        return memberMapper.member_list(rowBounds);
    }
    
    public MemberVO getMemberInfo(int member_no) {
        return memberMapper.getMemberInfo(member_no);
    }
    
    // ȸ�� ��� ����¡
    public int getMemberCnt() {
        return memberMapper.getMemberCnt();
    }
	
	// ȸ�� ����
	public void member_create(MemberVO joinMemberBean) {
		memberMapper.member_create(joinMemberBean);
	}
	
	public MemberVO getLoginmemberInfo(MemberVO tempLoginMemberBean) {
		return memberMapper.getLoginmemberInfo(tempLoginMemberBean);
	} //ȸ�� �α���
	
	public MemberVO getupdatememberInfo(int member_no) {
		return memberMapper.getupdatememberInfo(member_no);
	} //������ ��ȸ
	
	public void updatememberInfo(MemberVO updateMemberBean) {
		memberMapper.updatememberInfo(updateMemberBean);
	}  //����
	
	public void deleteMemberInfo(MemberVO deleteMemberBean) {
		memberMapper.deleteMemberInfo(deleteMemberBean);
	} //����
	
	public MemberVO getdeletememberInfo(int member_no) {
		return memberMapper.getdeletememberInfo(member_no);
	} //��ȸ
	
	/**
	 * PWã��
	 * @param tempPWBean
	 * @return
	 */
	public MemberVO getPWInfo(MemberVO tempPWBean) {
	  return memberMapper.getPWInfo(tempPWBean);
	}
	
	

	

}








