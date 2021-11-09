package co.sp.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.sp.beans.AdminVO;
import co.sp.dao.AdminDAO;

@Service
public class AdminService {
	@Autowired
	private AdminDAO adminDAO;
	
	@Resource(name="loginBean2")
	private AdminVO loginBean2;
	
	/**
	 * 관리자 로그인
	 * @param tempLoginAdminBean
	 */
	public void getLoginadminInfo(AdminVO tempLoginAdminBean) {
		//AdminVO tempLoginAdminBean2=adminDAO.getLoginadminInfo(tempLoginAdminBean);
	  tempLoginAdminBean.setAdmin_name(loginBean2.getAdmin_name());
	  tempLoginAdminBean=adminDAO.getLoginadminInfo(tempLoginAdminBean);
	  
	  
		if(tempLoginAdminBean !=null) {
			loginBean2.setAdmin_no(tempLoginAdminBean.getAdmin_no());
			loginBean2.setAdmin_name(tempLoginAdminBean.getAdmin_name());
			loginBean2.setAdminLogin(true);
		}
	}
}
