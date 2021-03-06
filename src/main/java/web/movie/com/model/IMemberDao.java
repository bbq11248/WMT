package web.movie.com.model;

import java.util.List;
import java.util.Map;

import web.movie.com.dto.MemberDto;
import web.movie.com.dto.MovieDto;

public interface IMemberDao {

	
	//a회원가입
		//a회원가입시 등록될 마일리지
		public int signupMember(MemberDto mbDto, String id);
//		public int insertMem(MemberDto dto);
//		public int insertMail(MovieDto dto);
		
//		로그인
		public MemberDto memLogin(MemberDto mbDto);
		
		//a정보수정
		public int updateMem(MemberDto mbDto);
		
		//a전체 회원 보기
		public List<MemberDto> selectMem(MemberDto mbDto);
		
		//a아이디 중복체크
		public boolean checkMem(String id);
		
		//a아이디 찾기
		public String selectId(Map<String, Object> map);
		
		//a비밀번호 재발송 
		public String sendPw(MemberDto mbDto, int birthday);
//		public boolean updatePw(MemberDto mbDdto);
//		public boolean selectPw(MemberDto mbDdto);
		
		//a회원정보 확인
		public MemberDto selectMemOne(String id);
		
}
