package web.movie.com.ctrl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import web.movie.com.dto.BoardDto;
import web.movie.com.dto.MemberDto;
import web.movie.com.dto.MovieDto;
import web.movie.com.model.IBoardService;
import web.movie.com.model.IMemberService;
@Controller
public class YJSController {
	
	
	Logger logger = LoggerFactory.getLogger(YJSController.class);
	
	@Autowired
	IMemberService memberService;
	
	@Autowired
	IBoardService boardService;
	
//	=================================================================
//	=================================================================
//	회원
	
	@RequestMapping(value="/signupForm.do", method=RequestMethod.GET)
	public String signupForm() {
		return "signUp";
	}
	
	@RequestMapping(value="/regist.do", method=RequestMethod.GET)
	public String signupMember(String id, String pw, String name, String nickname, int birthday, int phone, String address, String email) {
		/*	MemberDto mbDto, MovieDto mvDto
		 * int signup = memberService.signupMember(mbDto, mvDto);
			System.out.println(signup);*/
		MemberDto mbDto = new MemberDto();
		mbDto.setId(id);
		mbDto.setPw(pw);
		mbDto.setName(name);
		mbDto.setNickname(nickname);
		mbDto.setBirthday(birthday);
		mbDto.setPhone(phone);
		mbDto.setAddress(address);
		mbDto.setEmail(email);
		
//		moviedto mvdto = new moviedto();
//		int mileage;
//		mvdto.setmileage(mileage);
		
		int sign = memberService.signupMember(mbDto, id);
		logger.info("signupMember");
			return "loginForm";
		}
	
	
//	@requestmapping(value = "/signup.do", method = requestmethod.post)
//	public string signup(member_dto dto) {
//		boolean isc = imember.signupmember(dto);
//		logger.info("controller signup{} // {}", isc, new date());
//		return isc ? "redirect:/loginform.do" : "redirect/signupform.do";
//	}
	
	@RequestMapping(value="/loginCheck.do", method=RequestMethod.POST, produces="application/text;charset=UTF-8")
	@ResponseBody
	public String loginCheck(MemberDto mbDto, HttpSession session) {
		MemberDto memberLogin = memberService.memLogin(mbDto);
		String chk = (memberLogin == null) ? "실패":"성공"; 
		if(chk=="성공") {
			session.setAttribute("memberLogin", memberLogin);
			return "성공";
		} else {
			return "실패";
		}
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String memLogin(HttpSession session, Model model) {
		MemberDto memberLogin = (MemberDto)session.getAttribute("memberLogin");
		model.addAttribute("memberlogin",memberLogin);
		return "loginMain";
	}
	
	@RequestMapping(value="/loginForm.do", method=RequestMethod.GET)
	public String loginForm() {
		return "loginForm";
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
	
	
	
//	==================================================================
//	==================================================================
	
//	@REQUESTMAPPING(VALUE="/LOGINFORM.DO", METHOD=REQUESTMETHOD.GET)
//	PUBLIC STRING LOGIN(MEMBERDTO MBDTO) {
//		RETURN "LOGINFORM";
//	}
	
	
	
	@RequestMapping(value="/TopMeun.do", method=RequestMethod.GET)
	public String header() {
		return "TopMenu";
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










