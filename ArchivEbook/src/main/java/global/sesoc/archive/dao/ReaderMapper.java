package global.sesoc.archive.dao;

import java.util.ArrayList;

import global.sesoc.archive.vo.Buy_userVO;
import global.sesoc.archive.vo.EBookNumVO;
import global.sesoc.archive.vo.ReadBookVO;

public interface ReaderMapper {

	public ArrayList<Buy_userVO> getLibrary(String id);

	public ArrayList<Buy_userVO> getWant(String id);

	public EBookNumVO getBook(int num);

	public ReadBookVO getPrevious(ReadBookVO read);

	public void saveInformation(ReadBookVO read);

	public void deletePreviou(ReadBookVO read);

}
