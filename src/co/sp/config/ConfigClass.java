package co.sp.config;

import javax.servlet.Filter;


import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class ConfigClass extends AbstractAnnotationConfigDispatcherServletInitializer{
  
//public class SpringConfigClass implements WebApplicationInitializer{
//   public void onStartup(ServletContext servletContext) throws ServletException {
//      
//    	AnnotationConfigWebApplicationContext servletContext = new AnnotationConfigWebApplicationContext();  
//     	servletContext.register(ServletContext.class);  <- ServletContext�� ��ü�� ���
//
//      - ��û�� ó���ϴ� ������ DispatcherServlet�� ����
//      DispatcherServlet dispatcherServlet = new DispatcherServlet(servletContext);
//      ServletRegistration.Dynamic servlet = servletContext.addServlet("dispatcher", dispatcherServlet);
//      servlet.setLoadOnStartup(1);
//      servlet.addMapping("/");
//	
//      Bean�� �����ϴ� Ŭ���� ����(RootContext => Bean�� �����ϴ� Ŭ����)	
//      AnnotationConfigWebApplicationContext rootAppContext = new AnnotationConfigWebApplicationContext();
//      rootAppContext.register(RootContext.class);
//	
//      ContextLoaderListener listener = new ContextLoaderListener(rootContext);
//      servletContext.addListener(listener);
//      
//      UTF-8�� ���ڵ� ���� 
//      FilterRegistration.Dynamic filter = servletContext.addFilter("encodingFilter", CharacterEncodingFilter.class);
//      filter.setInitParameter("encoding", "UTF-8");
//      filter.addMappingForServletNames(null, false, "dispatcher");
//   }
//}

	// Dispatcher�� ������ ��û �ּҸ� ����
   protected String[] getServletMappings() {
      // TODO Auto-generated method stub
      return new String[] {"/"};
   }
   
   // MVC Project ������ ���� Ŭ���� ����(ServletContext)
   protected Class<?>[] getServletConfigClasses() {
      // TODO Auto-generated method stub
      return new Class[] {ServletContext.class};
   }
   
   // ������Ʈ���� ����� Bean ���Ǹ� ����ϴ� Ŭ���� ����
   protected Class<?>[] getRootConfigClasses() {
      // TODO Auto-generated method stub
      return new Class[] {RootContext.class};
   }
   
   // ���ڵ��� ���� ����
   protected Filter[] getServletFilters() {
      // TODO Auto-generated method stub
      CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
      encodingFilter.setEncoding("UTF-8");
      return new Filter[] {encodingFilter};
   }
}