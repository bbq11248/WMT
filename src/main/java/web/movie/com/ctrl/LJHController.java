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

import oracle.net.aso.o;
import web.movie.com.dto.MemberDto;
import web.movie.com.dto.MovieDto;
import web.movie.com.model.IMovieService;

@Controller
public class LJHController {
	
	private Logger logger = LoggerFactory.getLogger(LJHController.class);
	
	@Autowired
	IMovieService movieService;
	
	@RequestMapping(value = "/mileageChk.do", method = RequestMethod.GET)
	public String selectMileage(String id, Model model) {
		logger.info("LJHController selectMileage 실행");
		int mileage = movieService.selectMileage(id);
		System.out.println(mileage);
		model.addAttribute("mileage", mileage);
		return "mileage";
	}
	
	@RequestMapping(value = "/mileageForm.do", method = RequestMethod.GET)
	public String pa() {
		return "milagerCG";
	}
	
	@RequestMapping(value = "/mileage.do", method = RequestMethod.GET)
	public String mileage(MovieDto mvDto, HttpServletRequest request, HttpServletResponse response, String milageCG) {
		mvDto.setId("wlstnr7833");
		mvDto.setPrice(Integer.parseInt(milageCG));
		int mileageCg = movieService.mileage(mvDto);
		System.out.println(mileageCg);
		String text = milageCG;
		System.out.println(text);
		return "main";
	}
	
	@RequestMapping(value = "/payList.do", method = RequestMethod.GET)
	public String selectPayList(String id, Model model) {
		MovieDto mvDto = new MovieDto();
		mvDto.setId(id);
		List<MovieDto> lists = movieService.selectPayList(mvDto.getId());
		System.out.println(lists.get(0).getPayment_no() + "**********************************************");
		model.addAttribute("lists", lists);
		return "payList";
	}
	
	@RequestMapping(value = "/ticketList.do", method = RequestMethod.GET)
	public String selectTicket(String id, Model model, HttpSession session) {
		MemberDto mbDto = (MemberDto)session.getAttribute("memberLogin");
		id = mbDto.getId();
		List<MovieDto> lists = movieService.selectTicket(id);
		model.addAttribute("lists", lists);
		System.out.println(lists);
		return "ticketList";
	}
	
	@RequestMapping(value = "/detailTicket.do", method = RequestMethod.GET)
	public String detailTicket(String id, String ticketing_no, Model model, HttpSession session) {
		MemberDto mbDto = (MemberDto)session.getAttribute("memberLogin");
		id = mbDto.getId();
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("ticketing_no", ticketing_no);
		MovieDto mvDto = movieService.selectOneTicket(map);
		model.addAttribute("mvDto", mvDto);
		System.out.println(mvDto);
		return "detailTicket";
	}
	
	@RequestMapping(value = "/cancel.do", method = RequestMethod.GET)
	public String cancel(MovieDto mvDto, String ticketing_no) {
		int n = movieService.cancel(mvDto, ticketing_no);
		System.out.println(n);
		return null;
	}
	
	@RequestMapping(value = "/playMovie.do", method = RequestMethod.GET)
	public String selPlayMovie(Model model) {
		List<MovieDto> lists = movieService.selPlayMovie();
		model.addAttribute("movielist", lists);
		System.out.println(lists);
		return "playMovie";
	}
	
	@ResponseBody
	@RequestMapping(value = "/theaterChk.do", method = RequestMethod.GET)
	public Map<String, List<MovieDto>> selAllTheater(String movie_no, Model model, HttpSession session) {
		logger.info("selAllTheater {}" + movie_no);
		List<MovieDto> lists = movieService.selAllTheater(movie_no);
		for (int i = 0; i < lists.size(); i++)
			lists.get(i).setMovie_no(movie_no);
//		model.addAttribute("theaterList", lists);		
		Map<String, List<MovieDto>> theater = new HashMap<String, List<MovieDto>>();
		System.out.println(lists);
		session.setAttribute("movie_no", movie_no);
		theater.put("theater", lists);
		return theater;
	}

	@ResponseBody
	@RequestMapping(value = "/movieTheaterChk.do", method = RequestMethod.GET)
	public Map<String, List<MovieDto>> selAllMTheater(String theater_no, String movie_no, Model model,
			HttpSession session) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("movie_no", movie_no);
		map.put("theater_no", theater_no);
		List<MovieDto> lists = movieService.selAllMTheater(map);
//		model.addAttribute("movieTheaterList", lists);
		Map<String, List<MovieDto>> movieTheater = new HashMap<String, List<MovieDto>>();
		System.out.println(lists);
		session.setAttribute("theater_no", theater_no);
		movieTheater.put("movieTheater", lists);
		return movieTheater;
	}

	@ResponseBody
	@RequestMapping(value = "/seatChk.do", method = RequestMethod.GET)
	public Map<String, List<MovieDto>> selAllSeat(String movie_play_no, Model model, HttpSession session) {
		List<MovieDto> lists = movieService.selAllSeat(movie_play_no);
		Map<String, List<MovieDto>> seat = new HashMap<String, List<MovieDto>>();
		System.out.println(lists);
		session.setAttribute("movie_play_no", movie_play_no);
		seat.put("seat", lists);
		return seat;
	}

	@ResponseBody
	@RequestMapping(value = "/seatMoneyChk.do", method = RequestMethod.GET)
	public Map<String, Integer> selSeatMoney(String rowcol, String movie_theater_no, Model model, HttpSession session) {
		Map<String, String> map = new HashMap<String, String>();
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

	@RequestMapping(value = "/ticketing.do", method = RequestMethod.GET)
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

	// 영화관
	// 영화관 관리 페이지
	@RequestMapping(value = "/theater_manager.do", method = RequestMethod.GET)
	public String theater_manager() {
		return "theater_manager";
	}

	// 영화관 등록 폼
	@RequestMapping(value = "/insertTForm.do", method = RequestMethod.GET)
	public String insertTheaterForm() {
		return "insertTheaterForm";
	}

	// 영화관 등록
	@RequestMapping(value = "/insertT.do", method = RequestMethod.GET)
	public String insertTheater(String theater_name, String theater_local) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("theater_name", theater_name);
		map.put("theater_local", theater_local);
		int n = movieService.insertTheater(map);
		System.out.println(n);
		return null;
	}

	// 영화관 수정 폼
	@RequestMapping(value = "/updateTForm.do", method = RequestMethod.GET)
	public String updateTheaterForm(String theater_no, String theater_name, String theater_local, HttpSession session) {
		session.setAttribute("theater_no", theater_no);
		session.setAttribute("theater_name", theater_name);
		session.setAttribute("theater_local", theater_local);
		return "theater_update_form";
	}

	// 영화관 수정
	@RequestMapping(value = "/updateT.do", method = RequestMethod.GET)
	public String updateTheater(String theater_no, String theater_name, String theater_local, Model model) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("theater_no", theater_no);
		map.put("theater_name", theater_name);
		map.put("theater_local", theater_local);
		int n = movieService.updateTheater(map);
		System.out.println(n);
		List<MovieDto> lists = movieService.selectOneTheater(theater_no);
		model.addAttribute("lists", lists);
		return "theater_detail";
	}

	// 영화관 목록 보기
	@RequestMapping(value = "/selT.do", method = RequestMethod.GET)
	public String selectTheater(Model model) {
		List<MovieDto> lists = movieService.selectTheater();
		model.addAttribute("lists", lists);
		System.out.println(lists);
		return "theater_list";
	}

	// 영화관 상세 보기
	@RequestMapping(value = "/selOneT.do", method = RequestMethod.GET)
	public String selectOneTheater(String theater_no, Model model, HttpSession session) {
		List<MovieDto> lists = movieService.selectOneTheater(theater_no);
		System.out.println(lists);
		model.addAttribute("lists", lists);
		session.setAttribute("theater_no", theater_no);
		return "theater_detail";
	}

	//상영관 관리
	//상영관 관리 페이지
	@RequestMapping(value="/movie_theater_manager.do", method=RequestMethod.GET)
	public String movie_Theater_manager() {
		return "movie_theater_manager";
	}
	@RequestMapping(value="/insertMTSelTheater.do", method=RequestMethod.GET)
	public String movie_theater_insert(Model model) {
		List<MovieDto> lists = movieService.selectTheater();
		model.addAttribute("lists", lists);
		System.out.println(lists);
		return "insert_mt_theater_list";
	}
	
	
	@RequestMapping(value = "/insertMTForm.do")
	public String insertMovieTForm(String theater_no, Model model) {
		model.addAttribute("theater_no", theater_no);
		return "insertMovieTheaterForm";
	}

	@RequestMapping(value = "/insertMT.do", method = RequestMethod.GET)
	public String insertMovieT(String theater_no, String movie_theater_name, Model model) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("theater_no", theater_no);
		map.put("movie_theater_name", movie_theater_name);
		int n = movieService.insertMovieT(map);
		System.out.println(n);
		List<MovieDto> lists = movieService.selectOneTheater(theater_no);
		model.addAttribute("lists", lists);
		return "theater_detail";
	}

	@RequestMapping(value = "/updateMTForm.do", method = RequestMethod.GET)
	public String updateMovieTForm(String movie_theater_no, String movie_theater_name, String theater_name,
			String theater_no, Model model) {
		model.addAttribute("movie_theater_no", movie_theater_no);
		model.addAttribute("movie_theater_name", movie_theater_name);
		model.addAttribute("theater_name", theater_name);
		model.addAttribute("theater_no", theater_no);
		return "movie_theater_update";
	}

	@RequestMapping(value = "/updateMT.do", method = RequestMethod.GET)
	public String updateMovieT(String movie_theater_no, String movie_theater_name, String theater_no, Model model) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("movie_theater_name", movie_theater_name);
		map.put("movie_theater_no", movie_theater_no);
		int n = movieService.updateMovieT(map);
		System.out.println(n);
		List<MovieDto> lists = movieService.selectOneTheater(theater_no);
		model.addAttribute("lists", lists);
		return "theater_detail";
	}

	@RequestMapping(value = "/listMT.do", method = RequestMethod.GET)
	public String selectMovieT(Model model) {
		List<MovieDto> lists = movieService.selectMovieT();
		System.out.println(lists);
		model.addAttribute("lists", lists);
		return "movie_theater_list";
	}

	@RequestMapping(value = "/detailMT.do", method = RequestMethod.GET)
	public String detailMovieT(String movie_theater_no, HttpSession session, Model model) {
		List<MovieDto> lists = movieService.detailMovieT(movie_theater_no);
		System.out.println(lists);
		model.addAttribute("lists", lists);
		session.setAttribute("movie_theater_no", movie_theater_no);
		return "movie_theater_detail";
	}
	
	
	// 좌석
	//좌석 등록 폼으로 이동
	@RequestMapping(value = "/insertSeatForm.do", method = RequestMethod.GET)
	public String insertSeatForm(String movie_theater_no, Model model) {
		model.addAttribute("movie_theater_no", movie_theater_no);
		return "insertSeatForm";
	}
	//좌석 등록
	@RequestMapping(value = "/insertSeat.do", method = RequestMethod.GET)
	public String insertSeat(String movie_theater_no, String seat_money, String rowseat, String colseat, String seat, String inputInt, String inputString, Model model, HttpSession session) {
		MovieDto mvDto = new MovieDto();
		String rowchk = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		System.out.println("" + inputInt + inputString);
		System.out.println(inputString.length());
		for (int i = 0; i < inputString.length(); i++) {
			System.out.println("조건문 전");
			System.out.println("inputString 자르는거 : " + inputString.substring(i, i + 1).trim());
			System.out.println("rowchk 자르는거 : " + rowchk.substring(i, i + 1).trim());
			System.out.println("rowchk 자르는거 : " + rowchk.substring(inputString.length()-1).trim());
			if (i + 1 < inputString.length()) {
				System.out.println("조건문 후 : " + inputString.length() + ":" + i);
				if (inputString.substring(i, i + 1).trim().equalsIgnoreCase(rowchk.substring(i, i + 1).trim())) {
					System.out.println("조건문 안");
					System.out.println("조건문 안 : " + Integer.parseInt(inputInt));
					for (int A = 1; A <= Integer.parseInt(inputInt); A++) {
						System.out.println("for문 안 :" + inputInt);
						System.out.println("for문 안 :" + rowseat);
						System.out.println("for문 안 :" + A);
						rowseat = inputString.substring(i, i + 1).trim();
						mvDto.setMovie_theater_no(movie_theater_no);
						mvDto.setRowseat(rowseat);
						mvDto.setColseat("" + A);
						mvDto.setSeat_money(Integer.parseInt(seat_money));
						mvDto.setSeat(seat);
						int n = movieService.insertSeat(mvDto);
						System.out.println(n);
					}
				}
			} else if (inputString.length()-1 == i) {
				System.out.println("else 문 안");
				if (inputString.substring(i).trim().equalsIgnoreCase(rowchk.substring(i, i + 1).trim())) {
					System.out.println("조건문 안");
					System.out.println("조건문 안 : " + Integer.parseInt(inputInt));
					for (int A = 1; A <= Integer.parseInt(inputInt); A++) {
						rowseat = inputString.substring(i).trim();
						mvDto.setMovie_theater_no(movie_theater_no);
						mvDto.setRowseat(rowseat);
						mvDto.setColseat("" + A);
						mvDto.setSeat_money(Integer.parseInt(seat_money));
						mvDto.setSeat(seat);
						int n = movieService.insertSeat(mvDto);
						System.out.println(n);
					}
				}
			}

		}
		List<MovieDto> lists = movieService.detailMovieT(movie_theater_no);
		model.addAttribute("lists", lists);
		session.setAttribute("movie_theater_no", movie_theater_no);
		return "movie_theater_detail";
	}
	//좌석 보기
	@RequestMapping(value = "/selSeat.do", method = RequestMethod.GET)
	public String selSeat(String seat, Model model) {
		List<MovieDto> lists = movieService.selSeat(seat);
		model.addAttribute("lists", lists);
		System.out.println(lists);
		return "setList";
	}
	//좌석 수정 폼으로 이동
	@RequestMapping(value = "/seatUpdateForm.do", method = RequestMethod.GET)
	public String updateSeatForm(String seat, String seat_no, String rowseat, String colseat, String seat_money,
			Model model) {
		model.addAttribute("seat", seat);
		model.addAttribute("seat_no", seat_no);
		model.addAttribute("rowseat", rowseat);
		model.addAttribute("colseat", colseat);
		model.addAttribute("seat_money", seat_money);
		return "seat_update_form";
	}
	//좌석 수정
	@RequestMapping(value = "/updateSeat.do", method = RequestMethod.GET)
	public String updateSeat(String seat_no, String rowseat, String colseat, String seat_money, String seat,
			Model model) {
		MovieDto mvDto = new MovieDto();
		mvDto.setRowseat(rowseat);
		mvDto.setColseat(colseat);
		mvDto.setSeat_money(Integer.parseInt(seat_money));
		mvDto.setSeat_no(seat_no);
		int n = movieService.updateSeat(mvDto);
		System.out.println(n);
		List<MovieDto> lists = movieService.selSeat(seat);
		model.addAttribute("lists", lists);
		return "setList";
	}

	// 영화
	//영화 관리 페이지
	@RequestMapping(value="/movieManager.do", method=RequestMethod.GET)
	public String movieManager() {
		return "movie_manager";
	}
	
	@RequestMapping(value = "/insertMForm.do", method = RequestMethod.GET)
	public String insertMovieForm() {
		return "insert_movie_form";
	}
	
	@RequestMapping(value = "/insertM.do", method = RequestMethod.GET)
	public String insertMovie(String movie_name, String movie_foreman, String movie_genre, String movie_openday, String movie_country, String movie_time, Model model) {
		MovieDto mvDto = new MovieDto();
		mvDto.setMovie_name(movie_name);
		mvDto.setMovie_foreman(movie_foreman);
		mvDto.setMovie_genre(movie_genre);
		mvDto.setMovie_openday(movie_openday);
		mvDto.setMovie_country(movie_country);
		mvDto.setMovie_time(movie_time);
		int n = movieService.insertMovie(mvDto);
		System.out.println(n);
		List<MovieDto> lists = movieService.selectMovie();
		model.addAttribute("lists", lists);
		return "movie_list";
	}

	@RequestMapping(value = "/updateMForm.do", method = RequestMethod.GET)
	public String updateMovieForm(String movie_no, String movie_name, String movie_foreman, String movie_genre, String movie_openday, String movie_country, String movie_time, Model model) {
		model.addAttribute("movie_no", movie_no);
		model.addAttribute("movie_name", movie_name);
		model.addAttribute("movie_foreman", movie_foreman);
		model.addAttribute("movie_genre", movie_genre);
		model.addAttribute("movie_openday", movie_openday);
		model.addAttribute("movie_country", movie_country);
		model.addAttribute("movie_time", movie_time);
		return "movie_update_form";
	}
	
	@RequestMapping(value = "/updateM.do", method = RequestMethod.GET)
	public String updateMovie(String movie_no, String movie_name, String movie_foreman, String movie_genre, String movie_openday, String movie_country, String movie_time, Model model) {
		System.out.println("###############################movie_no : " + movie_no);
		MovieDto mvDto = new MovieDto();
		mvDto.setMovie_no(movie_no);
		mvDto.setMovie_name(movie_name);
		mvDto.setMovie_foreman(movie_foreman);
		mvDto.setMovie_genre(movie_genre);
		mvDto.setMovie_openday(movie_openday);
		mvDto.setMovie_country(movie_country);
		mvDto.setMovie_time(movie_time);
		int n = movieService.updateMovie(mvDto);
		System.out.println(n);
		List<MovieDto> lists = movieService.selOneMovie(movie_no);
		model.addAttribute("lists", lists);
		return "movie_detail";
	}

	@RequestMapping(value = "/listM.do", method = RequestMethod.GET)
	public String selectMovie(Model model) {
		List<MovieDto> lists = movieService.selectMovie();
		System.out.println(lists);
		model.addAttribute("lists", lists);
		return "movie_list";
	}

	@RequestMapping(value = "/oneM.do", method = RequestMethod.GET)
	public String selOneMovie(String movie_no, Model model) {
		List<MovieDto> lists = movieService.selOneMovie(movie_no);
		System.out.println(lists);
		model.addAttribute("lists", lists);
		return "movie_detail";
	}

	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main() {
		return "main";
	}

}
