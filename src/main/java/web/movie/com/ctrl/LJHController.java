package web.movie.com.ctrl;

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
	
	@RequestMapping(value="/playMovie.do", method=RequestMethod.GET)
	public String selPlayMovie () {
		List<MovieDto> lists = movieService.selPlayMovie();
		System.out.println(lists);
		return null;
	}
	
	@RequestMapping(value="/theaterChk.do", method=RequestMethod.GET)
	public String selAllTheater(String movie_no) {
		List<MovieDto> lists = movieService.selAllTheater(movie_no);
		System.out.println(lists);
		return null;
	}
	
	@RequestMapping(value="/movieTheaterChk.do", method=RequestMethod.GET)
	public String selAllMTheater(Map<String, String> map) {
		map.put("movie_no", "MN7");
		map.put("theater_no", "TN5");
		List<MovieDto> lists = movieService.selAllMTheater(map);
		System.out.println(lists);
		return null;
	}
	
	@RequestMapping(value="/seatChk.do", method=RequestMethod.GET)
	public String selAllSeat(String movie_play_no) {
		List<MovieDto> lists = movieService.selAllSeat(movie_play_no);
		System.out.println(lists);
		return null;
	}
	
	@RequestMapping(value="/seatMoneyChk.do", method=RequestMethod.GET)
	public String selSeatMoney(Map<String, String> map) {
		map.put("rowcol", "A1");
		map.put("movie_theater_no", "MTN4");
		int price = movieService.selSeatMoney(map);
		System.out.println(price);
		return null;
	}

	
//상영관 관리
	@RequestMapping(value="/insertMT.do", method=RequestMethod.GET)
	public String insertMovieT(Map<String, String> map) {
		map.put("theater_no", "TN21");
		map.put("movie_theater_name", "1관");
		int n = movieService.insertMovieT(map);
		System.out.println(n);
		return null;
	}
	
	@RequestMapping(value="/updateMT.do", method=RequestMethod.GET)
	public String updateMovieT(Map<String, String> map) {
		map.put("movie_theater_name", "1관");
		map.put("movie_theater_no", "MTN41");
		int n = movieService.updateMovieT(map);
		System.out.println(n);
		return null;
	}
	
	@RequestMapping(value="/listMT.do", method=RequestMethod.GET)
	public String selectMovieT() {
		List<MovieDto> lists = movieService.selectMovieT();
		System.out.println(lists);
		return null;
	}
	
	@RequestMapping(value="/detailMT.do", method=RequestMethod.GET)
	public String detailMovieT(String movie_theater_no) {
		MovieDto mvDto = movieService.detailMovieT(movie_theater_no);
		System.out.println(mvDto);
		return null;
	}
	
	//좌석
	@RequestMapping(value="/insertSeat.do", method=RequestMethod.GET)
	public String insertSeat(MovieDto mvDto) {
		int n = movieService.insertSeat(mvDto);
		System.out.println(n);
		return null;
	}
	
	@RequestMapping(value="/selSeat.do", method=RequestMethod.GET)
	public String selSeat(String seat) {
		List<MovieDto> lists = movieService.selSeat(seat);
		System.out.println(lists);
		return null;
	}
	
	@RequestMapping(value="/updateSeat.do", method=RequestMethod.GET)
	public String updateSeat(MovieDto mvDto) {
		int n = movieService.updateSeat(mvDto);
		System.out.println(n);
		return null;
	}
	
	//영화관
	@RequestMapping(value="/insertT.do", method=RequestMethod.GET)
	public String insertTheater(Map<String, String> map) {
		map.put("theater_name", "죽전CGV");
		map.put("theater_local", "경기도 용인시 수지구 죽전동 1285");
		int n = movieService.insertTheater(map);
		System.out.println(n);
		return null;
	}
	
	@RequestMapping(value="/updateT.do", method=RequestMethod.GET)
	public String updateTheater(Map<String, String> map) {
		map.put("theater_no", "TN21");
		map.put("theater_name", "죽죽전CGV");
		map.put("theater_local", "경기도 용인시 수지구 죽전동 1285");
		int n = movieService.updateTheater(map);
		System.out.println(n);
		return null;
	}

	@RequestMapping(value="/selT.do", method=RequestMethod.GET)
	public String selectTheater() {
		List<MovieDto> lists = movieService.selectTheater();
		System.out.println(lists);
		return null;
	}
	
	@RequestMapping(value="/selOneT.do", method=RequestMethod.GET)
	public String selectOneTheater(String theater_no) {
		List<MovieDto> lists = movieService.selectOneTheater(theater_no);
		System.out.println(lists);
		return null;
	}
	
	//영화
	@RequestMapping(value="/insertM.do", method=RequestMethod.GET)
	public String insertMovie(MovieDto mvDto) {
		int n = movieService.insertMovie(mvDto);
		System.out.println(n);
		return null;
	}
	
	@RequestMapping(value="/updateM.do", method=RequestMethod.GET)
	public String updateMovie(MovieDto mvDto) {
		int n = movieService.updateMovie(mvDto);
		System.out.println(n);
		return null;
	}
	
	@RequestMapping(value="/listM.do", method=RequestMethod.GET)
	public String selectMovie() {
		List<MovieDto> lists = movieService.selectMovie();
		System.out.println(lists);
		return null;
	}
	
	@RequestMapping(value="/oneM.do", method=RequestMethod.GET)
	public String selOneMovie(String movie_no) {
		List<MovieDto> lists = movieService.selOneMovie(movie_no);
		System.out.println(lists);
		return null;
	}
	
	
	
	
	
	
}
