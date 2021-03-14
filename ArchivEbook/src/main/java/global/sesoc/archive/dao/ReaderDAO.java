package global.sesoc.archive.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.archive.vo.Buy_userVO;
import global.sesoc.archive.vo.EBookNumVO;
import global.sesoc.archive.vo.ReadBookVO;

@Repository
public class ReaderDAO {

	@Autowired
	SqlSession sqlSession;

	public ArrayList<Buy_userVO> getLibrary(String id) {
		ReaderMapper mapper = sqlSession.getMapper(ReaderMapper.class);
		ArrayList<Buy_userVO> lib = null;
		lib = mapper.getLibrary(id);
		return lib;
	}

	public ArrayList<Buy_userVO> getWant(String id) {
		ReaderMapper mapper = sqlSession.getMapper(ReaderMapper.class);
		ArrayList<Buy_userVO> want = null;
		want = mapper.getWant(id);
		return want;
	}

	public EBookNumVO getBook(int num) {
		ReaderMapper mapper = sqlSession.getMapper(ReaderMapper.class);
		EBookNumVO result = null;
		result = mapper.getBook(num);
		return result;
	}

	public ReadBookVO getPrevious(ReadBookVO read) {
		ReaderMapper mapper = sqlSession.getMapper(ReaderMapper.class);
		ReadBookVO result = null;
		result = mapper.getPrevious(read);
		return result;
	}

	public void saveInformation(ReadBookVO read) {
		ReaderMapper mapper = sqlSession.getMapper(ReaderMapper.class);
		mapper.saveInformation(read);
	}

	public void deletePreviou(ReadBookVO read) {
		ReaderMapper mapper = sqlSession.getMapper(ReaderMapper.class);
		mapper.deletePreviou(read);
	}
	
	
}
