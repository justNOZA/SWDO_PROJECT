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

import global.sesoc.archive.dao.RecommendDAO;
import global.sesoc.archive.vo.EBookNumVO;

@Controller
public class RecommendController {

	@Autowired
	RecommendDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(RecommendController.class);
	
	@RequestMapping(value="recommend", method = RequestMethod.GET)
	public String recommend(Model model, HttpSession session){
		ArrayList<EBookNumVO> list = null;
		ArrayList<EBookNumVO> listAge = null;
		ArrayList<EBookNumVO> listNothing = null;
		ArrayList<EBookNumVO> listGender = null;
		
		String id = (String)session.getAttribute("loginId");
		if(id == null || id.isEmpty()){
			list = dao.RecommendNoId();
			model.addAttribute("recommend", list);
			return "recommend";
		}
		list = dao.RecommendBook(id);
		listAge = dao.RecommendAge(id);
		listGender = dao.RecommendGender(id);
		listNothing = dao.RecommendNothing(id);
		if(list == null || list.size() == 0){
			if(listNothing == null || listNothing.size() == 0){
				list = dao.RecommendNoId();
				model.addAttribute("recommend", list);
			}
			else{
				model.addAttribute("recommend", listNothing);
			}
		}
		else{
			model.addAttribute("recommend", list);
		}
		model.addAttribute("recommendGender", listGender);
		model.addAttribute("AgeRe", listAge);
		return "recommend";
	}
}
