package co.sp.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.sp.beans.ReservationVO;
import co.sp.mapper.ReservationMapper;

@Repository
public class ReservationDAO {
  
  @Autowired
  private ReservationMapper reservationMapper;
  
  /**
   * 예약 등록
   * @param reservationBean
   */
  public void reservation(ReservationVO reservationBean) {
    reservationMapper.reservation(reservationBean);
  }
  
  /**
   * 예약 목록
   * @param member_no
   * @return
   */
  public List<ReservationVO> reservation_list(int member_no, RowBounds rowBounds) {
    return reservationMapper.reservation_list(member_no, rowBounds);
  }
  
  //예약목록페이징
  public int getReservationCnt() {
	  return reservationMapper.getReservationCnt();
  }
  /**
   * 예약 상세조회
   * @param reservation_no
   * @return
   */
  public ReservationVO reservation_read(int reservation_no) {
    return reservationMapper.reservation_read(reservation_no);
  }
  
  /**
   * 삭제
   * @param reservation_no
   */         
  public void reservation_delete(int reservation_no) {
    reservationMapper.reservation_delete(reservation_no);
  }

  /**
   * 관리자용 예약 목록
   * @return
   */
  public List<ReservationVO> reservation_list_admin(RowBounds rowBounds) {
    return reservationMapper.reservation_list_admin(rowBounds);
  }
  
  //관리자용 예약목록 페이징
  public int getReservationAdminCnt() {
      return reservationMapper.getReservationAdminCnt();
  }

}
