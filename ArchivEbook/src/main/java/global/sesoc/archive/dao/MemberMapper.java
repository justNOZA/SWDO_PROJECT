package global.sesoc.archive.dao;

import global.sesoc.archive.vo.Buy_userVO;
import global.sesoc.archive.vo.UserinfoVO;

public interface MemberMapper {

	public int insertMember(UserinfoVO vo);

	public UserinfoVO getMember(String id);

	public void updateinfo(UserinfoVO vo);

	public void setWant(Buy_userVO bu);


	public int checkNick(String nick);

	public int checkID(String id);

}
