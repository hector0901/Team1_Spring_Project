package co.sp.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import co.sp.beans.WaitingVO;

public class WaitingValidator implements Validator{
	
	@Override
	public boolean supports(Class<?> clazz) {
		return WaitingVO.class.isAssignableFrom(clazz);
	}
	@Override
	public void validate(Object target, Errors errors) {
		WaitingVO waitingVO=(WaitingVO)target;
	}
}
