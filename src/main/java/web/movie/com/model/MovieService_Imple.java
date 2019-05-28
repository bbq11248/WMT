package web.movie.com.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.movie.com.dto.MovieDto;
@Service
public class MovieService_Imple implements IMovieService {

	private Logger logger = LoggerFactory.getLogger(MovieService_Imple.class);
	@Autowired
	private IMovieDao mvDao;
	
	
	@Override
	public int mileage(MovieDto mvDto) {
		logger.info("mileage Service 실행");
		return mvDao.mileage(mvDto);
	}

	@Override
	public int selectMileage(String id) {
		logger.info("selectMileage Service 실행");
		return mvDao.selectMileage(id);
	}

	@Override
	public List<MovieDto> selectPayList(String id) {
		logger.info("selectPayList Service 실행");
		return mvDao.selectPayList(id);
	}

	@Override
	public List<MovieDto> selectTicket(String id) {
		logger.info("selectTicket Service 실행");
		return mvDao.selectTicket(id);
	}

	@Override
	public MovieDto selectOneTicket(Map<String, String> map) {
		logger.info("selectOneTicket Service 실행");
		return mvDao.selectOneTicket(map);
	}

	@Override
	public int ticketing(Map<String, String> map, MovieDto mvDto) {
		logger.info("ticketing Service 실행");
		return mvDao.ticketing(map, mvDto);
	}

	@Override
	public int cancel(MovieDto mvDto, String ticketing_no) {
		logger.info("cancel Service 실행");
		return mvDao.cancel(mvDto, ticketing_no);
	}

	@Override
	public List<MovieDto> selPlayMovie() {
		logger.info("selPlayMovie Service 실행");
		return mvDao.selPlayMovie();
	}

	@Override
	public List<MovieDto> selAllTheater(String movie_no) {
		logger.info("selAllTheater Service 실행");
		return mvDao.selAllTheater(movie_no);
	}

	@Override
	public List<MovieDto> selAllMTheater(Map<String, String> map) {
		logger.info("selAllMTheater Service 실행");
		return mvDao.selAllMTheater(map);
	}

	@Override
	public List<MovieDto> selAllSeat(String movie_play_no) {
		logger.info("selAllSeat Service 실행");
		return mvDao.selAllSeat(movie_play_no);
	}

	@Override
	public int selSeatMoney(Map<String, String> map) {
		logger.info("selSeatMoney Service 실행");
		return mvDao.selSeatMoney(map);
	}

	@Override
	public int insertMovieT(Map<String, String> map) {
		logger.info("insertMovieT Service 실행");
		return mvDao.insertMovieT(map);
	}

	@Override
	public int updateMovieT(Map<String, String> map) {
		logger.info("updateMovieT Service 실행");
		return mvDao.updateMovieT(map);
	}

	@Override
	public List<MovieDto> selectMovieT() {
		logger.info("selectMovieT Service 실행");
		return mvDao.selectMovieT();
	}

	@Override
	public List<MovieDto> detailMovieT(String movie_theater_no) {
		logger.info("detailMovieT Service 실행");
		return mvDao.detailMovieT(movie_theater_no);
	}

	@Override
	public int insertSeat(MovieDto mvDto) {
		logger.info("insertSeat Service 실행");
		return mvDao.insertSeat(mvDto);
	}

	@Override
	public List<MovieDto> selSeat(String seat) {
		logger.info("selSeat Service 실행");
		return mvDao.selSeat(seat);
	}

	@Override
	public int updateSeat(MovieDto mvDto) {
		logger.info("updateSeat Service 실행");
		return mvDao.updateSeat(mvDto);
	}

	@Override
	public int insertTheater(Map<String, String> map) {
		logger.info("insertTheater Service 실행");
		return mvDao.insertTheater(map);
	}

	@Override
	public int updateTheater(Map<String, String> map) {
		logger.info("updateTheater Service 실행");
		return mvDao.updateTheater(map);
	}

	@Override
	public List<MovieDto> selectTheater() {
		logger.info("selectTheater Service 실행");
		return mvDao.selectTheater();
	}

	@Override
	public List<MovieDto> selectOneTheater(String theater_no) {
		logger.info("selectOneTheater Service 실행");
		return mvDao.selectOneTheater(theater_no);
	}

	@Override
	public int insertMovie(MovieDto mvDto) {
		logger.info("insertMovie Service 실행");
		return mvDao.insertMovie(mvDto);
	}

	@Override
	public int updateMovie(MovieDto mvDto) {
		logger.info("updateMovie Service 실행");
		return mvDao.updateMovie(mvDto);
	}

	@Override
	public List<MovieDto> selectMovie() {
		logger.info("selectMovie Service 실행");
		return mvDao.selectMovie();
	}

	@Override
	public List<MovieDto> selOneMovie(String movie_no) {
		logger.info("selOneMovie Service 실행");
		return mvDao.selOneMovie(movie_no);
	}


	

}
