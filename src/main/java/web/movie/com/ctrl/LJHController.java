package web.movie.com.ctrl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import web.movie.com.dto.MovieDto;
import web.movie.com.model.IMovieService;

@Controller
public class LJHController {
	
	private Logger logger = LoggerFactory.getLogger(LJHController.class);
	
	@Autowired
	IMovieService movieService;
	
	@RequestMapping(value="/mileageChk.do", method=RequestMethod.GET)
	public String selectMileage(String id, Model model) {
		logger.info("LJHController selectMileage 실행");
		int mileage = movieService.selectMileage(id);
		System.out.println(mileage);
		model.addAttribute("mileage", mileage);
		return "mileage";
	}
	
	@RequestMapping(value="/mileageForm.do", method=RequestMethod.GET)
	public String pa() {
		return "milagerCG";
	}
	
	
	@RequestMapping(value="/mileage.do", method=RequestMethod.GET)
	public String mileage(MovieDto mvDto, HttpServletRequest request, HttpServletResponse response, String milageCG) {
		mvDto.setId("wlstnr7833");
		mvDto.setPrice(Integer.parseInt(milageCG));
		int mileageCg = movieService.mileage(mvDto);
		System.out.println(mileageCg);
		String text = milageCG;
		System.out.println(text);
		return "main";
	}
	
	@RequestMapping(value="/payList.do", method=RequestMethod.GET)
	public String selectPayList(String id, Model model){
		MovieDto mvDto = new MovieDto();
		mvDto.setId("wlstnr7833");
		List<MovieDto> lists = movieService.selectPayList(mvDto.getId());
		System.out.println(lists.get(0).getPayment_no()+"**********************************************");
		model.addAttribute("lists", lists);
		return "payList";
	}
	
	@RequestMapping(value="/ticketList.do", method=RequestMethod.GET)
	public String selectTicket(String id, Model model){
		MovieDto mvDto = new MovieDto();
		mvDto.setId("JINSOOK");
		List<MovieDto> lists = movieService.selectTicket(mvDto.getId());
		model.addAttribute("lists", lists);
		System.out.println(lists);
		return "ticketList";
	}
	
	@RequestMapping(value="/detailTicket.do", method=RequestMethod.GET)
	public String detailTicket(Map<String, String> map, Model model){
		map.put("id", "JINSOOK");
		map.put("ticketing_no", "TN22");
		MovieDto mvDto = movieService.selectOneTicket(map);
		model.addAttribute("mvDto", mvDto);
		System.out.println(mvDto);
		return "detailTicket";
	}
	
	
	@RequestMapping(value="/cancel.do", method=RequestMethod.GET)
	public String cancel(MovieDto mvDto, String ticketing_no) {
		int n = movieService.cancel(mvDto, ticketing_no);
		System.out.println(n);
		return null;
	}
	
	@RequestMapping(value="/playMovie.do", method=RequestMethod.GET)
	public String selPlayMovie (Model model) {
		List<MovieDto> lists = movieService.selPlayMovie();
		model.addAttribute("movielist", lists);
		System.out.println(lists);
		return "playMovie";
	}
	
	@ResponseBody
	@RequestMapping(value="/theaterChk.do", method=RequestMethod.GET)
	public Map<String,List<MovieDto>> selAllTheater(String movie_no, Model model, HttpSession session) {
		logger.info("selAllTheater {}" + movie_no);
		List<MovieDto> lists = movieService.selAllTheater(movie_no);
		for(int i= 0 ; i < lists.size() ;i++) 
			lists.get(i).setMovie_no(movie_no);
//		model.addAttribute("theaterList", lists);		
		Map<String,List<MovieDto>> theater = new HashMap<String,List<MovieDto>>();
		System.out.println(lists);
		session.setAttribute("movie_no", movie_no);
		theater.put("theater", lists);
		return theater;
	}
	
	@ResponseBody
	@RequestMapping(value="/movieTheaterChk.do", method=RequestMethod.GET)
	public Map<String,List<MovieDto>> selAllMTheater(String theater_no,String movie_no, Model model, HttpSession session) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("movie_no", movie_no);
		map.put("theater_no", theater_no);
		List<MovieDto> lists = movieService.selAllMTheater(map);
//		model.addAttribute("movieTheaterList", lists);
		Map<String,List<MovieDto>> movieTheater = new HashMap<String,List<MovieDto>>();
		System.out.println(lists);
		session.setAttribute("theater_no", theater_no);
		movieTheater.put("movieTheater", lists);
		return movieTheater;
	}
	
	@ResponseBody
	@RequestMapping(value="/seatChk.do", method=RequestMethod.GET)
	public Map<String,List<MovieDto>> selAllSeat(String movie_play_no, Model model, HttpSession session) {
		List<MovieDto> lists = movieService.selAllSeat(movie_play_no);
		Map<String,List<MovieDto>> seat = new HashMap<String,List<MovieDto>>();
		System.out.println(lists);
		session.setAttribute("movie_play_no", movie_play_no);
		seat.put("seat", lists);
		return seat;
	}
	
	@ResponseBody
	@RequestMapping(value="/seatMoneyChk.do", method=RequestMethod.GET)
	public Map<String, Integer> selSeatMoney(String rowcol, String movie_theater_no, Model model, HttpSession session) {
		Map<String,	String> map = new HashMap<String, String>();
		map.put("rowcol", rowcol);
		map.put("movie_theater_no", movie_theater_no);
		int price = movieService.selSeatMoney(map);
		Map<String, Integer> seatMoney = new HashMap<String, Integer>();
		System.out.println(price);
		session.setAttribute("rowcol", rowcol);
		session.setAttribute("movie_theater_no", movie_theater_no);
		seatMoney.put("seatMoney", price);
		return seatMoney;
	}
	
	@RequestMapping(value="/ticketing.do", method=RequestMethod.GET)
	public String ticketing(MovieDto mvDto, String movie_play_no, String id, String rowcol, Model model) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("movie_play_no", movie_play_no);
		map.put("id", id);
		map.put("seat_no", rowcol);
		int n = movieService.ticketing(map, mvDto);
		List<MovieDto> lists = movieService.selectTicket(mvDto.getId());
		model.addAttribute("lists", lists);
		System.out.println(n);
		return "ticketList";
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
	@RequestMapping(value="/theater_manager.do", method= RequestMethod.GET)
	public String theater_manager() {
		return "theater_manager";
	}
	
	@RequestMapping(value="/insertTForm.do", method= RequestMethod.GET)
	public String insertTheaterForm() {
		return "insertTheaterForm";
	}
	@RequestMapping(value="/insertT.do", method=RequestMethod.GET)
	public String insertTheater(String theater_name, String theater_local) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("theater_name", theater_name);
		map.put("theater_local", theater_local);
		int n = movieService.insertTheater(map);
		System.out.println(n);
		return null;
	}
	
	@RequestMapping(value="/updateT.do", method=RequestMethod.GET)
	public String updateTheater(String theater_no, String theater_name, String theater_local) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("theater_no", theater_no);
		map.put("theater_name", theater_name);
		map.put("theater_local", theater_local);
		int n = movieService.updateTheater(map);
		System.out.println(n);
		return null;
	}

	@RequestMapping(value="/selT.do", method=RequestMethod.GET)
	public String selectTheater(Model model) {
		List<MovieDto> lists = movieService.selectTheater();
		model.addAttribute("lists", lists);
		System.out.println(lists);
		return "theater_list";
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
	
	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public String main() {
		return "main";
	}
	
	
	
	
	
	
}
