package co.sp.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import co.sp.beans.Page;
import co.sp.beans.Shop_ReplyVO;
import co.sp.dao.ShopReplyDAO;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class ShopReplyService {
	@Autowired
	private ShopReplyDAO shopreplyDAO;
	
	@Value("${page.listcount}")
	private int page_listcount;
	
	@Value("${page.pa}")
	private int page_pa;
	
	//´ñ±Û µî·Ï
	public void shopreply_create(Shop_ReplyVO joinShopreplyBean) {
		shopreplyDAO.shopreply_create(joinShopreplyBean);
	}
	
	//´ñ±Û ¸ñ·Ï
	public List<Shop_ReplyVO> shopreply_list(int shop_no, int page) {
		int start=(page -1)* page_listcount;
		RowBounds rowBounds=new RowBounds(start, page_listcount);
		return shopreplyDAO.shopreply_list(shop_no, rowBounds);
	}
	//´ñ±Û ¸ñ·Ï ÆäÀÌÂ¡
	public Page getShopreplyCnt(int currentPage) {
		int shopreply_cnt=shopreplyDAO.getShopreplyCnt();
		Page pageBean=new Page(shopreply_cnt, currentPage, page_listcount, page_pa);
		
		return pageBean;
	}
	
	//´ñ±Û »èÁ¦
	public void deleteReply(Shop_ReplyVO DeleteShopreplyBean) {
		shopreplyDAO.deleteReply(DeleteShopreplyBean);
	}

	
}
