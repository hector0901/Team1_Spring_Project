package co.sp.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.annotation.SessionScope;

import co.sp.beans.AdminVO;
import co.sp.beans.Admin_Category_ShopVO;
import co.sp.beans.MemberVO;


// Bean Á¤ÀÇ
@Configuration
public class RootContext {
  
	@Bean("loginBean")
	@SessionScope
	public MemberVO loginBean() {
		return new MemberVO();
	}

	/**
	 * pw Bean
	 * @return
	 */
	@Bean("pwBean")
    @SessionScope
    public MemberVO pwBean() {
        return new MemberVO();
    }
	
	@Bean("loginBean2")
	@SessionScope
	public AdminVO loginBean2() {
		return new AdminVO();
	}



}
