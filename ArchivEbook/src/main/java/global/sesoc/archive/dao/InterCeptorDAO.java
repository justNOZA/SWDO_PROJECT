package global.sesoc.archive.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.archive.vo.CommunityVO;

@Repository
public class InterCeptorDAO {

	@Autowired
	SqlSession sqlSession;

	public CommunityVO test(CommunityVO cv) {
		InterCeptorMapper mapper = sqlSession.getMapper(InterCeptorMapper.class);
		CommunityVO result = null;
		result = mapper.test(cv);
		return result;
	}
	
	
}
