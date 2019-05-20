package web.movie.com.model;

import java.util.List;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web.movie.com.dto.MovieDto;
@Repository
public class MovieDao_Imple implements IMovieDao {
	
	private final String NS = "web.movie.com.movie_statment.";
	private Logger logger = LoggerFactory.getLogger(MovieDao_Imple.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int mileage(MovieDto mvDto) {
		logger.info("마일리지 충전");
		int n = sqlSession.update(NS+"useMileage", mvDto);
		int i = sqlSession.insert(NS+"insertUseMileage", mvDto);
		return n+i;
	}

	@Override
	public int selectMileage(String id) {
		logger.info("마일리지 확인");
		int n = sqlSession.selectOne(NS+"selectMileage",id);
		return n;
	}

	@Override
	public List<MovieDto> selectPayList(String id) {
		logger.info("결제 목록");
		List<MovieDto> map = sqlSession.selectList(NS+"selectPayList", id); 
		return map;
	}

	@Override
	public List<MovieDto> selectTicket(String id) {
		logger.info("티켓 내역 보기");
		List<MovieDto> lists = sqlSession.selectList(NS+"selectTicket", id);
		System.out.println(lists);
		return lists;
	}

	@Override
	public MovieDto selectOneTicket(Map<String, String> map) {
		logger.info("티켓 상세 보기");
		MovieDto mvDto = sqlSession.selectOne(NS+"selectOneTicket", map);
		return mvDto;
	}

	@Override
	public int ticketing(Map<String, String> map, MovieDto mvDto) {
		logger.info("예매");
		int n = sqlSession.insert(NS+"insertUseTicket", map);
		int i = sqlSession.update(NS+"updateUseMileage", mvDto);
		int j = sqlSession.insert(NS+"insertUsePay", mvDto);
		return n+i+j;
	}
	
	@Override
	public int cancel(MovieDto mvDto, String ticketing_no) {
		logger.info("예매 취소");
		int n = sqlSession.update(NS+"cancelTic", mvDto);
		int i = sqlSession.insert(NS+"cancelPay", mvDto);
		int j = sqlSession.update(NS+"cancelUpPay", ticketing_no);
		int k = sqlSession.delete(NS+"cancelDelete", ticketing_no);
		return n+i+j+k;
	}

	@Override
	public List<MovieDto> selPlayMovie() {
		logger.info("상영중인 영화 목록");
		List<MovieDto> lists = sqlSession.selectList(NS+"selPlayMovie");
		return lists;
	}

	@Override
	public List<MovieDto> selAllTheater(String movie_no) {
		logger.info("영화를 상영중인영화관 목록");
		List<MovieDto> lists = sqlSession.selectList(NS+"selAllTheater", movie_no);
		return lists;
	}

	@Override
	public List<MovieDto> selAllMTheater(Map<String, String> map) {
		logger.info("선택영화관의 상영관 목록");
		List<MovieDto> lists = sqlSession.selectList(NS+"selAllMTheater", map);
		return lists;
	}

	@Override
	public List<MovieDto> selAllSeat(String movie_play_no) {
		logger.info("선택 상영관의 좌석 목록");
		List<MovieDto> lists = sqlSession.selectList(NS+"selAllSeat", movie_play_no);
		return lists;
	}

	@Override
	public int selSeatMoney(Map<String, String> map) {
		logger.info("선택 좌석의 가격");
		int n = sqlSession.selectOne(NS+"selSeatMoney", map);
		return n;
	}


	@Override
	public int insertMovieT(Map<String, String> map) {
		logger.info("상영관 등록");
		int n = sqlSession.insert(NS+"insertMovieT");
		return n;
	}

	@Override
	public int updateMovieT(Map<String, String> map) {
		logger.info("상영관 수정");
		int n = sqlSession.update(NS+"updateMovieT", map);
		return n;
	}

	@Override
	public List<MovieDto> selectMovieT() {
		logger.info("상영관 목록 보기");
		List<MovieDto> lists = sqlSession.selectList(NS+"selectMovieT");
		return lists;
	}

	@Override
	public MovieDto detailMovieT(String movie_theater_no) {
		logger.info("상영관 상세 보기");
		MovieDto mvDto = sqlSession.selectOne(NS+"detailMovieT", movie_theater_no);
		return mvDto;
	}

	@Override
	public int insertSeat(MovieDto mvDto) {
		logger.info("좌석 등록");
		int n = sqlSession.insert(NS+"insertSeat", mvDto);
		return n;
	}

	@Override
	public List<MovieDto> selSeat(String Seat) {
		logger.info("좌석 보기");
		List<MovieDto> lists = sqlSession.selectList(NS+"selSeat", Seat);
		return lists;
	}

	@Override
	public int updateSeat(MovieDto mvDto) {
		logger.info("좌석 수정");
		int n = sqlSession.update(NS+"updateSeat", mvDto);
		return n;
	}

	@Override
	public int insertTheater(Map<String, String> map) {
		logger.info("영화관 등록");
		int n = sqlSession.insert(NS+"insertTheater", map);
		return n;
	}

	@Override
	public int updateTheater(Map<String, String> map) {
		logger.info("영화관 수정");
		int n = sqlSession.update(NS+"updateTheater", map);
		return n;
	}

	@Override
	public List<MovieDto> selectTheater() {
		logger.info("영화관 목록 보기");
		List<MovieDto> lists = sqlSession.selectList(NS+"selectTheater");
		return lists;
	}

	@Override
	public MovieDto selectOneTheater(String theater_no) {
		logger.info("영화관 상세 보기");
		MovieDto mvDto = sqlSession.selectOne(NS+"selectOneTheater", theater_no); 
		return mvDto;
	}

	@Override
	public int insertMovie(MovieDto mvDto) {
		logger.info("영화 등록");
		int n = sqlSession.insert(NS+"insertMovie", mvDto);
		return n;
	}

	@Override
	public int updateMovie(MovieDto mvDto) {
		logger.info("영화 수정");
		int n = sqlSession.update(NS+"updateMovie", mvDto);
		return n;
	}

	@Override
	public List<MovieDto> selectMovie() {
		logger.info("영화 목록 보기");
		List<MovieDto> lists = sqlSession.selectList(NS+"selectMovie");
		return lists;
	}

	@Override
	public MovieDto selOneMovie(String movie_no) {
		logger.info("영화 상세 보기");
		MovieDto mvDto = sqlSession.selectOne(NS+"selOneMovie", movie_no);
		return mvDto;
	}







}
