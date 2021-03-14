package global.sesoc.archive.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.archive.vo.EBookNumVO;

public interface RecommendMapper {

	ArrayList<EBookNumVO> RecommendBook(String id);
	ArrayList<EBookNumVO> RecommendBookAge(String id);
	ArrayList<EBookNumVO> RecommendBookGender(String id);
	ArrayList<EBookNumVO> RecommendBookNothing(String id);
	ArrayList<EBookNumVO> getHistory(String id);
	ArrayList<EBookNumVO> RecommendNoId(RowBounds rb);

}
