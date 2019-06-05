package web.movie.com.model;

import java.util.List;
import java.util.Map;

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
	public int signupMember(MemberDto mbDto, String id) {
		logger.info("signupMember Service 실행");
		return mbDao.signupMember(mbDto, id);
	}

	@Override
	public MemberDto memLogin(MemberDto mbDto) {
		logger.info("memLogin Service 실행");
		return mbDao.memLogin(mbDto);
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
	public String selectId(Map<String, Object> map) {
		logger.info("seletId 실행");
		return mbDao.selectId(map);
	}

	@Override
	public String sendPw(MemberDto mbDto, int birthday) {
		logger.info("sendPw 실행");
		return mbDao.sendPw(mbDto, birthday);
	}

	@Override
	public MemberDto selectMemOne(String id) {
		logger.info("selectMemOne 실행");
		return mbDao.selectMemOne(id);
	}

}
