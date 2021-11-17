package co.sp.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import co.sp.beans.AdminVO;
import co.sp.beans.MemberVO;
import co.sp.beans.Page;
import co.sp.beans.ReservationVO;
import co.sp.dao.ReservationDAO;

@Service
public class ReservationService {
  
  @Autowired
  private ReservationDAO reservationDAO;
  
  @Resource(name = "loginBean2")
  private AdminVO loginBean2;
  
  @Resource(name = "loginBean")
  private MemberVO loginBean;
  
  @Value("${page.listcount}")
  private int page_listcount;
  
  @Value("${page.pa}")
  private int page_pa;
  
  /**
   * 예약
   * @param reservationBean
   */
  public void reservation(ReservationVO reservationBean) {
    reservationDAO.reservation(reservationBean);
  }
  
  /**
   * 회원번호 기준 예약 목록
   * @param member_no
   * @return
   */
  public List<ReservationVO> reservation_list(int member_no, int page) {
	  int start=(page -1)* page_listcount;
	  RowBounds rowBounds = new RowBounds(start, page_listcount);
	  
   return reservationDAO.reservation_list(member_no, rowBounds); 
  }
  
  //예약목록 페이징
  public Page getReservationCnt(int currentPage) {
	  int reservation_cnt=reservationDAO.getReservationCnt();
	  Page pageBean=new Page(reservation_cnt, currentPage, page_listcount, page_pa);
	  
	  return pageBean;
  }
  
  /**
   * 예약번호 기준 1건 조회
   * @param reservation_no
   * @return
   */
  public ReservationVO reservation_read(int reservation_no) {
    return reservationDAO.reservation_read(reservation_no);
  }
  
  /**
   * 예약번호 기준 1건 삭제
   * @param reservation_no
   */
  public void reservation_delete(int reservation_no) {
    reservationDAO.reservation_delete(reservation_no);
  }

}
