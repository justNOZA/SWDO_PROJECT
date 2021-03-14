package global.sesoc.archive.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import global.sesoc.archive.dao.InterCeptorDAO;
import global.sesoc.archive.vo.CommunityVO;


public class GroupInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(GroupInterceptor.class);
	@Autowired
	InterCeptorDAO dao;
	//콘트롤러의 메서드 실행 전에 처리
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.debug("GroupInterceptor");
		//세션의 로그인 정보 읽기
		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("loginId");
		Object groupnum = session.getAttribute("groupnum");
		if(groupnum == null ){
			response.sendRedirect(request.getContextPath() + "/");
			return false;
		}
		int gnum = (int)groupnum;
		CommunityVO cv = new CommunityVO();
		cv.setId(loginId);
		cv.setGroupnum(gnum);
		CommunityVO result = dao.test(cv);
		if(result == null){
			response.sendRedirect(request.getContextPath() + "/groupList");
			return false;
		}
		//로그인 된 경우 요청한 경로로 진행
		return super.preHandle(request, response, handler);
	}

}