package co.sp.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.sp.beans.Shop_ReplyVO;
import co.sp.mapper.ShopReplyMapper;

@Repository
public class ShopReplyDAO {
	@Autowired
	private ShopReplyMapper shopreplyMapper;
	
	//´ñ±Û µî·Ï
	public void shopreply_create(Shop_ReplyVO joinShopreplyBean) {
		shopreplyMapper.shopreply_create(joinShopreplyBean);
	}
	
	//´ñ±Û ¸ñ·Ï
	public List<Shop_ReplyVO> shopreply_list(int shop_no, RowBounds rowBounds) {
		return shopreplyMapper.shopreply_list(shop_no, rowBounds);
	}
	public int getShopreplyCnt() {
		return shopreplyMapper.getShopreplyCnt();
	}
	
	//´ñ±Û »èÁ¦
	public void deleteReply(Shop_ReplyVO DeleteShopreplyBean) {
		shopreplyMapper.deleteReply(DeleteShopreplyBean);
	}

}
