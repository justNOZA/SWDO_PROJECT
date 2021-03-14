package global.sesoc.archive.vo;

public class ReadBookVO {
	
	private int bookpage;
	private String id;
	private String nickname;
	private int booknum;
	private String inputdate;
	private String storage;
	private String bookmarks;
	private String annotations;
	
	public ReadBookVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ReadBookVO(int bookpage, String id, String nickname, int booknum, String inputdate, String storage,
			String bookmarks, String annotations) {
		super();
		this.bookpage = bookpage;
		this.id = id;
		this.nickname = nickname;
		this.booknum = booknum;
		this.inputdate = inputdate;
		this.storage = storage;
		this.bookmarks = bookmarks;
		this.annotations = annotations;
	}

	@Override
	public String toString() {
		return "ReadBookVO [bookpage=" + bookpage + ", id=" + id + ", nickname=" + nickname + ", booknum=" + booknum
				+ ", inputdate=" + inputdate + ", storage=" + storage + ", bookmarks=" + bookmarks + ", annotations="
				+ annotations + "]";
	}

	public String getBookmarks() {
		return bookmarks;
	}

	public void setBookmarks(String bookmarks) {
		this.bookmarks = bookmarks;
	}

	public String getAnnotations() {
		return annotations;
	}

	public void setAnnotations(String annotations) {
		this.annotations = annotations;
	}

	public int getBookpage() {
		return bookpage;
	}
	public void setBookpage(int bookpage) {
		this.bookpage = bookpage;
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
	public String getInputdate() {
		return inputdate;
	}
	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}
	public String getStorage() {
		return storage;
	}
	public void setStorage(String storage) {
		this.storage = storage;
	}
	
	
	
}
