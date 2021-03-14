package global.sesoc.archive.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.archive.dao.GroupDAO;
import global.sesoc.archive.dao.MemberDAO;
import global.sesoc.archive.dao.ReaderDAO;
import global.sesoc.archive.dao.ReplyDAO;
import global.sesoc.archive.interceptor.LoginInterceptor;
import global.sesoc.archive.util.PageNavigator;
import global.sesoc.archive.vo.Buy_userVO;
import global.sesoc.archive.vo.CommunityVO;
import global.sesoc.archive.vo.Reply_BookVO;
import global.sesoc.archive.vo.UserinfoVO;

@Controller	
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberDAO dao;
	
	@Autowired
	ReaderDAO readerDao;
	
	@Autowired
	ReplyDAO replyDao;
	
	@Autowired
	GroupDAO groupDao;
	
	final int countPerPage = 10; 
	final int pagePerGroup = 5;
	
	
	//login 하기 위한 login.jsp 폼으로 가는부분
	@RequestMapping (value="login", method=RequestMethod.POST)
	public String login(String id, String password, Model model, HttpSession session) {
		logger.debug("id:{}, password:{}",id,password);
		//ID와 비밀번호가 맞으면 세션에 ID와 회원이름을 저장하고 메인화면으로 이동
		UserinfoVO vo = null;
		
		vo = dao.getMember(id);
		logger.debug("{}",vo);
		
		if(vo != null && vo.getPassword().equals(password)){
			double calDateDays = 0;
			ArrayList<Buy_userVO> lib = readerDao.getLibrary(id);
			ArrayList<Buy_userVO> past = new ArrayList<>();
			ArrayList<Buy_userVO> present = new ArrayList<>();
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
				lib.get(i).setInputdate(year+"/ "+month+"/ "+day);
				
				if(lib.get(i).getDay() < calDateDays){
					past.add(lib.get(i));
				}
				else{
					present.add(lib.get(i));
				}
			}
			session.setAttribute("user_past", past);
			session.setAttribute("user_present", present);
			
			
			session.setAttribute("loginId", id);
			session.setAttribute("loginNickname", vo.getNickname());
			session.setAttribute("loginName", vo.getName());
		}
		return "redirect:/";			
	}
	
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(UserinfoVO vo) {
		logger.debug("vo:{}", vo);
		int cnt = dao.insertMember(vo);

		return "redirect:/";
	}
	
	@RequestMapping (value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		//세션 정보 삭제
		logger.debug("logout");
		session.invalidate();

		return "redirect:/";
	}
	
	
	//MyController 이동
	@RequestMapping (value="my-account", method=RequestMethod.GET)
	public String myAccount(Model model, HttpSession session
			, @RequestParam(value="page", defaultValue="1") int page
			, String check_navi2) {
		logger.info("my-account 들어옴");
		String id = (String)session.getAttribute("loginId"); // 세션에 있는 "loginid"를  그대로 쓸 수 없어서, 자바형식으로 재정의해준다 
		UserinfoVO vo = dao.getMember(id);
		
		model.addAttribute("user_vo", vo);
		
		int total = 0;
		total = replyDao.getMyTotal(id);
		PageNavigator pageNavigator 
		= new PageNavigator(countPerPage, pagePerGroup, page, total);
		ArrayList<Reply_BookVO> list = null;
		list = replyDao.getMyList(id, pageNavigator.getStartRecord(), pageNavigator.getCountPerPage());
		session.setAttribute("navi2", pageNavigator);
		model.addAttribute("reply_list_user", list);
		
		ArrayList<Buy_userVO> want = null;	//구매를 하면 찜목록에서 삭제 꼭 할 것!!!!!!
		want = readerDao.getWant(id);
		model.addAttribute("user_want", want);
		model.addAttribute("check_navi2", check_navi2);
		
		ArrayList<CommunityVO> my_group = null;
		ArrayList<CommunityVO> group_master = new ArrayList<>();
		my_group = groupDao.getList_user(id);
		model.addAttribute("group_list_user", my_group);
		if(my_group != null){
			for(int i = 0; i < my_group.size(); i++){
				if(my_group.get(i).getGroup_master() == 0){
					logger.debug("{}",my_group.get(i));
					group_master.add(groupDao.getMaster(my_group.get(i).getGroupnum()));
				}
			}
		}
		logger.debug("{}",my_group);
		logger.debug("{}",group_master);
		model.addAttribute("group_master", group_master);
		
		return "my-account";
	}

		
		
	//YOUR PERSONAL INFORMATION 
	@RequestMapping (value="update", method=RequestMethod.POST)
	public String update(UserinfoVO vo, HttpSession session) {
		logger.debug("vo:{}", vo);			
		dao.updateinfo(vo);
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value="wantBook", method=RequestMethod.GET, produces="application/json;charset=UTF-8")
	public String setWant(String booknum, HttpSession session){
		String id = (String)session.getAttribute("loginId");
		String nickname = (String)session.getAttribute("loginNickname");
		Buy_userVO bu = new Buy_userVO();
		logger.debug(booknum);
		int booknum2 = Integer.parseInt(booknum);
		bu.setId(id);
		bu.setNickname(nickname);
		bu.setBooknum(booknum2);
		if(dao.checkWant(bu)){
			return "fail";
		}
		dao.setWant(bu);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping(value="checkID", method=RequestMethod.GET, produces="application/json;charset=UTF-8")
	public String checkID(String id){
		logger.debug(id);
		int result = 0;
		result = dao.checkID(id);
		return ""+result;
	}
	@ResponseBody
	@RequestMapping(value="checkNICK", method=RequestMethod.GET, produces="application/json;charset=UTF-8")
	public String checkNICK(String nick){
		logger.debug(nick);
		int result = 0;
		result = dao.checkNick(nick);
		return ""+result;
	}
}
