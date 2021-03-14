package global.sesoc.archive.interceptor;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import global.sesoc.archive.vo.Buy_userVO;

/**
 * 사용자 구매 확인 인터셉터. HandlerInterceptorAdapter를 상속받아서 정의.
 */
public class ViewInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(ViewInterceptor.class);

	//콘트롤러의 메서드 실행 전에 처리
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.debug("뷰어 인터셉터 지나가유");
		//세션의 정보 읽기
		HttpSession session = request.getSession();
		ArrayList<Buy_userVO> present = (ArrayList<Buy_userVO>)session.getAttribute("user_present");
		int check = 0;
		if(session.getAttribute("viewNumber") != null){
			int num = (int)session.getAttribute("viewNumber");
			for(int i = 0; i < present.size(); i++){
				if(present.get(i).getBooknum() == num){
					check = 1;
				}
			}
		}
		if (check == 0) {
			//request.getContextPath()로 루트 경로를 구하여 절대 경로로 처리
			response.sendRedirect(request.getContextPath() + "/");
			return false;
		}
		//구매 된 경우 요청한 경로로 진행
		return super.preHandle(request, response, handler);
	}

}
