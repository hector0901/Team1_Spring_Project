package co.sp.config;

import java.util.Properties;

import javax.annotation.Resource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import co.sp.beans.AdminVO;
import co.sp.beans.MemberVO;
import co.sp.interceptor.LoginInterceptor;
import co.sp.interceptor.MemberInterceptor;
import co.sp.interceptor.TopMenuInterceptor;
import co.sp.interceptor.TopMenuInterceptor2;
import co.sp.mapper.AdminMapper;
import co.sp.mapper.MemberMapper;
import co.sp.mapper.ReservationMapper;
import co.sp.mapper.ShopMapper;
import co.sp.mapper.ShopReplyMapper;
import co.sp.mapper.WaitingMapper;
import co.sp.service.AdminService;
import co.sp.service.MemberService;

@Configuration
@EnableWebMvc

@ComponentScan("co.sp.controller")
@ComponentScan("co.sp.dao")
@ComponentScan("co.sp.service")

@PropertySource("/WEB-INF/properties/db.properties")
public class ServletContext implements WebMvcConfigurer {

	@Value("${db.classname}")
	private String db_classname;

	@Value("${db.url}")
	private String db_url;

	@Value("${db.username}")
	private String db_username;

	@Value("${db.password}")
	private String db_password;
	
	@Resource(name="loginBean")
	private MemberVO loginBean;
	
    @Resource(name="loginBean2")
    private AdminVO loginBean2;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AdminService adminService;

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		// TODO Auto-generated method stub
		WebMvcConfigurer.super.configureViewResolvers(registry);
		registry.jsp("/WEB-INF/views/", ".jsp");
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// TODO Auto-generated method stub
		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/**").addResourceLocations("/resources/");
	}

	@Bean
	public BasicDataSource dataSource() {
		BasicDataSource source = new BasicDataSource();
		source.setDriverClassName(db_classname);
		source.setUrl(db_url);
		source.setUsername(db_username);
		source.setPassword(db_password);

		return source;
	}

	@Bean
	public SqlSessionFactory factory(BasicDataSource source) throws Exception {
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(source);
		SqlSessionFactory factory = factoryBean.getObject();
		return factory;
	}

	@Bean
	public MapperFactoryBean<MemberMapper> getMemberMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<MemberMapper> factoryBean = new MapperFactoryBean<MemberMapper>(MemberMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	@Bean
	public MapperFactoryBean<AdminMapper> getAdminMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<AdminMapper> factoryBean = new MapperFactoryBean<AdminMapper>(AdminMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	@Bean
    public MapperFactoryBean<ShopMapper> getShopMapper(SqlSessionFactory factory) throws Exception {
        MapperFactoryBean<ShopMapper> factoryBean = new MapperFactoryBean<ShopMapper>(ShopMapper.class);
        factoryBean.setSqlSessionFactory(factory);
        return factoryBean;
    }
	
	@Bean
    public MapperFactoryBean<ReservationMapper> getReservationMapper(SqlSessionFactory factory) throws Exception {
        MapperFactoryBean<ReservationMapper> factoryBean = new MapperFactoryBean<ReservationMapper>(ReservationMapper.class);
        factoryBean.setSqlSessionFactory(factory);
        return factoryBean;
    }
	
	@Bean
	public MapperFactoryBean<WaitingMapper> getWaitingMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<WaitingMapper> factoryBean = new MapperFactoryBean<WaitingMapper>(WaitingMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	@Bean MapperFactoryBean<ShopReplyMapper> getShopReplyMapper (SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<ShopReplyMapper> factoryBean = new MapperFactoryBean<ShopReplyMapper>(ShopReplyMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}


	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// TODO Auto-generated method stub
		WebMvcConfigurer.super.addInterceptors(registry);
		
		TopMenuInterceptor topMenuInterceptor = new TopMenuInterceptor(loginBean);
		InterceptorRegistration reg1 = registry.addInterceptor(topMenuInterceptor);
		reg1.addPathPatterns("/**");
		
		TopMenuInterceptor2 topMenuInterceptor2 =new TopMenuInterceptor2(loginBean2);
		InterceptorRegistration reg5 = registry.addInterceptor(topMenuInterceptor2);
		reg5.addPathPatterns("/**");
		
		LoginInterceptor loginInterceptor = new LoginInterceptor(loginBean);
		InterceptorRegistration reg2 = registry.addInterceptor(loginInterceptor);
		reg2.addPathPatterns("/member/member_update", "/member/member_delete", "/views/*");
		reg2.excludePathPatterns("/views/main");
		
		MemberInterceptor memberInterceptor = new MemberInterceptor(loginBean, memberService);
		InterceptorRegistration reg3 = registry.addInterceptor(memberInterceptor);
		reg3.addPathPatterns("/member/member_update", "/member/member_delete");
	}

	@Bean
	public static PropertySourcesPlaceholderConfigurer PropertySourcesPlaceholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}

	@Bean
	public ReloadableResourceBundleMessageSource messageSource() {
		ReloadableResourceBundleMessageSource res = new ReloadableResourceBundleMessageSource();
		res.setBasenames("/WEB-INF/properties/error_message");
		return res;
	}

	@Bean
	public StandardServletMultipartResolver multipartResolver() {
		return new StandardServletMultipartResolver();
	}
	
	@Bean
    public JavaMailSenderImpl mailSender() {
        
        JavaMailSenderImpl mailsender = new JavaMailSenderImpl();
        
        mailsender.setHost("smtp.gmail.com");
        mailsender.setPort(25);
        mailsender.setUsername("qhadl0796@gmail.com");
        mailsender.setPassword("");
        Properties props = new Properties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.auth", "true");
        mailsender.setJavaMailProperties(props);
        
        return mailsender;
    }

}
