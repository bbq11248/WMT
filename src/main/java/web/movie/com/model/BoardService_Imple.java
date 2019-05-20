package web.movie.com.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import web.movie.com.dto.BoardDto;

public class BoardService_Imple implements IBoardService {
	
	
	private Logger logger = LoggerFactory.getLogger(MemberService_Imple.class);
	@Autowired
	private IBoardDao bDao;

	@Override
	public List<BoardDto> selectList() {
		logger.info("selectList 실행");
		return bDao.selectList();
	}

	@Override
	public BoardDto selectOneList(String seq) {
		logger.info("selectOneList 실행");
		return bDao.selectOneList(seq);
	}

	@Override
	public boolean insertBoard(BoardDto dto) {
		logger.info("insertBoard 실행");
		return bDao.insertBoard(dto);
	}

	@Override
	public boolean updateBoard(BoardDto dto) {
		logger.info("updateBoard 실행");
		return bDao.updateBoard(dto);
	}

	@Override
	public boolean deleteBoard(String seq) {
		logger.info("deleteBoard 실행");
		return bDao.deleteBoard(seq);
	}

}
