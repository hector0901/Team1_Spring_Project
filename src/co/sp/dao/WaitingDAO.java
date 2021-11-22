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
	
	//웨이팅 등록
	public void waiting_create(WaitingVO joinWaitingBean) {
		waitingMapper.waiting_create(joinWaitingBean);
	}
	//웨이팅 목록
	public List<WaitingVO> waiting_list(int member_no, RowBounds rowBounds) {
		return waitingMapper.waiting_list(member_no, rowBounds);
	}
	
	//웨이팅 목록 페이징
	public int getWaitingCnt() {
		return waitingMapper.getWaitingCnt();
	}
	
	//웨이팅 조회
	public WaitingVO getWaitingInfo(int waiting_no) {
		return waitingMapper.getWaitingInfo(waiting_no);
	}
	
	//웨이팅 삭제
	public void deleteWaitingInfo(int waiting_no) {
		waitingMapper.deleteWaitingInfo(waiting_no);
	}
	
	/**
	 * 관리자용 웨이팅 목록
	 * @return
	 */
	public List<WaitingVO> wating_list_admin() {
      return waitingMapper.wating_list_admin();
    } 
	
	
}
