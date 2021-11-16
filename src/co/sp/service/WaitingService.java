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
	
	//웨이팅 등록
	public void waiting_create(WaitingVO joinWaitingBean) {
		waitingDAO.waiting_create(joinWaitingBean);
	}
	//웨이팅 목록
	public List<WaitingVO> waiting_list(int member_no) {
		return waitingDAO.waiting_list(member_no);
	}
	
	//웨이팅 조회
	public WaitingVO getWaitingInfo(int waiting_no) {
		return waitingDAO.getWaitingInfo(waiting_no);
	}
	
	//웨이팅 삭제
	public void deleteWaitingInfo(int waiting_no) {
		waitingDAO.deleteWaitingInfo(waiting_no);
	}
	
}
