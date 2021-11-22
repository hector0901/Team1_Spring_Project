package co.sp.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import co.sp.beans.Page;
import co.sp.beans.WaitingVO;
import co.sp.dao.WaitingDAO;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class WaitingService {
	@Value("${page.listcount}")
	private int page_listcount;
	
	@Value("${page.pa}")
	private int page_pa;
	
	@Autowired
	private WaitingDAO waitingDAO;
	
	//������ ���
	public void waiting_create(WaitingVO joinWaitingBean) {
		waitingDAO.waiting_create(joinWaitingBean);
	}
	//������ ���+����¡
	public List<WaitingVO> waiting_list(int member_no, int page) {
		
		int start=(page -1)* page_listcount;
		RowBounds rowBounds=new RowBounds(start, page_listcount);
		return waitingDAO.waiting_list(member_no, rowBounds);
	}
	
	public Page getWaitingCnt(int currentPage) {
		int waiting_cnt=waitingDAO.getWaitingCnt();
		Page pageBean = new Page(waiting_cnt, currentPage, page_listcount, page_pa);
		
		return pageBean;
	}
	
	//������ ��ȸ
	public WaitingVO getWaitingInfo(int waiting_no) {
		return waitingDAO.getWaitingInfo(waiting_no);
	}
	
	//������ ����
	public void deleteWaitingInfo(int waiting_no) {
		waitingDAO.deleteWaitingInfo(waiting_no);
	}
	
	/**
	 * �����ڿ� ������ ���
	 * @return
	 */
	public List<WaitingVO> wating_list_admin() {
      return waitingDAO.wating_list_admin();
    } 
	
	
	
	
	
	
	
}
