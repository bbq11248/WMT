package web.movie.com.ctrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.movie.com.dto.BoardDto;
import web.movie.com.dto.MemberDto;
import web.movie.com.dto.MovieDto;
import web.movie.com.model.IBoardService;
import web.movie.com.model.IMemberService;
@Controller
public class YJSController {
	
	
	@Autowired
	IMemberService memberService;
	
	@Autowired
	IBoardService boardService;
	
//	=================================================================
//	=================================================================
//	회원
	
	@RequestMapping(value="/regist.do", method=RequestMethod.GET)
	public String signupMember(MemberDto dto, MovieDto mdto) {
		int signup = memberService.signupMember(dto, mdto);
		System.out.println(signup);
		return null;
	}
	
	@RequestMapping(value="/memupdate.do", method=RequestMethod.GET)
	public String updateMem(MemberDto mbDto) {
		int modifyMem = memberService.updateMem(mbDto);
		System.out.println(modifyMem);
		return null;
	}
	
	@RequestMapping(value="/memberList.do", method=RequestMethod.GET)
	public String selectMem(MemberDto mbDto) {
		List<MemberDto> lists = memberService.selectMem(mbDto);
		System.out.println(lists);
		return null;
	}
	
	@RequestMapping(value="/memberInfo.do", method=RequestMethod.GET)
	public String checkMem(String id) {
		boolean checkId = memberService.checkMem(id);
		System.out.println(checkId);
		return null;
	}
	
	@RequestMapping(value="/memberId.do", method=RequestMethod.GET)
	public String selectId(MemberDto mbDto) {
		String findId = memberService.selectId(mbDto);
		System.out.println(findId);
		return null;
	}
	
	@RequestMapping(value="/password.do", method=RequestMethod.GET)
	public String sendPw(MemberDto mbDto) {
		String updatePw = memberService.sendPw(mbDto);
		System.out.println(updatePw);
		return null;
		
	}
	
	@RequestMapping(value="/info.do", method=RequestMethod.GET)
	public String selectMemOne(String id) {
		MemberDto selectOne = memberService.selectMemOne(id);
		System.out.println(selectOne);
		return null;
	}
	
	
	
	
//	=================================================================
//	=================================================================
//	게시판	
	
	@RequestMapping(value="/board.do", method=RequestMethod.GET)
	public String selectList() {
		List<BoardDto> lists = boardService.selectList();
		System.out.println(lists);
		return null;
	}
	
	@RequestMapping(value="/oneBoard.do", method=RequestMethod.GET)
	public String selectOneList(String seq) {
		BoardDto oneBoard = boardService.selectOneList(seq);
		System.out.println(oneBoard);
		return null;
	}
	
	@RequestMapping(value="/insertBoard.do", method = RequestMethod.GET)
	public String insertBoard(BoardDto bDto) {
		boolean insertOne = boardService.insertBoard(bDto);
		System.out.println(insertOne);
		return null;
	}
	
	@RequestMapping(value="/updateBoard.do", method = RequestMethod.GET)
	public String updateBoard(BoardDto bDto) {
		boolean updateOne = boardService.updateBoard(bDto);
		System.out.println(updateOne);
		return null;
	}
	
	@RequestMapping(value="/deleteBoard.do", method = RequestMethod.GET)
	public String deleteBoard(String seq) {
		boolean deleteBoard = boardService.deleteBoard(seq);
		System.out.println(deleteBoard);
		return null;
	}
	
}










