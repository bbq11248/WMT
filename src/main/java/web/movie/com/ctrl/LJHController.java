package web.movie.com.ctrl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import web.movie.com.model.IMovieService;

@Controller
public class LJHController {
	
	private Logger logger = LoggerFactory.getLogger(LJHController.class);
	
	@Autowired
	IMovieService movieService;
	
	@Autowired
	IBoardService boardService;
	
	//마일리지 확인
	@RequestMapping(value = "/mileageChk.do", method = RequestMethod.GET)
	public String selectMileage(Model model, HttpSession session) {
		logger.info("LJHController selectMileage 실행");
		MemberDto mbDto = (MemberDto)session.getAttribute("memberLogin");
		String id = mbDto.getId();
		int mileage = movieService.selectMileage(id);
		System.out.println(mileage);
		model.addAttribute("mileage", mileage);
		session.setAttribute("mileage", mileage);
		return "mileage";
	}
	//마일리지 충전 화면 이동
	@RequestMapping(value = "/mileageForm.do", method = RequestMethod.GET)
	public String chargeMileageForm() {
		return "milagerCG";
	}
	//마일리지 충전
	@RequestMapping(value = "/mileage.do", method = RequestMethod.GET)
	public String mileageCG(MovieDto mvDto, HttpSession session, String milageCG) {
		MemberDto mbDto = (MemberDto)session.getAttribute("memberLogin");
		String id = mbDto.getId();
		mvDto.setId(id);
		mvDto.setPrice(Integer.parseInt(milageCG));
		int mileageCg = movieService.mileage(mvDto);
		System.out.println(mileageCg);
		String text = milageCG;
		System.out.println(text);
		return "redirect:/main.do";
	}
	//결제 내역 보기
	@RequestMapping(value = "/payList.do", method = RequestMethod.GET)
	public String selectPayList(String id, Model model, HttpSession session) {
		MemberDto mbDto = (MemberDto)session.getAttribute("memberLogin");
		id = mbDto.getId();
		List<MovieDto> lists = movieService.selectPayList(id);
		System.out.println(lists.get(0).getPayment_no() + "**********************************************");
		model.addAttribute("lists", lists);
		return "payList";
	}
	//예매 내역 보기
	@RequestMapping(value = "/ticketList.do", method = RequestMethod.GET)
	public String selectTicket(String id, Model model, HttpSession session) {
		MemberDto mbDto = (MemberDto)session.getAttribute("memberLogin");
		id = mbDto.getId();
		List<MovieDto> lists = movieService.selectTicket(id);
		model.addAttribute("lists", lists);
		System.out.println(lists);
		return "ticketList";
	}
	//예매 내역 상세 보기
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
	//티켓 취소
	@RequestMapping(value = "/cancel.do", method = RequestMethod.GET)
	public String cancel(String id, String price, String ticketing_no, HttpSession session, Model model) {
		MemberDto mbDto = (MemberDto)session.getAttribute("memberLogin");
		id = mbDto.getId();
		MovieDto mvDto = new MovieDto();
		mvDto.setId(id);
		mvDto.setPrice(Integer.parseInt(price));
		int n = movieService.cancel(mvDto, ticketing_no);
		System.out.println(n);
		List<MovieDto> lists = movieService.selectTicket(id);
		model.addAttribute("lists", lists);
		return "redirect:/ticketList.do";
	}
	//상영중인 영화 선택
	@RequestMapping(value = "/playMovie.do", method = RequestMethod.GET)
	public String selPlayMovie(Model model) {
		List<MovieDto> lists = movieService.selPlayMovie();
		model.addAttribute("movielist", lists);
		System.out.println(lists);
		return "playMovie";
	}
	//선택영화가 상영하는 영화관선택
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
	//영화관 에 선택한 영화가 있는 상영관 선택
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
	//선택한 상영관의 좌석 선택
	@ResponseBody
	@RequestMapping(value = "/seatChk.do", method = RequestMethod.GET)
	public Map<String, Object> selAllSeat(String movie_play_no, String movie_start_time, Model model, HttpSession session) {
		List<MovieDto> lists = movieService.selAllSeat(movie_play_no);
		List<MovieDto> beforSeat = movieService.beforSeat(movie_start_time);
//		DTO dto = movieService.selBeforeSeat(movie_play_no); //Dto
		Map<String, Object> seat = new HashMap<String, Object>();
//		System.out.println(lists);
//		System.out.println(beforSeat+"0000");
		String reserveSeat = "";
		for (int i = 0; i < beforSeat.size(); i++) {
			reserveSeat += beforSeat.get(i).getSeat_no()+",";
		}
		System.out.println(reserveSeat);
		session.setAttribute("movie_play_no", movie_play_no);
		seat.put("seat", lists);
		seat.put("beforSeat", reserveSeat);
//		seat.put("test", ((List<MovieDto>) seat.get("beforSeat")).get(0).getSeat_no());
		return seat;
	}
	//선택한 좌석의 가격 확인 및 예매 
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
	//티켓 예매 및 결제
	@RequestMapping(value = "/ticketing.do", method = RequestMethod.GET)
	public String ticketing(MovieDto mvDto, String movie_play_no, String id, String rowcol, String price, Model model,  HttpSession session) {
		MemberDto mbDto = (MemberDto)session.getAttribute("memberLogin");
		id = mbDto.getId();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("movie_play_no", movie_play_no);
		map.put("id", id);
		map.put("seat_no", rowcol);
		map.put("price", Integer.parseInt(price));
		mvDto.setId(id);
		mvDto.setPrice(Integer.parseInt(price));
		int n = movieService.ticketing(map, mvDto);
		List<MovieDto> lists = movieService.selectTicket(id);
		model.addAttribute("lists", lists);
		System.out.println(n);
		return "redirect:/ticketList.do";
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
		List<MovieDto> lists = movieService.selectTheater();
		System.out.println(lists);
		return "redirect:/selT.do";
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
		return "redirect:/selOneT.do";
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
		return "redirect:/detailMT.do";
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
		return "redirect:/detailMT.do";
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
		return "redirect:/detailMT.do";
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
		return "redirect:/selSeat.do";
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
		return "redirect:/listM.do";
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
		return "redirect:/oneM.do";
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
	
	//상영중인 영화 
	//상영중인 영화 관리 화면
	@RequestMapping(value="/moviePlayManager.do", method=RequestMethod.GET)
	public String moviePlayManager() {
		return "movie_play_manager";
	}
	@RequestMapping(value="/insertMPForm.do", method=RequestMethod.GET)
	public String insertMPForm() {
		return "insertMPForm";
	}
	@RequestMapping(value="/insertMP.do", method=RequestMethod.GET)
	public String insertMP(String movie_name, String theater_name, String movie_theater_name, String movie_start_time, String times, Model model) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("movie_name", movie_name);
		map.put("theater_name", theater_name);
		map.put("movie_theater_name", movie_theater_name);
		map.put("movie_start_time", movie_start_time);
		map.put("times", times);
		int n = movieService.insertMoviePlay(map);
		System.out.println(n);
		List<MovieDto> lists = movieService.selectMoviePlay();
		model.addAttribute("lists", lists);
		return "redirect:/selectMP.do";
	}
	@RequestMapping(value="/updateMPForm.do", method=RequestMethod.GET)
	public String updateMPForm(String movie_name, String theater_name, String movie_theater_name, String movie_start_time, String times, String movie_play_no, Model model) {
		model.addAttribute("movie_name", movie_name);
		model.addAttribute("theater_name", theater_name);
		model.addAttribute("movie_theater_name", movie_theater_name);
		model.addAttribute("movie_start_time", movie_start_time);
		model.addAttribute("times", times);
		model.addAttribute("movie_play_no", movie_play_no);
		return "updateMPForm";
	}
	@RequestMapping(value="/updateMP.do", method=RequestMethod.GET)
	public String updateMP(String movie_name, String theater_name, String movie_theater_name, String movie_start_time, String times, String movie_play_no, Model model) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("movie_name", movie_name);
		map.put("theater_name", theater_name);
		map.put("movie_theater_name", movie_theater_name);
		map.put("movie_start_time", movie_start_time);
		map.put("times", times);
		map.put("movie_play_no", movie_play_no);
		int n = movieService.updateMoviePlay(map);
		System.out.println(n);
		List<MovieDto> lists = movieService.selectMoviePlay();
		model.addAttribute("lists", lists);
		return "redirect:/selectMP.do";
	}
	@RequestMapping(value="/selectMP.do", method=RequestMethod.GET)
	public String selectMP(Model model) {
		List<MovieDto> lists = movieService.selectMoviePlay();
		model.addAttribute("lists", lists);
		System.out.println(lists);
		return "selectMP";
	}
	@RequestMapping(value="/deleteMP.do", method=RequestMethod.GET)
	public String deleteMP(String[] movie_play_chk, Model model) {
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("movie_play_no_", movie_play_chk);
		int n = movieService.deleteMoviePlay(map);
		System.out.println(n);
		if(n >= 1) {
			List<MovieDto> lists = movieService.selectMoviePlay();
			model.addAttribute("lists", lists);
			return "redirect:/selectMP.do";
		}else {
			//errMsg, url
			model.addAttribute("errMsg", "잘못된 접근입니다. \n 관리자에게 문의 하세요");
			model.addAttribute("url", "/loginForm.do");
			return "error_pag";
		}
	}
	@RequestMapping(value="/board.do", method=RequestMethod.GET)
	public String selectBoard(Model model, HttpSession session) {
		List<BoardDto> lists = boardService.selectList();
		model.addAttribute("lists", lists);
		return "boardList";
	}
	
	@RequestMapping(value="/oneBoard.do", method=RequestMethod.GET)
	public String detailBoard(String seq, Model model, HttpSession session) {
		MemberDto mbDto = (MemberDto)session.getAttribute("memberLogin");
		String id = mbDto.getId();
		BoardDto bDto = boardService.selectOneList(seq);
		model.addAttribute("bDto", bDto);
		return "boardDetail";
	}
	
	@RequestMapping(value="/updateBoardForm.do", method=RequestMethod.GET)
	public String updateBoardForm(String seq, String id, String title, String content, Model model, HttpSession session) {
		MemberDto mbDto = (MemberDto)session.getAttribute("memberLogin");
		id = mbDto.getId();
		model.addAttribute("seq", seq);
		model.addAttribute("id", id);
		model.addAttribute("title", title);
		model.addAttribute("content", content);
		return "updateBoardForm";
	}
	
	@RequestMapping(value="/updateBoard.do", method=RequestMethod.GET)
	public String updateBoard(String seq, String id, String title, String content, Model model, HttpSession session) {
		MemberDto mbDto = (MemberDto)session.getAttribute("memberLogin");
		id = mbDto.getId();
		BoardDto bDto = new BoardDto();
		bDto.setId(id);
		bDto.setSeq(seq);
		bDto.setContent(content);
		bDto.setTitle(title);
		boolean isc = boardService.updateBoard(bDto);
		System.out.println(isc);
		if(isc) {
			bDto = boardService.selectOneList(seq);
			model.addAttribute("bDto", bDto);
			return "redirect:/oneBoard.do";
		}else {
			return "err";
		}
	}
	
	@RequestMapping(value="/deleteBoard.do", method=RequestMethod.GET)
	public String deleteBoard(String seq, Model model) {
		boolean isc = boardService.deleteBoard(seq);
		if(isc) {
			List<BoardDto> lists = boardService.selectList();
			model.addAttribute("lists", lists);
			return "redirect:/board.do";
		}else {
			return "err";
		}
	}
	
	@RequestMapping(value="/insertBoardForm.do", method=RequestMethod.GET)
	public String insertBoardForm(HttpSession session, Model model) {
		MemberDto mbDto = (MemberDto)session.getAttribute("memberLogin");
		String id = mbDto.getId();
		model.addAttribute("id", id);
		return "insertBoardForm";
	}
	@RequestMapping(value="/insertBoard.do", method=RequestMethod.GET)
	public String insertBoard(String id,String content, String title, HttpSession session, Model model) {
		BoardDto bDto = new BoardDto();
		bDto.setId(id);
		bDto.setContent(content);
		bDto.setTitle(title);
		boardService.insertBoard(bDto);
		System.out.println(bDto);
		List<BoardDto> lists = boardService.selectList();
		model.addAttribute("lists", lists);
		return "redirect:/board.do";
	}

	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main(HttpSession session) {
		MemberDto mbDto = (MemberDto)session.getAttribute("memberLogin");
		String id = mbDto.getId();
		if (id != null || id != "") {
			return "main";
		}else {
			return "";
		}
	}
	
	@RequestMapping(value="/beforSeat.do", method = RequestMethod.GET)
	public String beforSeat(String movie_start_time, Model model) {
		movie_start_time = "20190515 17:21";
		List<MovieDto> lists = movieService.beforSeat(movie_start_time);
		System.out.println(lists);
		model.addAttribute("lists", lists);
		return "asda";
	}

}
