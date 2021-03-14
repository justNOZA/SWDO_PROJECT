package global.sesoc.archive.vo;

public class Used_DataVO {
	
	String id;			//회원가입된 아이디
	String nickname;	//가입된 회원의 별칭
	String search;		//검색 기록
	int Buy;			//구매 내역
	public Used_DataVO() {
		super();
		// TODO Auto-generated constructor stub
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
	public int getBuy() {
		return Buy;
	}
	public void setBuy(int buy) {
		Buy = buy;
	}
	public Used_DataVO(String id, String nickname, String search, int buy) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.search = search;
		Buy = buy;
	}
	@Override
	public String toString() {
		return "Used_DataVO [id=" + id + ", nickname=" + nickname + ", search=" + search + ", Buy=" + Buy + "]";
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	
	
	
}
