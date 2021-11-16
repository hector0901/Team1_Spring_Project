package co.sp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import co.sp.beans.WaitingVO;

public interface WaitingMapper {
	//웨이팅 등록
	@Insert("insert into waiting(waiting_no, member_no, shop_no, waiting_count, waiting_rdate) " + 
            "values (waiting_no_seq.nextval, #{member_no}, #{shop_no}, #{waiting_count}, sysdate)")
	void waiting_create(WaitingVO joinWaitingBean);
	
	//웨이팅 목록
	@Select("select waiting_no, waiting_count, waiting_rdate " +
	        "from waiting " +
			"where member_no=#{member_no} " +
	        "order by waiting_no desc")
	List<WaitingVO> waiting_list(int member_no);
	
	//웨이팅 조회
	@Select("select waiting_no, waiting_count, waiting_rdate " +
	        "from waiting " +
	        "where waiting_no=#{waiting_no} " +
	        "order by waiting_no desc")
	WaitingVO getWaitingInfo(int waiting_no);
	
	//웨이팅 삭제
	@Delete("delete from waiting where waiting_no=#{waiting_no} ")
	void deleteWaitingInfo(int waiting_no);
}
