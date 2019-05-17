package web.movie.com.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.movie.com.model.IMovieService;

@Controller
public class LJHController {
	
	@Autowired
	IMovieService movieService;
	
	@RequestMapping(value="/mileage.do", method=RequestMethod.GET)
	public String checkM(String id) {
		int mileage = movieService.selectMileage(id);
		System.out.println(mileage);
		return null;
	}
	
	
}
