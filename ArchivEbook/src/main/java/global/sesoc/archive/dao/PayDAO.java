package global.sesoc.archive.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.archive.controller.PayController;
import global.sesoc.archive.vo.Buy_userVO;
import global.sesoc.archive.vo.ReadBookVO;

@Repository
public class PayDAO {

	@Autowired
	SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(PayController.class);

	public void setBuy_user(HashMap<String, Object> map) {
		PayMapper mapper = sqlSession.getMapper(PayMapper.class);
		Buy_userVO want = mapper.getWantBook(map);//
		logger.debug("{}",map.get("used"));
		int num = (int)map.get("used");
		if(want == null){
			if(num != 1){
				mapper.setBuy_user(map);//
				if(num == 0){
					logger.debug("새롭게 구매");
					mapper.setReadBook(map);//
				}
			}
		}
		else{
			if(num != 1){
				if(num == 2){
					logger.debug("옛날에 대여했던 책2");
					mapper.updatePastBook(map);
					mapper.updateReadbook(map);//
				}
				else{
					logger.debug("찜목록");
					mapper.updateWant(map);//
					mapper.setReadBook(map);//
				}
			}
			else{
				logger.debug("연장2");
				mapper.updateBook(map);	//
			}
		}
	}

	public void setUsed_data(HashMap<String, Object> map) {
		PayMapper mapper = sqlSession.getMapper(PayMapper.class);
		mapper.setUsed_data(map);//
	}
}
