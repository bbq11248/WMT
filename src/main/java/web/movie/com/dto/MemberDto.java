package web.movie.com.dto;

public class MemberDto {

	
	private int seq;
	private String id;
	private String pw;
	private String name;
	private String nickname;
	private int birthday;
	private int phone;
	private String address;
	private String email;
	private String auth;
	private String regdate;
	
	
	public MemberDto() {
		super();
		// TODO Auto-generated constructor stub
	}




	public MemberDto(String id, String pw, String name, String nickname, int birthday, int phone, String address,
			String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickname = nickname;
		this.birthday = birthday;
		this.phone = phone;
		this.address = address;
		this.email = email;
	}




	public MemberDto(String id, String pw, String nickname, int birthday, int phone, String address) {
		super();
		this.id = id;
		this.pw = pw;
		this.nickname = nickname;
		this.birthday = birthday;
		this.phone = phone;
		this.address = address;
	}


	public MemberDto(int seq, String id, String name, String nickname, int birthday, int phone, String address,
			String email, String auth, String regdate) {
		super();
		this.seq = seq;
		this.id = id;
		this.name = name;
		this.nickname = nickname;
		this.birthday = birthday;
		this.phone = phone;
		this.address = address;
		this.email = email;
		this.auth = auth;
		this.regdate = regdate;
	}


	public MemberDto(String name, int phone) {
		super();
		this.name = name;
		this.phone = phone;
	}


	public MemberDto(String id) {
		super();
		this.id = id;
	}


	public MemberDto(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}


	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public int getBirthday() {
		return birthday;
	}


	public void setBirthday(int birthday) {
		this.birthday = birthday;
	}


	public int getPhone() {
		return phone;
	}


	public void setPhone(int phone) {
		this.phone = phone;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getAuth() {
		return auth;
	}


	public void setAuth(String auth) {
		this.auth = auth;
	}


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	@Override
	public String toString() {
		return "MemberDto [seq=" + seq + ", id=" + id + ", pw=" + pw + ", name=" + name + ", nickname=" + nickname
				+ ", birthday=" + birthday + ", phone=" + phone + ", address=" + address + ", email=" + email
				+ ", auth=" + auth + ", regdate=" + regdate + "]";
	}
	
	
}
