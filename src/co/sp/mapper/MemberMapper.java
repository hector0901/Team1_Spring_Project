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
			"member_tel, member_email, member_zipcode, member_address1, member_address2, member_profile, member_size, member_rdate) " +
			"VALUES (member_no_seq.nextval, #{member_id}, #{member_pw}, #{member_name}, #{member_social}, #{member_nickname}, " +
			"#{member_tel}, #{member_email}, #{member_zipcode}, #{member_address1}, #{member_address2}, #{member_profile,jdbcType=VARCHAR}, #{member_size,jdbcType=NUMERIC}, sysdate)")
	void member_create(MemberVO joinMemberBean);
	

	
	//로그인
	@Select("select member_no, member_name " + 
			"from member " + 
			"where member_id=#{member_id} and member_pw=#{member_pw}")
	MemberVO getLoginmemberInfo(MemberVO tempLoginMemberBean);
	
	
	//수정
	@Select("select member_id, member_pw, member_name, member_social, member_nickname, member_tel, member_email, member_zipcode, member_address1, member_address2, member_profile " +
			"from member " +
			"where member_no = #{member_no}")
	MemberVO getupdatememberInfo(int member_no);
	
	@Update("update member " +
			"set member_pw = #{member_pw},  member_nickname = #{member_nickname}, member_tel = #{member_tel}, member_zipcode = #{member_zipcode}, member_address1 = #{member_address1}, member_address2 = #{member_address2}, member_profile = #{member_profile} " +
			"where member_no = #{member_no}")
	void updatememberInfo(MemberVO updateMemberBean);
	

	//삭제
	@Delete("delete from member where member_no = #{member_no}" )
	void deleteMemberInfo(MemberVO deleteMemberBean);
	
	@Select("select member_id, member_pw, member_name, member_social, member_nickname, member_tel, member_email, member_zipcode, member_address1, member_address2, member_profile " +
			"from member " +
			"where member_no = #{member_no}")
	MemberVO getdeletememberInfo(int member_no);

	
}