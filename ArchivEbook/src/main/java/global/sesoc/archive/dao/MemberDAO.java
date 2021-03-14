package global.sesoc.archive.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.archive.vo.Buy_userVO;
import global.sesoc.archive.vo.UserinfoVO;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public int insertMember(UserinfoVO vo) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		int count = 0;
		count = mapper.insertMember(vo);
		
		return count;
	}
	
	//로그인 위해 객체 하나 가져오기
	public UserinfoVO getMember(String id) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);		
		UserinfoVO vo = null;
		vo = mapper.getMember(id);
		
		return vo;
	}

	public int updateinfo(UserinfoVO vo) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);		
		mapper.updateinfo(vo);		
		return 0;
	}

	public void setWant(Buy_userVO bu) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);		
		mapper.setWant(bu);
	}

	public boolean checkWant(Buy_userVO bu) {
		PayMapper mapper = sqlSession.getMapper(PayMapper.class);	
		Buy_userVO result = null;
		HashMap<String, Object> map = new HashMap<>();
		map.put("booknum", bu.getBooknum());
		map.put("id", bu.getId());
		result = mapper.getWantBook(map);
		if(result == null){
			return false;
		}
		return true;
	}

	public int checkID(String id) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);	
		int result = 0;
		result = mapper.checkID(id);
		return result;
	}

	public int checkNick(String nick) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);	
		int result = 0;
		result = mapper.checkNick(nick);
		return result;
	}


}
