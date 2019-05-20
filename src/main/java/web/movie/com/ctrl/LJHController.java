package web.movie.com.ctrl;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.movie.com.dto.MovieDto;
import web.movie.com.model.IMovieService;

@Controller
public class LJHController {
	
	@Autowired
	IMovieService movieService;
	
	@RequestMapping(value="/mileageChk.do", method=RequestMethod.GET)
	public String selectMileage(String id) {
		int mileage = movieService.selectMileage(id);
		System.out.println(mileage);
		return null;
	}
	
	@RequestMapping(value="/mileage.do", method=RequestMethod.GET)
	public int mileage(MovieDto mvDto) {
		int mileageCg = movieService.mileage(mvDto);
		System.out.println(mileageCg);
		return 0;
	}
	
	@RequestMapping(value="/payList.do", method=RequestMethod.GET)
	public List<MovieDto> selectPayList(String id){
		List<MovieDto> lists = movieService.selectPayList(id);
		System.out.println(lists.get(0).getPayment_no()+"**********************************************");
		return null;
	}
	
	
	
	
}
