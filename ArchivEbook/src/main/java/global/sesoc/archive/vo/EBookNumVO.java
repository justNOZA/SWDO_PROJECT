package global.sesoc.archive.vo;

public class EBookNumVO {
	// BookNum : 책 번호 값
	private int booknum;
	// Title : 책 제목
	private String title;
	// author : 책 저자
	private String author;
	// publisher : 출판사
	private String publisher;

	public EBookNumVO() {

	}

	@Override
	public String toString() {
		return "EBookNumVO [booknum=" + booknum + ", title=" + title + ", author=" + author + ", publisher=" + publisher
				+ "]";
	}

	public EBookNumVO(int booknum, String title, String author, String publisher) {
		super();
		this.booknum = booknum;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
	}

	public int getBooknum() {
		return booknum;
	}

	public void setBooknum(int booknum) {
		this.booknum = booknum;
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

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	
}