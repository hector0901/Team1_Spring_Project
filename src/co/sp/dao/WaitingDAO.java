package co.sp.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.sp.beans.WaitingVO;
import co.sp.mapper.WaitingMapper;

@Repository
public class WaitingDAO {
	@Autowired
	private WaitingMapper waitingMapper;
	
	//웨이팅 등록
	public void waiting_create(WaitingVO joinWaitingBean) {
		waitingMapper.waiting_create(joinWaitingBean);
	}
	//웨이팅 목록
	public List<WaitingVO> waiting_list(int member_no) {
		return waitingMapper.waiting_list(member_no);
	}
	
	//웨이팅 조회
	public WaitingVO getWaitingInfo(int waiting_no) {
		return waitingMapper.getWaitingInfo(waiting_no);
	}
	
	//웨이팅 삭제
	public void deleteWaitingInfo(int waiting_no) {
		waitingMapper.deleteWaitingInfo(waiting_no);
	}
}
