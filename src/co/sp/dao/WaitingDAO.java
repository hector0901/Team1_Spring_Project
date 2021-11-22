package co.sp.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
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
	public List<WaitingVO> waiting_list(int member_no, RowBounds rowBounds) {
		return waitingMapper.waiting_list(member_no, rowBounds);
	}
	
	//������ ��� ����¡
	public int getWaitingCnt() {
		return waitingMapper.getWaitingCnt();
	}
	
	//������ ��ȸ
	public WaitingVO getWaitingInfo(int waiting_no) {
		return waitingMapper.getWaitingInfo(waiting_no);
	}
	
	//������ ����
	public void deleteWaitingInfo(int waiting_no) {
		waitingMapper.deleteWaitingInfo(waiting_no);
	}
	
	/**
	 * �����ڿ� ������ ���
	 * @return
	 */
	public List<WaitingVO> wating_list_admin() {
      return waitingMapper.wating_list_admin();
    } 
	
	
}
