package web.movie.com.model;

import java.util.List;

import web.movie.com.dto.BoardDto;

public interface IBoardService {

	//a전체글보기selectList
	public List<BoardDto> selectList();
	
	//a상세보기selectOneList
	public BoardDto selectOneList(String seq);
	
	//a글 입력insertBoard
	public boolean insertBoard(BoardDto bDto);
	
	//a글 수정updateBoard
	public boolean updateBoard(BoardDto bDto);
	
	//a글 삭제deleteBoard
	public boolean deleteBoard(String seq);
	
}
