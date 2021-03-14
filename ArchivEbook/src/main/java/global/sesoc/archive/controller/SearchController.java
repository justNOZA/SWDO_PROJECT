package global.sesoc.archive.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import global.sesoc.archive.api.LibLocation;
import global.sesoc.archive.api.bookInfo;
import global.sesoc.archive.api.bookSearch;
import global.sesoc.archive.api.libSearch;
import global.sesoc.archive.dao.EbookDAO;
import global.sesoc.archive.dao.ReplyDAO;
import global.sesoc.archive.vo.EBookNumVO;
import global.sesoc.archive.vo.LibraryVO;
import global.sesoc.archive.vo.LivInfoVO;
import global.sesoc.archive.vo.Reply_BookVO;
import global.sesoc.archive.vo.SearchListVO;
import oracle.net.aso.i;


@Controller
public class SearchController {
	
	@Autowired
	EbookDAO dao;
	
	@Autowired
	ReplyDAO redao;
	
	
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	
	/* 
	 * 책 검색
	 * 1)DB검색 - eBook 검색 - 사진 가져오는건 재성이가
	 * 2)API검색 - eBook없는, 네이버API에서 가져오는 책들
	 *  */
	@RequestMapping(value = "/searchList", method = RequestMethod.GET)
	public String searchBook2(String bookName,String detail, Model model, HttpSession session) {
		
		/*1) DB검색*/
		//웹에서 고객이 검색한 값 확인 (저자 - author, title1 or title2, publisher -> 아카이브로 출력, 나머지는 없음) 
		ArrayList<EBookNumVO> ebook = null; //booknum, title, author, publisher 가지고 있는 객체
		//1)통합검색
			if(detail.equals("total")) {
				ebook = dao.total(bookName);
				model.addAttribute("ebook", ebook);
				if(ebook != null && ebook.size() != 0){
					session.setAttribute("ebookExist", true);
				}
			}
		//2)책 제목 검색
			if(detail.equals("title")){
				//제목 사이에 - 가 들어가 있는 이북 DB자료 고려
					String bookName2 = bookName.replaceAll(" ", "-");
					//System.out.println("-붙인 검색 값 : " + bookName2);
					
				ebook = dao.title(bookName2);
				//-빼고 출력하기
					for(EBookNumVO i : ebook){i.setTitle(i.getTitle().replaceAll("-", " "));}
				model.addAttribute("ebook", ebook);
			}
		//3)저자 검색
			if(detail.equals("author")){
				ebook = dao.author(bookName);
				model.addAttribute("ebook", ebook);
			}
		//4)출판사 검색
			if(detail.equals("publisher")){
				ebook = dao.pub(bookName);
				model.addAttribute("ebook", ebook);
			}
		
		/*2) API검색*/
		//웹에서 고객이 검색한 값 확인
			//logger.info("\n\n통합 검색 입력 값:{}, 상세 검색 입력 값:{}\n",bookName,detail);
        
		//API 실행할 클래스 수입, 생성
			bookSearch booksearch = new bookSearch();
			ArrayList<SearchListVO> list = new ArrayList<SearchListVO>();
		
		//API 메서드 실행, 값 받아오기, 값 확인
			list = booksearch.booksearch(bookName, detail);
			//logger.info("bookSearch에서 컨트롤러로 보낸 값:{}",list);
		
		//모델에 검색 결과 저장
			model.addAttribute("data",list);
		        		
        return "searchList";
	}//매핑 끝
		   
	
	/* 
	 * 도서별 정보 페이지
	 * 1)isbn값 받고 일반도서 정보 출력 - bookInfo
	 * 2)booknum값 받고 ebook 정보 출력 - ebookInfo
	 * */
	@RequestMapping(value = "/bookInfo", method = RequestMethod.GET)
	public String bookinfo(String isbn, Model model) {
		
		//web에서 입력된 isbn값 확인
		//logger.info("\n\n 단일 도서 검색 입력 값:{}",isbn);
		
		//ISBN 13 추출
		int fact1 = isbn.indexOf(" ")+1;
		int fact2 = isbn.length();
		isbn = isbn.substring(fact1, fact2);
		
		/*책 정보 출력 API*/	
			//API 클래스 수입, 선언
				bookInfo searchBook = new bookInfo();
				ArrayList<SearchListVO> list = new ArrayList<SearchListVO>();
			
			//API 메서드 실행 후 값 받아오기
				list = searchBook.bookinfo(isbn);
			//logger.info("bookInfo클래스에서 컨트롤러로 넘겨준 값:{}",list);
				String title = list.get(0).getTitle();
				String publisher = list.get(0).getPublisher();
				ArrayList<Reply_BookVO> rb = null;
				rb = redao.getReply(title, publisher);
				double tp = redao.totalPoint(title,publisher);
			//받아온 값 모델에 저장
				model.addAttribute("totalPoint", tp);
				model.addAttribute("book_reply", rb);
				model.addAttribute("data", list);

		return "bookInfo";
	}//매핑 끝
	
	@RequestMapping(value = "/ebookInfo", method = RequestMethod.GET)
	public String ebookinfo(String bookNum, Model model) {
		
		//web에서 입력된 bookNum값 확인
			int num = Integer.parseInt(bookNum);
			logger.info("도서 검색 목록에서 넘겨받은 이북의 bookNum: {}",bookNum);
		
		//컨트롤러 - DB 정보교환
			EBookNumVO ebook = new EBookNumVO();
			ebook = dao.num(num);
			String title = ebook.getTitle();
			String publisher = ebook.getPublisher();
			ArrayList<Reply_BookVO> rb = null;
			rb = redao.getReply(title, publisher);
			double tp = redao.totalPoint(title,publisher);
			model.addAttribute("realTitle", ebook.getTitle());
		//받아온 값 모델에 저장
			// "-" 지우기
			ebook.setTitle(ebook.getTitle().replaceAll("-", " "));
			model.addAttribute("totalPoint", tp);
			model.addAttribute("book_reply", rb);
			model.addAttribute("ebook", ebook);
			
		return "ebookInfo";
	}//매핑 끝
	
	
	@ResponseBody
	@RequestMapping(value = "/libList", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	public ArrayList<LivInfoVO> libList(String isbn) {
	
		//web에서 입력된 isbn값 확인
		logger.info("\n\n 자바 스크립트 -> libList매퍼에서 받은 도서 검색 입력 값:{}",isbn);
		
		//ISBN 13 추출
			int fact1 = isbn.indexOf(" ")+1;
			int fact2 = isbn.length();
			isbn = isbn.substring(fact1, fact2);
		
			//logger.info("\n\n 변환 후 isbn값:{}",isbn);	
		
		/*도서관 정보 출력 API*/
			//API 클래스 수입, 선언
				//1차 - 도서관 목록 객체배열 선언
				libSearch libsearch = new libSearch();
				ArrayList<LibraryVO> liblist = new ArrayList<LibraryVO>();
				//2차 - 도서관별 위치 객체배열 선언
				LibLocation libLocation = new LibLocation();
				ArrayList<LivInfoVO> locationList = new ArrayList<LivInfoVO>();
				
			//API 메서드 실행값 받아오기
				//1차 - 도서관 이름, 도서관 코드, 요청 코드 가져오기
				liblist = libsearch.libsearch(isbn);
				//logger.info("\nLibSearch 클래스에서 컨트롤러로 넘겨준 값(도서관 목록):{}\n",liblist);
				
				//2차 - 도서관 이름, 주소, 전화번호, 홈페이지 가져오기
				for(LibraryVO i : liblist){
					locationList.add(libLocation.libLocation(i.getLIB_CODE()));
				}
				
				//전달 받은 값 확인차 출력
				int j = 0;
				for(LivInfoVO i : locationList){
					j++;
					System.out.println(j + "번째 도서관 이름: "+i.getNAME());
					System.out.println(j + "번째 도서관 주소: "+i.getADDRESS());
					System.out.println(j + "번째 도서관 전화번호: "+i.getTEL());
				}
				
				//
				return locationList;
	}//매핑 끝
}//컨트롤러 끝 