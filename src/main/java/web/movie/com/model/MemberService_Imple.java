package web.movie.com.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.movie.com.dto.MemberDto;
import web.movie.com.dto.MovieDto;
@Service
public class MemberService_Imple implements IMemberService {
	
	private Logger logger = LoggerFactory.getLogger(MemberService_Imple.class);
	@Autowired
	private IMemberDao mbDao;

	@Override
	public int signupMember(MemberDto mbDto, MovieDto mvDto) {
		logger.info("signupMember Service 실행");
		return mbDao.signupMember(mbDto, mvDto);
	}

	@Override
	public int updateMem(MemberDto mbDto) {
		logger.info("updateMem 실행");
		return mbDao.updateMem(mbDto);
	}

	@Override
	public List<MemberDto> selectMem(MemberDto mbDto) {
		logger.info("selectMem 실행");
		return mbDao.selectMem(mbDto);
	}

	@Override
	public boolean checkMem(String id) {
		logger.info("checkMem 실행");
		return mbDao.checkMem(id);
	}

	@Override
	public boolean selectId(MemberDto mbDto) {
		logger.info("seletId 실행");
		return mbDao.selectId(mbDto);
	}

	@Override
	public boolean sendPw(MemberDto mbDto) {
		logger.info("sendPw 실행");
		return mbDao.sendPw(mbDto);
	}

	@Override
	public MemberDto selectMemOne(String id) {
		logger.info("selectMemOne 실행");
		return mbDao.selectMemOne(id);
	}

}
