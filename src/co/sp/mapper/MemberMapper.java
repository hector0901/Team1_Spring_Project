package co.sp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import co.sp.beans.AdminVO;
import co.sp.beans.MemberVO;

public interface MemberMapper {
	
	// ID 중복체크
	@Select("SELECT member_id " +
			       "FROM member " +
			       "WHERE member_id = #{member_id}")
	String checkMemberIdExist(String member_id);
	
	// 회원 등록 
	@Insert("INSERT INTO member(member_no, member_id, member_pw, member_name, member_social, member_nickname, " +
			"member_tel, member_email, member_zipcode, member_address1, member_address2, member_profile, member_rdate) " +
			"VALUES (member_no_seq.nextval, #{member_id}, #{member_pw}, #{member_name}, #{member_social}, #{member_nickname}, " +
			"#{member_tel}, #{member_email}, #{member_zipcode}, #{member_address1}, #{member_address2}, #{member_profile,jdbcType=VARCHAR}, sysdate)")
	void member_create(MemberVO joinMemberBean);
	
	/**
     * 회원목록
     * @return
     */
    @Select("SELECT member_no, member_id, member_profile, member_nickname, member_email, member_tel, member_rdate " + 
            "FROM member " +
            "ORDER BY member_no ")
    List<MemberVO> member_list(RowBounds rowBounds);
    
    //회원 목록 페이징
    @Select("SELECT member_no, member_id, member_profile, member_nickname, member_email, member_tel, member_rdate " +
            "FROM member " +
            "where member_no = #{member_no}")
    MemberVO getMemberInfo(int member_no);
    
    @Select("select count(*) from member")
    int getMemberCnt();
	
	//수정
	@Select("select member_id, member_pw, member_name, member_social, member_nickname, member_tel, member_email, member_zipcode, member_address1, member_address2, member_profile " +
			"from member " +
			"where member_no = #{member_no}")
	MemberVO getupdatememberInfo(int member_no);
	
	@Update("update member " +
			"set member_pw = #{member_pw},  member_nickname = #{member_nickname}, member_tel = #{member_tel}, member_zipcode = #{member_zipcode}, member_address1 = #{member_address1}, member_address2 = #{member_address2} " +
			"where member_no = #{member_no}")
	void updatememberInfo(MemberVO updateMemberBean);
	

	//삭제
	@Delete("delete from member where member_no = #{member_no}" )
	void deleteMemberInfo(MemberVO deleteMemberBean);
	
	@Select("select member_id, member_pw, member_name, member_social, member_nickname, member_tel, member_email, member_zipcode, member_address1, member_address2, member_profile " +
			"from member " +
			"where member_no = #{member_no}")
	MemberVO getdeletememberInfo(int member_no);

	// 로그인
	@Select("select member_no, member_name " + "from member "
			+ "where member_id=#{member_id} and member_pw=#{member_pw}")
	MemberVO getLoginmemberInfo(MemberVO tempLoginMemberBean);
	
	
	/**
	 * id 및 email 일치시 pw값 반환 
	 * @param tempPWBean
	 * @return
	 */
	@Select("select member_id, member_pw " + 
            "from member " + 
            "where member_name = #{member_name} and member_email = #{member_email} " )
    MemberVO getPWInfo(MemberVO tempPWBean);
         
    
		

	
}