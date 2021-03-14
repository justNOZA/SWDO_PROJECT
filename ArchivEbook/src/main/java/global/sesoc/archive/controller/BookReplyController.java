package global.sesoc.archive.controller;

import java.util.ArrayList;

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

import global.sesoc.archive.dao.ReplyDAO;
import global.sesoc.archive.util.PageNavigator;
import global.sesoc.archive.vo.Buy_userVO;
import global.sesoc.archive.vo.Reply_BookVO;

@Controller
public class BookReplyController {

	private static final Logger logger = LoggerFactory.getLogger(BookReplyController.class);
	
	@Autowired
	ReplyDAO dao;
	
	final int countPerPage = 10; 
	final int pagePerGroup = 5;
	
	@RequestMapping(value="book_reply", method=RequestMethod.GET)
	public String replyGet(HttpSession session, Model model){
		logger.debug("서평 남기기 들어왔습니다.");
		ArrayList<Buy_userVO> list = new ArrayList<>();
		ArrayList<Buy_userVO> past = new ArrayList<>();
		ArrayList<Buy_userVO> present = new ArrayList<>();
		present = (ArrayList<Buy_userVO>)session.getAttribute("user_present");
		past = (ArrayList<Buy_userVO>)session.getAttribute("user_past");
		if(present != null){
			for(int i = 0; i < present.size(); i++){
				list.add(present.get(i));
			}
		}
		if(past != null){
			for(int i = 0; i < past.size(); i++){
				list.add(past.get(i));
			}
		}
		session.setAttribute("book_list_20190420", list);
		return "BookReply";
	}
	
//	@ResponseBody
//	@RequestMapping(value="check_Ebook", method=RequestMethod.GET)
//	public ArrayList<SearchListVO> check_EbookGET(
//			HttpSession session
//			, Model model
//			, @RequestParam(value="title", defaultValue="") String title
//			){
//		ArrayList<SearchListVO> list = null;
//		list = dao.getEbookList(title);
//		return list;
//	}
//	@ResponseBody
//	@RequestMapping(value="check_book", method=RequestMethod.GET)
//	public ArrayList<SearchListVO> check_bookGET(
//			HttpSession session
//			, Model model
//			, @RequestParam(value="title", defaultValue="") String title
//			){
//		String clientId = "teLQPDQlLSeiwwGD4317";//애플리케이션 클라이언트 아이디값";
//		String clientSecret = "tw8UyiKd0O";//애플리케이션 클라이언트 시크릿값";	        
//		try {
//			String text = URLEncoder.encode(title, "UTF-8"); 
//			String apiURL = "";    
//			apiURL = "https://openapi.naver.com/v1/search/book_adv.xml?d_titl="+ text;
//			URL url = new URL(apiURL);
//			HttpURLConnection con = (HttpURLConnection)url.openConnection();
//			con.setRequestMethod("GET");
//			con.setRequestProperty("X-Naver-Client-Id", clientId);
//			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
//			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
//			String data="";
//			String msg = null;
//			while((msg = br.readLine())!=null){
//				data += msg;
//			}
//			ArrayList<SearchListVO> list = null; //결과데이터 담을 리스트 
//			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
//			XmlPullParser parser = factory.newPullParser(); //연결하는거 담고 
//			parser.setInput(new StringReader(data));
//			int eventType= parser.getEventType();
//			SearchListVO b = null;
//			while(eventType != XmlPullParser.END_DOCUMENT){
//				switch(eventType){
//					case XmlPullParser.START_DOCUMENT: 
//						list = new ArrayList<SearchListVO>();
//						break;
//					case XmlPullParser.END_DOCUMENT://문서의 끝 
//						break;
//					case XmlPullParser.END_TAG: // 추가한 부분 - 배열에 값 넣기
//					{
//						String tag = parser.getName();
//						if(tag.equals("item")){
//							list.add(b);
//							b = null;
//						}
//					}
//					case XmlPullParser.START_TAG://무조건 시작하면 만남 
//					{
//						String tag = parser.getName();
//						switch(tag){//안쪽 스위치
//							case "item":	b = new SearchListVO();break;
//							case "title":	if(b!=null)b.setTitle(parser.nextText());	break;
//							case "image":	if(b!=null)b.setImage(parser.nextText());	break;
//							case "author":	if(b!=null)b.setAuthor(parser.nextText());	break;
//							case "publisher":	if(b!=null)b.setPublisher(parser.nextText());	break;
//							case "isbn":	if(b!=null)b.setIsbn(parser.nextText());	break;
//						}//안쪽 스위치 끝
//						break;
//					}//case 끝
//				}//바깥쪽 스위치 끝
//				eventType =parser.next();
//			}//while문 끝
//			return list;
//		}
//		catch(Exception e){
//			logger.debug("error : {}",e);
//			return null;
//		}
//	}
	
	@RequestMapping(value="reply_book", method=RequestMethod.POST)
	public String replyPOST(String title
				, String publisher
				, int point
				, String content
				, HttpSession session){
		logger.debug("title : {}", title);
		logger.debug("publisher : {}", publisher);
		logger.debug("point : {}", point);
		logger.debug("content : {}", content);
		Reply_BookVO rb = new Reply_BookVO();
		rb.setContent(content);
		rb.setPoint(point);
		rb.setPublisher(publisher);
		rb.setTitle(title);
		String id = (String)session.getAttribute("loginId");
		String nick = (String)session.getAttribute("loginNickname");
		rb.setId(id);
		rb.setNickname(nick);
		dao.setReply(rb);
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value="reply_ajax_book", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	public void replyAjax(String title
			, String publisher
			, int point
			, String content
			, HttpSession session){
		logger.debug("title : {}", title);
		logger.debug("publisher : {}", publisher);
		logger.debug("point : {}", point);
		logger.debug("content : {}", content);
		Reply_BookVO rb = new Reply_BookVO();
		rb.setContent(content);
		rb.setPoint(point);
		rb.setPublisher(publisher);
		rb.setTitle(title);
		String id = (String)session.getAttribute("loginId");
		String nick = (String)session.getAttribute("loginNickname");
		rb.setId(id);
		rb.setNickname(nick);
		dao.setReply(rb);
	}
	
	@ResponseBody
	@RequestMapping(value="checkTitle", method=RequestMethod.GET, produces="application/json;charset=UTF-8")
	public int checkTitle(String title, HttpSession session){
		ArrayList<Buy_userVO> list = new ArrayList<>();
		list = (ArrayList<Buy_userVO>)session.getAttribute("book_list_20190420");
		if(list != null){
			for(int i = 0; i < list.size(); i++){
				if(list.get(i).getTitle().equals(title)){
					return 1;
				}
			}
		}
		return 0;
	}
	
}
