package co.sp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import co.sp.beans.ReservationVO;

public interface ReservationMapper {
  
  /**
   * 예약
   * @param reservationBean
   */
  @Insert("INSERT INTO reservation(reservation_no, member_no, shop_no, reservation_rdate, reservation_date, reservation_time, reservation_person, reservation_add) " +
          "VALUES (reservation_no_seq.nextval, #{member_no}, #{shop_no}, sysdate, #{reservation_date}, #{reservation_time}, #{reservation_person}, #{reservation_add,jdbcType=VARCHAR} )"
         )
  void reservation(ReservationVO reservationBean);
  
  /**
   * 회원번호 기준 예약 목록
   * 예약번호 기준 내림차순
   * @param member_no
   * @return
   */
  @Select("SELECT r.reservation_no, s.shop_name, r.reservation_date, reservation_time, reservation_person, r.reservation_rdate " +
          "FROM reservation r, member m, shop s " +
          "WHERE r.member_no = m.member_no AND r.shop_no = s.shop_no AND r.member_no = #{member_no} " +
          "ORDER BY r.reservation_no DESC ")
  List<ReservationVO> reservation_list(int member_no, RowBounds rowBounds);
  
  @Select("select count(*) from reservation")
  int getReservationCnt();
  
  
  /**
   * 예약번호 기준 상세 조회
   * @param reservation_no
   * @return
   */
  @Select(" SELECT m.member_name, m.member_tel, " + 
          " r.reservation_no, r.reservation_date, reservation_time, reservation_person, r.reservation_rdate, " +
          " s.shop_name, s.map " + 
          " FROM reservation r, member m, shop s " + 
          " WHERE r.member_no = m.member_no AND r.shop_no = s.shop_no AND r.reservation_no = #{reservation_no} ") 
  ReservationVO reservation_read(int reservation_no);

  /**
   * 예약번호 기준 삭제
   * @param reservation_no
   */
  @Delete("delete from reservation where reservation_no=#{reservation_no} ")
  void reservation_delete(int reservation_no);

}
