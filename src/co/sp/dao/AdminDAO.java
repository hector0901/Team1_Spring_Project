package co.sp.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.sp.beans.AdminVO;
import co.sp.mapper.AdminMapper;

@Repository
public class AdminDAO {
	@Autowired
	private AdminMapper adminMapper;
	
	public AdminVO getLoginadminInfo(AdminVO tempLoginAdminBean) {
		return adminMapper.getLoginadminInfo(tempLoginAdminBean);
	} //관리자 로그인
}
