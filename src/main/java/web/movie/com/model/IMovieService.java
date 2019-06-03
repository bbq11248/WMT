package web.movie.com.model;

import java.util.List;
import java.util.Map;

import web.movie.com.dto.MovieDto;
public interface IMovieService {

	// 결제 관리
	// 마일리지 충전
	public int mileage(MovieDto mvDto);
//	public int useMileage(MovieDto mvDto);
//	public int insertUseMileage(MovieDto mvDto);
	// 마일리지 조회
	public int selectMileage(String id);
	// 결제 내역
	public List<MovieDto> selectPayList(String id);

	
	
	// 예매 관리
	// 예매 내역
	public List<MovieDto> selectTicket(String id);
	// 예매 상세 조회
	public MovieDto selectOneTicket(Map<String, String> map);
	// 예매
	public int ticketing(Map<String, Object> map, MovieDto mvDto);
//	public int insertUseTicket(Map<String, String> map);
//	public int updateUseMileage(MovieDto mvDto);
//	public int insertUsePay(MovieDto mvDto);
	// 예매 취소
	public int cancel(MovieDto mvDto, String ticketing_no);
//	public int cancelTic(MovieDto mvDto);
//	public int canclePay(MovieDto mvDto);
//	public int cancelUpPay(String theater_no);
//	public int canclelDelete(String Theater_no);

	
	
	// 영화 선택
	// 상영중인 영화
	public List<MovieDto> selPlayMovie();
	// 상영중인 영화 -> 영화관
	public List<MovieDto> selAllTheater(String movie_no);
	// 상영중인 영화 -> 영화관 -> 상영관
	public List<MovieDto> selAllMTheater(Map<String, String> map);
	// 상영중인 영화 -> 영화관 -> 상영관 -> 좌석
	public List<MovieDto> selAllSeat(String movie_play_no);
	// 상영중인 영화 -> 영화관 -> 상영관 -> 좌석 -> 가격
	public int selSeatMoney(Map<String, String> map);
	//예매좌석
	public List<MovieDto> beforSeat(String movie_start_time);

	
	
	// 영화관리
	// 상영관
	// 등록
	public int insertMovieT(Map<String, String> map);
	// 수정
	public int updateMovieT(Map<String, String> map);
	// 전체 보기
	public List<MovieDto> selectMovieT();
	// 상세 보기
	public List<MovieDto> detailMovieT(String movie_theater_no);

	
	
	// 좌석
	// 등록
	public int insertSeat(MovieDto mvDto);
	// 조회
	public List<MovieDto> selSeat(String seat);
	// 수정
	public int updateSeat(MovieDto mvDto);

	
	
	// 영화관
	// 등록
	public int insertTheater(Map<String, String> map);
	// 수정
	public int updateTheater(Map<String, String> map);
	// 전체 보기
	public List<MovieDto> selectTheater();
	// 상세 보기
	public List<MovieDto> selectOneTheater(String theater_no);

	
	
	// 영화
	// 등록
	public int insertMovie(MovieDto mvDto);
	// 수정
	public int updateMovie(MovieDto mvDto);
	// 전체보기
	public List<MovieDto> selectMovie();
	// 상세 보기
	public List<MovieDto> selOneMovie(String movie_no);
	
	//상영관 
	//등록
	public int insertMoviePlay(Map<String, String> map);
	//수정
	public int updateMoviePlay(Map<String, String> map);
	//보기
	public List<MovieDto> selectMoviePlay();
	//삭제
	public int deleteMoviePlay(Map<String, String[]> map);

}
