package co.sp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import co.sp.beans.WaitingVO;

public interface WaitingMapper {
	//웨이팅 등록
	@Insert("insert into waiting(waiting_no, member_no, shop_no, waiting_count, waiting_rdate) " + 
            "values (waiting_no_seq.nextval, #{member_no}, #{shop_no}, #{waiting_count}, sysdate)")
	void waiting_create(WaitingVO joinWaitingBean);
	
	//웨이팅 목록+페이징
	@Select("select s.shop_name, w.waiting_no, w.waiting_count, w.waiting_rdate  " +
	        "from shop s, member m, waiting w " +
			"where w.shop_no = s.shop_no AND w.member_no = m.member_no AND m.member_no = #{member_no} " +
	        "order by waiting_no desc")
	List<WaitingVO> waiting_list(int member_no, RowBounds rowBounds);
	
	@Select("select count(*) from waiting")
	int getWaitingCnt();
	
	//웨이팅 조회
	@Select("select waiting_no, waiting_count, waiting_rdate " +
	        "from waiting " +
	        "where waiting_no=#{waiting_no} " +
	        "order by waiting_no desc")
	WaitingVO getWaitingInfo(int waiting_no);
	
	//웨이팅 삭제
	@Delete("delete from waiting where waiting_no=#{waiting_no} ")
	void deleteWaitingInfo(int waiting_no);
	
	
	/**
	 * 관리자용 웨이팅 목록 => 회원번호 기준
	 * @return
	 */
	@Select("SELECT m.member_id, s.shop_name, w.waiting_no, w.waiting_count, w.waiting_rdate " +
	        "FROM shop s, member m, waiting w " + 
	        "WHERE w.shop_no = s.shop_no AND w.member_no = m.member_no " + 
	        "ORDER BY m.member_no DESC ")
	List<WaitingVO> wating_list_admin();
	
	
	
	
}
