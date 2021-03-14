package global.sesoc.archive.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.archive.vo.Reply_BookVO;
import global.sesoc.archive.vo.SearchListVO;

public interface ReplyMapper {

	public void setReply(Reply_BookVO rb);

	public ArrayList<SearchListVO> getEbookList(String title);

	public ArrayList<Reply_BookVO> getReply(Reply_BookVO result);

	public String totalPoint(Reply_BookVO check);

	public ArrayList<Reply_BookVO> getMyList(String id, RowBounds rb);

	public int getMyTotal(String id);

}
