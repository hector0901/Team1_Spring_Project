package co.sp.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import co.sp.beans.ShopVO;

public class ShopValidator implements Validator {

  @Override
  public boolean supports(Class<?> clazz) {
    // TODO Auto-generated method stub
    return ShopVO.class.isAssignableFrom(clazz);
  }

  @Override
  public void validate(Object target, Errors errors) {
    // TODO Auto-generated method stub
    
  }
  
  

}
