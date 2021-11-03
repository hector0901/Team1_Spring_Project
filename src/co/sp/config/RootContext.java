package co.sp.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.annotation.SessionScope;
import co.sp.beans.MemberVO;


// Bean Á¤ÀÇ
@Configuration
public class RootContext {
  
	@Bean("loginBean")
	@SessionScope
	public MemberVO loginBean() {
		return new MemberVO();
	}


}
