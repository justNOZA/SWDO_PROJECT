package global.sesoc.archive.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.archive.vo.EBookNumVO;

@Repository
public class RecommendDAO {

	@Autowired
	SqlSession sqlSession;

	public ArrayList<EBookNumVO> RecommendBook(String id) {
		RecommendMapper mapper = sqlSession.getMapper(RecommendMapper.class);
		ArrayList<EBookNumVO> result = null;
		ArrayList<EBookNumVO> data = null;
		result = mapper.RecommendBook(id);
		data = mapper.getHistory(id);
		Restart :
		while(true){
			if(result.size() < data.size()){
				for(int i = 0; i < data.size(); i++){
					for(int j = 0; j < result.size(); j++){
						if(data.get(i).getTitle().equals(result.get(j).getTitle())){
							result.remove(j);
							continue Restart;
						}
					}
				}
				break;
			}
			else{
				for(int i = 0; i < result.size(); i++){
					for(int j = 0; j < data.size(); j++){
						if(data.get(j).getTitle().equals(result.get(i).getTitle())){
							result.remove(i);
							continue Restart;
						}
					}
				}
				break;
			}
		}
		return result;
	}

	public ArrayList<EBookNumVO> RecommendGender(String id) {
		RecommendMapper mapper = sqlSession.getMapper(RecommendMapper.class);
		ArrayList<EBookNumVO> result = null;
		ArrayList<EBookNumVO> data = null;
		result = mapper.RecommendBookGender(id);
		data = mapper.getHistory(id);
		Restart :
			while(true){
				if(result.size() < data.size()){
					for(int i = 0; i < data.size(); i++){
						for(int j = 0; j < result.size(); j++){
							if(data.get(i).getTitle().equals(result.get(j).getTitle())){
								result.remove(j);
								continue Restart;
							}
						}
					}
					break;
				}
				else{
					for(int i = 0; i < result.size(); i++){
						for(int j = 0; j < data.size(); j++){
							if(data.get(j).getTitle().equals(result.get(i).getTitle())){
								result.remove(i);
								continue Restart;
							}
						}
					}
					break;
				}
			}
		return result;
	}

	public ArrayList<EBookNumVO> RecommendAge(String id) {
		RecommendMapper mapper = sqlSession.getMapper(RecommendMapper.class);
		ArrayList<EBookNumVO> result = null;
		ArrayList<EBookNumVO> data = null;
		result = mapper.RecommendBookAge(id);
		data = mapper.getHistory(id);
		Restart :
			while(true){
				if(result.size() < data.size()){
					for(int i = 0; i < data.size(); i++){
						for(int j = 0; j < result.size(); j++){
							if(data.get(i).getTitle().equals(result.get(j).getTitle())){
								result.remove(j);
								continue Restart;
							}
						}
					}
					break;
				}
				else{
					for(int i = 0; i < result.size(); i++){
						for(int j = 0; j < data.size(); j++){
							if(data.get(j).getTitle().equals(result.get(i).getTitle())){
								result.remove(i);
								continue Restart;
							}
						}
					}
					break;
				}
			}
		return result;
	}

	public ArrayList<EBookNumVO> RecommendNothing(String id) {
		RecommendMapper mapper = sqlSession.getMapper(RecommendMapper.class);
		ArrayList<EBookNumVO> result = null;
		ArrayList<EBookNumVO> data = null;
		result = mapper.RecommendBookNothing(id);
		data = mapper.getHistory(id);
		Restart :
			while(true){
				if(result.size() < data.size()){
					for(int i = 0; i < data.size(); i++){
						for(int j = 0; j < result.size(); j++){
							if(data.get(i).getTitle().equals(result.get(j).getTitle())){
								result.remove(j);
								continue Restart;
							}
						}
					}
					break;
				}
				else{
					for(int i = 0; i < result.size(); i++){
						for(int j = 0; j < data.size(); j++){
							if(data.get(j).getTitle().equals(result.get(i).getTitle())){
								result.remove(i);
								continue Restart;
							}
						}
					}
					break;
				}
			}
		return result;
	}

	public ArrayList<EBookNumVO> RecommendNoId() {
		RecommendMapper mapper = sqlSession.getMapper(RecommendMapper.class);
		ArrayList<EBookNumVO> result = null;
		RowBounds rb = new RowBounds(0, 5);
		result = mapper.RecommendNoId(rb);
		return result;
	}
	
	/*
	 RecommendMapper mapper = sqlSession.getMapper(RecommendMapper.class);
	 */
}
