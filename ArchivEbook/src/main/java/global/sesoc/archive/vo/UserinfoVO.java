package global.sesoc.archive.vo;

public class UserinfoVO {
	String id;
	String password;
	String nickname;
	String name;
	int gender;			//성별. 남0 / 여1
	String birthday;	//회원의 생년월일 정보
	String email;		//회원의 이메일 아이디 정보
	int portalNum;		// 이메일 포털 번호
	int identify;		// 본인 인증 확인 
	String inputdate;	//가입일
	
	public UserinfoVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserinfoVO(String id, String password, String nickname, String name, int gender, String birthday,
			String email, int portalNum, int identify, String inputdate) {
		super();
		this.id = id;
		this.password = password;
		this.nickname = nickname;
		this.name = name;
		this.gender = gender;
		this.birthday = birthday;
		this.email = email;
		this.portalNum = portalNum;
		this.identify = identify;
		this.inputdate = inputdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPortalNum() {
		return portalNum;
	}
	public void setPortalNum(int portalNum) {
		this.portalNum = portalNum;
	}
	public int getIdentify() {
		return identify;
	}
	public void setIdentify(int identify) {
		this.identify = identify;
	}
	public String getInputdate() {
		return inputdate;
	}
	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}
	@Override
	public String toString() {
		return "UserinfoVO [id=" + id + ", password=" + password + ", nickname=" + nickname + ", name=" + name
				+ ", gender=" + gender + ", birthday=" + birthday + ", email=" + email + ", portalNum=" + portalNum
				+ ", identify=" + identify + ", inputdate=" + inputdate + "]";
	}
	
	
	
	
}
