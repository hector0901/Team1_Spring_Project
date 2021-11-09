package co.sp.mapper;

import org.apache.ibatis.annotations.Select;

import co.sp.beans.AdminVO;

public interface AdminMapper {
  
  /**
   * ������ �α���
   * @param tempLoginAdminBean
   * @return
   */
	@Select("select admin_no, admin_name " + 
			"from admin " + 
			"where admin_id=#{admin_id} and admin_pw=#{admin_pw}")
	AdminVO getLoginadminInfo(AdminVO tempLoginAdminBean); //�����ڷα���
}
