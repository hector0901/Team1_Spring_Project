package co.sp.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import co.sp.beans.AdminVO;

public class AdminValidator implements Validator {

  @Override
  public boolean supports(Class<?> clazz) {
    // TODO Auto-generated method stub
    return AdminVO.class.isAssignableFrom(clazz);
  }

@Override
public void validate(Object target, Errors errors) {
	// TODO Auto-generated method stub
	AdminVO adminVO = (AdminVO)target;
	
}
}
