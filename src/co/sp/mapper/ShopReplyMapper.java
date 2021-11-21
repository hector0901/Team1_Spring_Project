package co.sp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import co.sp.beans.Shop_ReplyVO;

public interface ShopReplyMapper {
	//¥Ò±€ µÓ∑œ
	@Insert("insert into shop_reply(shop_reply_no, member_no, shop_no, shop_reply_content, shop_reply_rdate) " +
	        "values (shop_reply_no_seq.nextval, #{member_no}, #{shop_no}, #{shop_reply_content}, sysdate)")
	void shopreply_create(Shop_ReplyVO joinShopreplyBean);
	
	//¥Ò±€ ∏Ò∑œ+∆‰¿Ã¬°
	@Select("select m.member_nickname, m.member_no, m.member_profile, r.shop_reply_content, r.shop_reply_rdate, r.shop_reply_no " +
	        "from member m, shop s, shop_reply r " +
			"where m.member_no = r.member_no AND s.shop_no = r.shop_no AND s.shop_no = #{shop_no} " + 
	        "order by shop_reply_no desc")
	List<Shop_ReplyVO> shopreply_list(int shop_no, RowBounds rowBounds);
	
	@Select("select count(*) from shop_reply")
	int getShopreplyCnt();
	
	//¥Ò±€ ªË¡¶
	@Delete("delete from shop_reply"
			+" where shop_reply_no = #{shop_reply_no} and shop_no = #{shop_no} and member_no = #{member_no}")
	void deleteReply(Shop_ReplyVO DeleteShopreplyBean);
	
}
