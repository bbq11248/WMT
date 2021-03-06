package web.movie.com.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web.movie.com.dto.MemberDto;
import web.movie.com.dto.MovieDto;
@Repository
public class MemberDao_Imple implements IMemberDao {

	private Logger logger = LoggerFactory.getLogger(MemberDao_Imple.class);
	private final String NS = "web.movie.com.mem_statment.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
//	전달받은 비밀번호 암호화 처리.
//	@Autowired
//	private PasswordEncoder passwordEncoder;
	
//		비밀번호 암호화 처리를 위한.
//		String encodePw = passwordEncoder.encode(dto.getPw());
//		dto.setPw(encodePw);
	
	
	@Override
	public int signupMember(MemberDto mbDto, String id) {
		logger.info("회원가입");
		int i = sqlSession.insert(NS+"insertMem",mbDto);
		int n = sqlSession.insert(NS+"insertMil",id);
		return i+n;
	}
	
	@Override
	public MemberDto memLogin(MemberDto mbDto) {
		logger.info("로그인");
		MemberDto mbd = sqlSession.selectOne(NS+"memLogin", mbDto);
		return mbd;
	}
	
	
	@Override
	public int updateMem(MemberDto mbDto) {
		logger.info("회원수정");
		int i = sqlSession.update(NS+"updateMem", mbDto);
		return i;
	}

	@Override
	public List<MemberDto> selectMem(MemberDto mbDto) {
		logger.info("회원전체보기");
		List<MemberDto> list = sqlSession.selectList(NS+"selectMem", mbDto);
		return list;
	}

	@Override
	public boolean checkMem(String id) {
		logger.info("아이디중복체크");
		int n = sqlSession.selectOne(NS+"checkMem", id);
		return n>0? true:false;
	}

	@Override
	public String selectId(Map<String, Object> map) {
		logger.info("아이디찾기");
		String n = sqlSession.selectOne(NS+"selectId", map);
		return n;
	}

	@Override
	public String sendPw(MemberDto mbDto, int birthday) {
		logger.info("비밀번호 재발송");
		int i = sqlSession.update(NS+"updatePw", mbDto);
		String n = sqlSession.selectOne(NS+"selectPw", birthday);
		return (i>0)?n:"실패";
	}

	@Override
	public MemberDto selectMemOne(String id) {
		logger.info("회원정보 확인");
		MemberDto mbDto = null;
		mbDto =sqlSession.selectOne(NS+"selectMemOne",id);
		return mbDto;
	}

}
