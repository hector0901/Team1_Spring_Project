package co.sp.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import co.sp.beans.MemberVO;

public class MemberValidator implements Validator {

  @Override
  public boolean supports(Class<?> clazz) {
    // TODO Auto-generated method stub
    return MemberVO.class.isAssignableFrom(clazz);
  }

  @Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		MemberVO memberVO = (MemberVO)target;
		
		String beanName = errors.getObjectName();
		
		// ȸ�� ����, ������ ��й�ȣ1�� 2�� ��ġ���� ������ NotEquals Error �߻�
		if(beanName.equals("joinMemberBean") || beanName.equals("updateMemberBean")) {
			if(memberVO.getMember_pw().equals(memberVO.getMember_pw2()) == false) {
				errors.rejectValue("member_pw", "NotEquals");
				errors.rejectValue("member_pw2", "NotEquals");
			}
		}
		
		// ȸ�����Խ� �ߺ�üũ �˻縦 ���� �ʾ����� Error �߻�
		if(beanName.equals("joinMemberBean")) {
			if(memberVO.isIdExist() == false) {
				errors.rejectValue("member_id", "DontCheckMemberIdExist");
			}
		}
		
	}

}
