package global.sesoc.archive.dao;

import java.util.HashMap;

import global.sesoc.archive.vo.Buy_userVO;
import global.sesoc.archive.vo.ReadBookVO;

public interface PayMapper {

	void setBuy_user(HashMap<String, Object> map);

	void setUsed_data(HashMap<String, Object> map);

	Buy_userVO getWantBook(HashMap<String, Object> map);

	void updateWant(HashMap<String, Object> map);

	void setReadBook(HashMap<String, Object> map);

	void updateBook(HashMap<String, Object> map);

	void updateReadbook(HashMap<String, Object> map);

	void updatePastBook(HashMap<String, Object> map);

}
