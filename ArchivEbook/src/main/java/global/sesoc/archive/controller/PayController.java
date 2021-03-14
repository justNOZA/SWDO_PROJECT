package global.sesoc.archive.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.archive.dao.PayDAO;
import global.sesoc.archive.dao.ReaderDAO;
import global.sesoc.archive.vo.Buy_userVO;
import global.sesoc.archive.vo.EBookNumVO;

@Controller
public class PayController {

	private static final Logger logger = LoggerFactory.getLogger(PayController.class);
	
	@Autowired
	PayDAO dao;
	
	@Autowired
	ReaderDAO readerDao;
	
	@RequestMapping(value="buyBook", method=RequestMethod.GET)
	public String buyBook(
			@RequestParam(value="booknum", defaultValue="0")int booknum
			, HttpSession session){
		logger.debug("구매하려는 책 번호 : {}", booknum);
		if(booknum == 0){
			return "redirect:/";
		}
		EBookNumVO book = readerDao.getBook(booknum);
		session.setAttribute("want_book_info", book);
		return "pay";
	}
	@RequestMapping(value="payment", method=RequestMethod.GET)
	public String pay(String type, String price, Model model){
		logger.debug("type : {}, price :{}", type, price);
		int priceI = 0;
		if(price.equals("$2.00")){
			priceI = 2;
		}
		else if(price.equals("$4.00")){
			priceI = 4;
		}
		else{
			priceI = 6;
		}
		model.addAttribute("type", type);
		model.addAttribute("price", priceI);
		return "pay_";
	}
	@ResponseBody
	@RequestMapping(value="payment", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	public void payPost(String type, String price, Model model, HttpSession session){
		logger.debug("POST type : {}, price :{}", type, price);
		String id = (String)session.getAttribute("loginId");
		String nick = (String)session.getAttribute("loginNickname");
		EBookNumVO booknum = (EBookNumVO)session.getAttribute("want_book_info");
		ArrayList<Buy_userVO> past = (ArrayList<Buy_userVO>)session.getAttribute("user_past");
		ArrayList<Buy_userVO> present = (ArrayList<Buy_userVO>)session.getAttribute("user_present");

		int typeNum = 0;
		if(type.equals("hyundai")) typeNum = 1;
		if(type.equals("shinhan")) typeNum = 2;
		if(type.equals("kb")) typeNum = 3;
		if(type.equals("nh")) typeNum = 4;
		if(type.equals("gwangju")) typeNum = 5;
		if(type.equals("ibk")) typeNum = 6;
		
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("nickname", nick);
		map.put("card", typeNum);
		map.put("day", price);
		map.put("booknum", booknum.getBooknum());
		map.put("title", booknum.getTitle());

		map.put("used", 0);
		for(int i = 0; i < present.size(); i++){
			if(present.get(i).getBooknum() == booknum.getBooknum()){
				map.put("used", 1);
			}
		}
		for(int i = 0; i < past.size(); i++){
			if(past.get(i).getBooknum() == booknum.getBooknum()){
				map.put("used", 2);
			}
		}
		
		logger.debug("{}",map);
		dao.setBuy_user(map);
		dao.setUsed_data(map);
		
		double calDateDays = 0;
		ArrayList<Buy_userVO> lib = readerDao.getLibrary(id);
		ArrayList<Buy_userVO> past2 = new ArrayList<>();
		ArrayList<Buy_userVO> present2 = new ArrayList<>();
		for(int i = 0; i < lib.size(); i++){
			String input = lib.get(i).getInputdate()+"";
			try{ 
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd-hh-mm-ss");
		    	Date FirstDate = format.parse(input);
		    	Date today = new Date();
		    	double calDate = today.getTime() - FirstDate.getTime(); 
		        calDateDays = calDate / ( 24.0*60*60*1000);
		        }
			catch(Exception e){}
			
			String[] inputdate = lib.get(i).getInputdate().split("-");
			String year = inputdate[0];
			String month = inputdate[1];
			String day = inputdate[2];
			lib.get(i).setInputdate(year+"/"+month+"/"+day);
			
			if(lib.get(i).getDay() < calDateDays){
				past2.add(lib.get(i));
			}
			else{
				present2.add(lib.get(i));
			}
		}
		session.setAttribute("user_past", past2);
		session.setAttribute("user_present", present2);
	}
	
}
