package web.movie.com.dto;

public class MovieDto {

	private String ticketing_no;
	private String movie_play_no;
	private String id;
	private String seat_no;
	private String ticketing_time;
	private String movie_no;
	private String movie_name;
	private String movie_foreman;
	private String movie_genre;
	private String movie_openday;
	private String movie_country;
	private String movie_time;
	private String theater_no;
	private String theater_name;
	private String theater_local;
	private String movie_theater_no;
	private String movie_theater_name;
	private String movie_start_time;
	private String times;
	private int seat_money;
	private String rowseat;
	private String colseat;
	private String seat;
	private String mileage_seq;
	private int mileage;
	private String payment_no;
	private int price;
	private String mileage_time;
	
	public MovieDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getTicketing_no() {
		return ticketing_no;
	}
	public void setTicketing_no(String ticketing_no) {
		this.ticketing_no = ticketing_no;
	}
	public String getMovie_play_no() {
		return movie_play_no;
	}
	public void setMovie_play_no(String movie_play_no) {
		this.movie_play_no = movie_play_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSeat_no() {
		return seat_no;
	}
	public void setSeat_no(String seat_no) {
		this.seat_no = seat_no;
	}
	public String getTicketing_time() {
		return ticketing_time;
	}
	public void setTicketing_time(String ticketing_time) {
		this.ticketing_time = ticketing_time;
	}
	public String getMovie_no() {
		return movie_no;
	}
	public void setMovie_no(String movie_no) {
		this.movie_no = movie_no;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public String getMovie_foreman() {
		return movie_foreman;
	}
	public void setMovie_foreman(String movie_foreman) {
		this.movie_foreman = movie_foreman;
	}
	public String getMovie_genre() {
		return movie_genre;
	}
	public void setMovie_genre(String movie_genre) {
		this.movie_genre = movie_genre;
	}
	public String getMovie_openday() {
		return movie_openday;
	}
	public void setMovie_openday(String movie_openday) {
		this.movie_openday = movie_openday;
	}
	public String getMovie_country() {
		return movie_country;
	}
	public void setMovie_country(String movie_country) {
		this.movie_country = movie_country;
	}
	public String getMovie_time() {
		return movie_time;
	}
	public void setMovie_time(String movie_time) {
		this.movie_time = movie_time;
	}
	public String getTheater_no() {
		return theater_no;
	}
	public void setTheater_no(String theater_no) {
		this.theater_no = theater_no;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	public String getTheater_local() {
		return theater_local;
	}
	public void setTheater_local(String theater_local) {
		this.theater_local = theater_local;
	}
	public String getMovie_theater_no() {
		return movie_theater_no;
	}
	public void setMovie_theater_no(String movie_theater_no) {
		this.movie_theater_no = movie_theater_no;
	}
	public String getMovie_theater_name() {
		return movie_theater_name;
	}
	public void setMovie_theater_name(String movie_theater_name) {
		this.movie_theater_name = movie_theater_name;
	}
	public String getMovie_start_time() {
		return movie_start_time;
	}
	public void setMovie_start_time(String movie_start_time) {
		this.movie_start_time = movie_start_time;
	}
	public String getTimes() {
		return times;
	}
	public void setTimes(String times) {
		this.times = times;
	}
	public int getSeat_money() {
		return seat_money;
	}
	public void setSeat_money(int seat_money) {
		this.seat_money = seat_money;
	}
	public String getRowseat() {
		return rowseat;
	}
	public void setRowseat(String rowseat) {
		this.rowseat = rowseat;
	}
	public String getColseat() {
		return colseat;
	}
	public void setColseat(String colseat) {
		this.colseat = colseat;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public String getMileage_seq() {
		return mileage_seq;
	}
	public void setMileage_seq(String mileage_seq) {
		this.mileage_seq = mileage_seq;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	public String getPayment_no() {
		return payment_no;
	}
	public void setPayment_no(String payment_no) {
		this.payment_no = payment_no;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getMileage_time() {
		return mileage_time;
	}
	public void setMileage_time(String mileage_time) {
		this.mileage_time = mileage_time;
	}

	public MovieDto(String id, int price) {
		super();
		this.id = id;
		this.price = price;
	}

	public MovieDto(String movie_theater_no, int seat_money, String rowseat, String colseat, String seat) {
		super();
		this.movie_theater_no = movie_theater_no;
		this.seat_money = seat_money;
		this.rowseat = rowseat;
		this.colseat = colseat;
		this.seat = seat;
	}

	public MovieDto(String seat_no, int seat_money, String rowseat, String colseat) {
		super();
		this.seat_no = seat_no;
		this.seat_money = seat_money;
		this.rowseat = rowseat;
		this.colseat = colseat;
	}

	public MovieDto(String movie_name, String movie_foreman, String movie_genre, String movie_openday,
			String movie_country, String movie_time) {
		super();
		this.movie_name = movie_name;
		this.movie_foreman = movie_foreman;
		this.movie_genre = movie_genre;
		this.movie_openday = movie_openday;
		this.movie_country = movie_country;
		this.movie_time = movie_time;
	}

	public MovieDto(String movie_no, String movie_name, String movie_foreman, String movie_genre, String movie_openday,
			String movie_country, String movie_time) {
		super();
		this.movie_no = movie_no;
		this.movie_name = movie_name;
		this.movie_foreman = movie_foreman;
		this.movie_genre = movie_genre;
		this.movie_openday = movie_openday;
		this.movie_country = movie_country;
		this.movie_time = movie_time;
	}

	public MovieDto(String theater_name, String movie_theater_name, String seat) {
		super();
		this.theater_name = theater_name;
		this.movie_theater_name = movie_theater_name;
		this.seat = seat;
	}

	public MovieDto(String theater_no, String theater_name, String theater_local, String movie_theater_no,
			String movie_theater_name) {
		super();
		this.theater_no = theater_no;
		this.theater_name = theater_name;
		this.theater_local = theater_local;
		this.movie_theater_no = movie_theater_no;
		this.movie_theater_name = movie_theater_name;
	}

	@Override
	public String toString() {
		return "MovieDto [ticketing_no=" + ticketing_no + ", id=" + id + ", mileage=" + mileage + ", payment_no="
				+ payment_no + ", price=" + price + ", mileage_time=" + mileage_time + "]";
	}


	
	

	
}
