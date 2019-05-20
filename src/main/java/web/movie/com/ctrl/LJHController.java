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
	public String mileage(MovieDto mvDto) {
		int mileageCg = movieService.mileage(mvDto);
		System.out.println(mileageCg);
		return null;
	}
	
	@RequestMapping(value="/payList.do", method=RequestMethod.GET)
	public String selectPayList(String id){
		List<MovieDto> lists = movieService.selectPayList(id);
		System.out.println(lists.get(0).getPayment_no()+"**********************************************");
		return null;
	}
	
	@RequestMapping(value="/ticketList.do", method=RequestMethod.GET)
	public String selectTicket(String id){
		List<MovieDto> lists = movieService.selectTicket(id);
		System.out.println(lists);
		return null;
	}
	
	@RequestMapping(value="/detailTicket.do", method=RequestMethod.GET)
	public String detailTicket(Map<String, String> map){
		map.put("id", "JINSOOK");
		map.put("ticketing_no", "TN21");
		MovieDto mvDto = movieService.selectOneTicket(map);
		System.out.println(mvDto);
		return null;
	}
	
	@RequestMapping(value="/ticketing.do", method=RequestMethod.GET)
	public String ticketing(MovieDto mvDto, Map<String, String> map) {
		map.put("movie_play_no", "MPN1");
		map.put("id", "JINSOOK");
		map.put("seat_no", "A1");
		int n = movieService.ticketing(map, mvDto);
		System.out.println(n);
		return null;
	}
	
	@RequestMapping(value="/cancel.do", method=RequestMethod.GET)
	public String cancel(MovieDto mvDto, String ticketing_no) {
		int n = movieService.cancel(mvDto, ticketing_no);
		System.out.println(n);
		return null;
	}
	
	
	
}
