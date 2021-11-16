package co.sp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import co.sp.beans.WaitingVO;
import co.sp.dao.WaitingDAO;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class WaitingService {
	@Autowired
	private WaitingDAO waitingDAO;
	
	//������ ���
	public void waiting_create(WaitingVO joinWaitingBean) {
		waitingDAO.waiting_create(joinWaitingBean);
	}
	//������ ���
	public List<WaitingVO> waiting_list(int member_no) {
		return waitingDAO.waiting_list(member_no);
	}
	
	//������ ��ȸ
	public WaitingVO getWaitingInfo(int waiting_no) {
		return waitingDAO.getWaitingInfo(waiting_no);
	}
	
	//������ ����
	public void deleteWaitingInfo(int waiting_no) {
		waitingDAO.deleteWaitingInfo(waiting_no);
	}
	
}
