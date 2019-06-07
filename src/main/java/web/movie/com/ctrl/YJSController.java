package web.movie.com.ctrl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
	private IMemberService memberService;
	
	@Autowired
	private IBoardService boardService;
	
//	=================================================================
//	=================================================================
//	회원
	
	@RequestMapping(value="/signupForm.do", method=RequestMethod.GET)
	public String signupForm() {
		return "signUp";
	}

	
	@RequestMapping(value="/idCheck.do", method = RequestMethod.POST,  produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String idCheck(String id) {
		String regex = "^[a-zA-Z0-9]*$";
		// matches ~> id중복 확인을 위한 정규화표현식
		boolean isc = id.matches(regex);
		
		// 중복이면 true나옴
		boolean isc2 = memberService.checkMem(id);
		System.out.println(isc2);
		logger.info("controller idCheck{} // {}", isc2, new Date());
		return (isc2 == false) ? "사용가능한 아이디입니다." : "중복된 아이디 입니다.";
	}
	
	@RequestMapping(value="/regist.do", method=RequestMethod.POST)
	public String signupMember(String id, String pw, String passOK, String name, String nickname, int birthday, int phone, String address, String email) {
		
//		MemberDto mbDto, MovieDto mvDto
		MemberDto mbDto = new MemberDto();
		mbDto.setId(id);
		mbDto.setPw(pw);
		mbDto.setName(name);
		mbDto.setNickname(nickname);
		mbDto.setBirthday(birthday);
		mbDto.setPhone(phone);
		mbDto.setAddress(address);
		mbDto.setEmail(email);
		System.out.println("signupMember : "+mbDto);
		
		int signup = memberService.signupMember(mbDto, id);
		System.out.println("signupMember : "+ signup);
		
		
		MovieDto mvdto = new MovieDto();
		int mileage = 0;
		mvdto.setMileage(mileage);
		
			//return "redirect:/loginForm.do";
			return "redirect:/loginForm.do";
		}
	

	
//	@requestmapping(value = "/signup.do", method = requestmethod.post)
//	public string signup(member_dto dto) {zd
//		boolean isc = imember.signupmember(dto);
//		logger.info("controller signup{} // {}", isc, new date());
//		return isc ? "redirect:/loginform.do" : "redirect/signupform.do";
//	}
	
	@RequestMapping(value="/loginForm.do", method=RequestMethod.GET)
	public String loginForm() {
		return "loginForm";
	}
	
	@RequestMapping(value="/logoutForm.do", method=RequestMethod.GET)
	public String logoutForm() {
		return "logoutForm";
	}
	
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
	
	@RequestMapping(value="/btdCheck.do", method=RequestMethod.POST, produces="application/text;charset=UTF-8")
	@ResponseBody
	public String btdCheck(String birthday) {
		System.out.println(birthday +":btdCheck");
		String regex =  "^[0-9]*$";
		boolean isc = birthday.matches(regex);
		System.out.println(isc+":btdCheck");
		return (isc) ? "사용가능합니다." : "숫자만 입력해주세요.";
	}
	
	@RequestMapping(value="/pnumCheck.do", method=RequestMethod.POST,  produces="application/text;charset=UTF-8")
	@ResponseBody
	public String pnumCheck(String phone) {
		System.out.println(phone + ":pnumCheck");
		String regex = "^[0-9]*$";
		boolean isc = phone.matches(regex);
		System.out.println(isc + ":pnumCheck");
		return (isc)? "사용가능합니다." : "숫자만 입력해주세요.";
	}
	
	
	   @RequestMapping(value="/login.do", method=RequestMethod.POST)
	   public String memLogin(HttpSession session, Model model) {
	      MemberDto memberLogin = (MemberDto)session.getAttribute("memberLogin");
	      model.addAttribute("memberlogin", memberLogin);
	      if(memberLogin.getAuth() == "A") {
	         return "aMain";
	      }else if(memberLogin.getAuth() == "U") {
	         return "main";
	      }else {
	         return "error";
	      }
	   }
	
	@RequestMapping(value="/idSearchForm.do", method=RequestMethod.GET)
	public String idSearchForm() {
		return "idSearchForm";
	}
	
	@RequestMapping(value="/idSearch.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> idSearch(String name, String birthday, Model model) {
		Integer.parseInt(birthday);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("birthday", birthday);
		String idSear = memberService.selectId(map);
		model.addAttribute("id", idSear);
		Map<String, String> id = new HashMap<String, String>();
		id.put("id", idSear);
		return id;
	}
	
//	@RequestMapping(value="/pwSearch.do", method=RequestMethod.POST)
//	public String pwSearch(String id, int birthday, Model model) {
//		MemberDto mbDto = new MemberDto();
//		mbDto.setId(id);
//		mbDto.setBirthday(birthday);
//		
//		String pwSear = memberService.sendPw(mbDto, birthday);
//		return null;
//	}
//	
//	@RequestMapping(value="/pwSearch.do", method=RequestMethod.POST)
//	@ResponseBody
//	public String pwSearch(String id, String birthday, Model model) {
//		Integer.parseInt(birthday);
//		MemberDto mbDto = new MemberDto();
//		mbDto.setId(id);
//		mbDto.setBirthday(birthday);
//		String pwSear = memberService.sendPw(mbDto, birthday);
//		Map<String, Object> pw = new HashMap<String, Object>();
//		pw.put("pw", pwSear);
//		return pw;
//	}

	
	
	//비밀번호 찾기 하는중 ... ☆
//	@RequestMapping(value="/pwSearch.do", method=RequestMethod.POST)
//	@ResponseBody
//	public String pwSearch(String id, int birthday) {
//		MemberDto mbDto = new MemberDto();
//		mbDto.setId(id);
//		mbDto.setBirthday(birthday);
//		String pwSear = memberService.sendPw(mbDto, birthday);
//		Map<String, String> pw = new HashMap<String, String>();
//		pw.put("pw", pwSear);
//		return pw;
//	}
	
	
	
//	@RequestMapping(value="/memupdate.do", method=RequestMethod.GET)
//	public String updateMem(MemberDto mbDto) {
//		int modifyMem = memberService.updateMem(mbDto);
//		System.out.println(modifyMem);
//		return null;
//	}
//	
//	
//	
//	@RequestMapping(value="/memberList.do", method=RequestMethod.GET)
//	public String selectMem(MemberDto mbDto) {
//		List<MemberDto> lists = memberService.selectMem(mbDto);
//		System.out.println(lists);
//		return null;
//	}
//	
//
//	
//	
//	@RequestMapping(value="/memberId.do", method=RequestMethod.GET)
//	public String selectId(MemberDto mbDto) {
//		String findId = memberService.selectId(mbDto);
//		System.out.println(findId);
//		return null;
//	}
//	
//	
//	
//	@RequestMapping(value="/password.do", method=RequestMethod.GET)
//	public String sendPw(MemberDto mbDto) {
//		String updatePw = memberService.sendPw(mbDto);
//		System.out.println(updatePw);
//		return null;
//		
//	}
//	
//	
//	
//	@RequestMapping(value="/info.do", method=RequestMethod.GET)
//	public String selectMemOne(String id) {
//		MemberDto selectOne = memberService.selectMemOne(id);
//		System.out.println(selectOne);
//		return null;
//	}
//	
//	
	
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

}









