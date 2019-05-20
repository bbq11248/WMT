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
	public int signupMember(MemberDao_Imple dto, MovieDto mdto) {
		logger.info("signupMember Service 실행");
		return mbDao.signupMember(dto, mdto);
	}

	@Override
	public int updateMem(MemberDto dto) {
		logger.info("updateMem 실행");
		return mbDao.updateMem(dto);
	}

	@Override
	public List<MemberDto> selectMem(MemberDto dto) {
		logger.info("selectMem 실행");
		return mbDao.selectMem(dto);
	}

	@Override
	public boolean checkMem(String id) {
		logger.info("checkMem 실행");
		return mbDao.checkMem(id);
	}

	@Override
	public boolean selectId(MemberDto dto) {
		logger.info("seletId 실행");
		return mbDao.selectId(dto);
	}

	@Override
	public boolean sendPw(MemberDto dto) {
		logger.info("sendPw 실행");
		return mbDao.sendPw(dto);
	}

	@Override
	public MemberDto selectMemOne(String id) {
		logger.info("selectMemOne 실행");
		return mbDao.selectMemOne(id);
	}

}
