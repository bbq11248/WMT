package web.movie.com.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web.movie.com.dto.BoardDto;
@Repository
public class BoardDao_Imple implements IBoardDao {
	
	private Logger logger = LoggerFactory.getLogger(BoardDao_Imple.class);
	private final String NS = "web.movie.com.board_statment.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<BoardDto> selectList() {
		logger.info("게시글전체조회");
		List<BoardDto> lists = sqlSession.selectList(NS+"selectList");
		return lists;
	}

	@Override
	public BoardDto selectOneList(String seq) {
		logger.info("게시글상세조회");
		BoardDto dto = sqlSession.selectOne(NS+"selectOneList", seq);
		return dto;
	}

	@Override
	public boolean insertBoard(BoardDto dto) {
		logger.info("글입력");
		int i = sqlSession.insert(NS+"insertBoard", dto);
		return i>0? true:false;
	}

	@Override
	public boolean updateBoard(BoardDto dto) {
		logger.info("글수정");
		int i = sqlSession.update(NS+"updateBoard", dto);
		return i>0? true:false;
	}

	@Override
	public boolean deleteBoard(String seq) {
		logger.info("글삭제");
		int i = sqlSession.delete(NS+"deleteBoard", seq);
		return i>0? true:false;
	}

}
