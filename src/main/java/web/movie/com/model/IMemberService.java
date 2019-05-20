package web.movie.com.model;

import java.util.List;

import web.movie.com.dto.MemberDto;
import web.movie.com.dto.MovieDto;

public interface IMemberService {
	
	//a회원가입
	//a회원가입시 등록될 마일리지
	public int signupMember(MemberDto mbDto, MovieDto mvDto);
//	public int insertMem(MemberDto dto);
//	public int insertMail(MovieDto dto);
	
	//a정보수정
	public int updateMem(MemberDto mbDto);
	
	//a전체 회원 보기
	public List<MemberDto> selectMem(MemberDto mbDto);
	
	//a아이디 중복체크
	public boolean checkMem(String id);
	
	//a아이디 찾기
	public boolean selectId(MemberDto mbDto);
	
	//a비밀번호 재발송 다오에서 리턴에 updatePw가 성공한다면 새로운걸 보내주고..selectPw로 확인
	public boolean sendPw(MemberDto mbDto);
//	public boolean updatePw(MemberDto dto);
//	public boolean selectPw(MemberDto dto);
	
	//a회원정보 확인
	public MemberDto selectMemOne(String id);


}
