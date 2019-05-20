package web.movie.com.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
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
	public int signupMember(MemberDto mbDto, MovieDto mvDto) {
		logger.info("회원가입");
		int i = sqlSession.insert(NS+"insertMem",mbDto);
		int n = sqlSession.insert(NS+"insertMil",mvDto);
		return i+n;
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
	public boolean selectId(MemberDto mbDto) {
		logger.info("아이디찾기");
		int n = sqlSession.selectOne(NS+"selectId", mbDto);
		return n>0? true:false;
	}

	@Override
	public boolean sendPw(MemberDto mbDto) {
		logger.info("비밀번호 재발송");
		int i = sqlSession.update(NS+"updatePw", mbDto);
		int n = sqlSession.selectOne(NS+"seletPw", mbDto);
		return ((i+n)>0)?true:false;
	}

	@Override
	public MemberDto selectMemOne(String id) {
		logger.info("회원정보 확인");
		MemberDto mbDto = null;
		mbDto =sqlSession.selectOne(NS+"selectMemOne",id);
		return mbDto;
	}

}
