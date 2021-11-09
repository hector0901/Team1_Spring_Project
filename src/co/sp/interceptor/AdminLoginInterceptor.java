package co.sp.interceptor;



import org.springframework.web.servlet.HandlerInterceptor;

import co.sp.beans.AdminVO;
import co.sp.service.AdminService;

public class AdminLoginInterceptor implements HandlerInterceptor{
  private AdminVO loginBean2;
  private AdminService adminService;
  
  public AdminLoginInterceptor(AdminVO loginBean2, AdminService adminService) {
    this.loginBean2=loginBean2;
    this.adminService=adminService;
  }
}
