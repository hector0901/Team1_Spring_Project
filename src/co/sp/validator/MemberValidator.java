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
		
		// 회원 가입, 수정시 비밀번호1과 2가 일치하지 않으면 NotEquals Error 발생
		if(beanName.equals("joinMemberBean") || beanName.equals("updateMemberBean")) {
			if(memberVO.getMember_pw().equals(memberVO.getMember_pw2()) == false) {
				errors.rejectValue("member_pw", "NotEquals");
				errors.rejectValue("member_pw2", "NotEquals");
			}
		}
		
		// 회원가입시 중복체크 검사를 하지 않았을시 Error 발생
		if(beanName.equals("joinMemberBean")) {
			if(memberVO.isIdExist() == false) {
				errors.rejectValue("member_id", "DontCheckMemberIdExist");
			}
		}
		
	}

}
