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
   * ���� ���
   * @param reservationBean
   */
  public void reservation(ReservationVO reservationBean) {
    reservationMapper.reservation(reservationBean);
  }
  
  /**
   * ���� ���
   * @param member_no
   * @return
   */
  public List<ReservationVO> reservation_list(int member_no, RowBounds rowBounds) {
    return reservationMapper.reservation_list(member_no, rowBounds);
  }
  
  //����������¡
  public int getReservationCnt() {
	  return reservationMapper.getReservationCnt();
  }
  /**
   * ���� ����ȸ
   * @param reservation_no
   * @return
   */
  public ReservationVO reservation_read(int reservation_no) {
    return reservationMapper.reservation_read(reservation_no);
  }
  
  /**
   * ����
   * @param reservation_no
   */         
  public void reservation_delete(int reservation_no) {
    reservationMapper.reservation_delete(reservation_no);
  }

  /**
   * �����ڿ� ���� ���
   * @return
   */
  public List<ReservationVO> reservation_list_admin(RowBounds rowBounds) {
    return reservationMapper.reservation_list_admin(rowBounds);
  }
  
  //�����ڿ� ������ ����¡
  public int getReservationAdminCnt() {
      return reservationMapper.getReservationAdminCnt();
  }

}
