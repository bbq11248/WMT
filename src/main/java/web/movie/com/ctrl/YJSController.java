package web.movie.com.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.movie.com.dto.MemberDto;
import web.movie.com.dto.MovieDto;
import web.movie.com.model.IMemberService;
@Controller
public class YJSController {
	
	
	@Autowired
	IMemberService memberServie;
	
	@RequestMapping(value="/regist.do", method=RequestMethod.GET)
	public String signupMember(MemberDto dto, MovieDto mdto) {
		int signup = memberServie.signupMember(dto, mdto);
		System.out.println(signup);
		return null;
	}
	
	@RequestMapping(value="/memupdate.do", method=RequestMethod.GET)
	public String updateMem(MemberDto mbDto) {
		return null;
	}
	
}
