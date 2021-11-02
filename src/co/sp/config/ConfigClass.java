package co.sp.config;

import javax.servlet.Filter;


import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class ConfigClass extends AbstractAnnotationConfigDispatcherServletInitializer{
  
//public class SpringConfigClass implements WebApplicationInitializer{
//   public void onStartup(ServletContext servletContext) throws ServletException {
//      
//    	AnnotationConfigWebApplicationContext servletContext = new AnnotationConfigWebApplicationContext();  
//     	servletContext.register(ServletContext.class);  <- ServletContext의 객체를 등록
//
//      - 요청을 처리하는 서블릿을 DispatcherServlet로 설정
//      DispatcherServlet dispatcherServlet = new DispatcherServlet(servletContext);
//      ServletRegistration.Dynamic servlet = servletContext.addServlet("dispatcher", dispatcherServlet);
//      servlet.setLoadOnStartup(1);
//      servlet.addMapping("/");
//	
//      Bean을 정의하는 클래스 지정(RootContext => Bean을 정의하는 클래스)	
//      AnnotationConfigWebApplicationContext rootAppContext = new AnnotationConfigWebApplicationContext();
//      rootAppContext.register(RootContext.class);
//	
//      ContextLoaderListener listener = new ContextLoaderListener(rootContext);
//      servletContext.addListener(listener);
//      
//      UTF-8로 인코딩 설정 
//      FilterRegistration.Dynamic filter = servletContext.addFilter("encodingFilter", CharacterEncodingFilter.class);
//      filter.setInitParameter("encoding", "UTF-8");
//      filter.addMappingForServletNames(null, false, "dispatcher");
//   }
//}

	// Dispatcher에 매핑할 요청 주소를 설정
   protected String[] getServletMappings() {
      // TODO Auto-generated method stub
      return new String[] {"/"};
   }
   
   // MVC Project 설정을 위한 클래스 지정(ServletContext)
   protected Class<?>[] getServletConfigClasses() {
      // TODO Auto-generated method stub
      return new Class[] {ServletContext.class};
   }
   
   // 프로젝트에서 사용할 Bean 정의를 담당하는 클래스 지정
   protected Class<?>[] getRootConfigClasses() {
      // TODO Auto-generated method stub
      return new Class[] {RootContext.class};
   }
   
   // 인코딩을 위한 설정
   protected Filter[] getServletFilters() {
      // TODO Auto-generated method stub
      CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
      encodingFilter.setEncoding("UTF-8");
      return new Filter[] {encodingFilter};
   }
}