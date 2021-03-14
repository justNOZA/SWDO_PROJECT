package global.sesoc.archive.vo;

import java.io.Serializable;

public class Buy_userVO implements Serializable{
	// day : 대여 가능 일수
	private int day;
	// inputdate : 도서를 대여한 시점
	private String inputdate;
	// readDate : 읽기 시작한 날짜
	private String readDate;
	// id : 회원가입된 아이디
	private String id;
	// nickname : 가입된 회원의 별칭
	private String nickname;
	// BookNum : 책 번호 값
	private int booknum;
	// bookpage 정보
	private String bookpage;
	// 찜목록 
	private int want;
	// 책 제목
	private String title;
	// 책 작가
	private String author;
	
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public String getInputdate() {
		return inputdate;
	}
	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}
	public String getReadDate() {
		return readDate;
	}
	public void setReadDate(String readDate) {
		this.readDate = readDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getBooknum() {
		return booknum;
	}
	public void setBooknum(int booknum) {
		this.booknum = booknum;
	}
	public String getBookpage() {
		return bookpage;
	}
	public void setBookpage(String bookpage) {
		this.bookpage = bookpage;
	}
	public int getWant() {
		return want;
	}
	public void setWant(int want) {
		this.want = want;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	@Override
	public String toString() {
		return "Buy_userVO [day=" + day + ", inputdate=" + inputdate + ", readDate=" + readDate + ", id=" + id
				+ ", nickname=" + nickname + ", booknum=" + booknum + ", bookpage=" + bookpage + ", want=" + want
				+ ", title=" + title + ", author=" + author + "]";
	}
	public Buy_userVO(int day, String inputdate, String readDate, String id, String nickname, int booknum,
			String bookpage, int want, String title, String author) {
		super();
		this.day = day;
		this.inputdate = inputdate;
		this.readDate = readDate;
		this.id = id;
		this.nickname = nickname;
		this.booknum = booknum;
		this.bookpage = bookpage;
		this.want = want;
		this.title = title;
		this.author = author;
	}
	public Buy_userVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	

}