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
	
	//������ ���
	public void waiting_create(WaitingVO joinWaitingBean) {
		waitingMapper.waiting_create(joinWaitingBean);
	}
	//������ ���
	public List<WaitingVO> waiting_list(int member_no) {
		return waitingMapper.waiting_list(member_no);
	}
	
	//������ ��ȸ
	public WaitingVO getWaitingInfo(int waiting_no) {
		return waitingMapper.getWaitingInfo(waiting_no);
	}
	
	//������ ����
	public void deleteWaitingInfo(int waiting_no) {
		waitingMapper.deleteWaitingInfo(waiting_no);
	}
}
