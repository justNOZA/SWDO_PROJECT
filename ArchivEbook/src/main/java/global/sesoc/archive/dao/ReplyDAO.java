package global.sesoc.archive.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.archive.vo.Reply_BookVO;
import global.sesoc.archive.vo.SearchListVO;

@Repository
public class ReplyDAO {

	@Autowired
	SqlSession sqlSession;
	
	public void setReply(Reply_BookVO rb) {
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		mapper.setReply(rb);
	}

	public ArrayList<SearchListVO> getEbookList(String title) {
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		ArrayList<SearchListVO> list = null;
		list = mapper.getEbookList(title);
		return list;
	}

	public ArrayList<Reply_BookVO> getReply(String title, String publisher) {
		// TODO Auto-generated method stub
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		ArrayList<Reply_BookVO> result = null;
		Reply_BookVO check = new Reply_BookVO();
		check.setTitle(title);
		check.setPublisher(publisher);
		result = mapper.getReply(check);
		return result;
	}

	public Double totalPoint(String title, String publisher) {
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		Reply_BookVO check = new Reply_BookVO();
		check.setTitle(title);
		check.setPublisher(publisher);
		String result = mapper.totalPoint(check);
		if(result == null || result.isEmpty() || result.equals("")){
			return 0.0;
		}
		Double result2 = Double.parseDouble(result);
		return result2;
	}

	public ArrayList<Reply_BookVO> getMyList(String id, int start, int count) {
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		ArrayList<Reply_BookVO> result = null;
		RowBounds rb = new RowBounds(start, count);
		result = mapper.getMyList(id, rb);
		return result;
	}

	public int getMyTotal(String id) {
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		int result = 0;
		result = mapper.getMyTotal(id);
		return result;
	}
}
