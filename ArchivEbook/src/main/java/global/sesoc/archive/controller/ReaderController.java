package global.sesoc.archive.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.archive.HomeController;
import global.sesoc.archive.tts.APIExamTTS;
import global.sesoc.archive.dao.ReaderDAO;
import global.sesoc.archive.vo.ReadBookVO;

@Controller
public class ReaderController {

	@Autowired
	SqlSession SqlSession;
	@Autowired
	ReaderDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(ReaderController.class);
	
	@RequestMapping(value = "view", method = RequestMethod.GET)
	public String home(int num, HttpSession session) {
		logger.info("index : {}", num);
		session.setAttribute("viewNumber", num);
		return "redirect:read";
	}
	
	@RequestMapping(value = "read", method = RequestMethod.GET)
	public String home2(Model model, HttpSession session) {
		logger.debug("read");
		int num = (int)session.getAttribute("viewNumber");
		String id = (String)session.getAttribute("loginId");
		ReadBookVO read = new ReadBookVO();
		read.setBooknum(num);
		read.setId(id);
		ReadBookVO result = dao.getPrevious(read);
		String bookname = dao.getBook(num).getTitle();
		model.addAttribute("title", bookname);
		if(result.getStorage() != null || result.getStorage() != ""){
			model.addAttribute("previousLocationCfi", result.getStorage());
		}
		
		return "viewer";
	}
	
	@ResponseBody
	@RequestMapping(value = "saveInformation", method = RequestMethod.POST, produces="application/json; charset=UTF-8")
	public void saveInformation(String information, String annotations, String bookmarks, HttpSession session) {
		logger.debug("information : {}", information);
		int num = (int)session.getAttribute("viewNumber");
		logger.debug(""+num);
		String id = (String)session.getAttribute("loginId");
		ReadBookVO read = new ReadBookVO();
		read.setBooknum(num);
		read.setId(id);
		read.setStorage(information);
		read.setAnnotations(annotations);
		read.setBookmarks(bookmarks);
		dao.saveInformation(read);
	}
	
	@ResponseBody
	@RequestMapping(value = "getStorage", method = RequestMethod.GET, produces="application/json; charset=UTF-8")
	public String getStorage(HttpSession session) {
		logger.debug("gerStorage");
		int num = (int)session.getAttribute("viewNumber");
		String id = (String)session.getAttribute("loginId");
		ReadBookVO read = new ReadBookVO();
		read.setBooknum(num);
		read.setId(id);
		ReadBookVO result = dao.getPrevious(read);
		logger.debug("가져올 때 : "+result.getStorage());
		return result.getStorage();
	}

	@ResponseBody
	@RequestMapping(value = "deletePrevious", method = RequestMethod.GET, produces="application/json; charset=UTF-8")
	public void deletePreviou(HttpSession session) {
		logger.debug("delete");
		int num = (int)session.getAttribute("viewNumber");
		String id = (String)session.getAttribute("loginId");
		ReadBookVO read = new ReadBookVO();
		read.setBooknum(num);
		read.setId(id);
		ReadBookVO setting = dao.getPrevious(read);
		logger.debug("이전 저장{}",setting);
		String storage = setting.getStorage();
		String[] settings = storage.split("\"");
		storage = "";
		for(int i = 0; i < settings.length; i++){
			if(settings[i].equals("previousLocationCfi")){
				settings[i+2] = "";
			}
			if(i != settings.length-1){
				storage += settings[i]+"\"";
			}
			else{
				storage += settings[i];
			}
		}
		logger.debug("수정한거 : "+storage);
		setting.setStorage(storage);
		logger.debug("{}"+setting);
		dao.deletePreviou(setting);
	}

	@ResponseBody
	@RequestMapping(value = "textToSpeech", method = RequestMethod.POST, produces="application/json; charset=UTF-8")
	public String textToSpeech(HttpSession session, String index) {
		logger.debug("text : "+index);
		APIExamTTS tts = new APIExamTTS();
		String mp3 = tts.TTS(index);
		logger.debug(mp3);
		return mp3;
	}
}
