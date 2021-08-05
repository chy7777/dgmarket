package ga.dgmarket.gymshopping.aop.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;

import ga.dgmarket.gymshopping.exception.AdminExistException;
import ga.dgmarket.gymshopping.exception.MemberExistException;

//관리자 기능을 이루는 모든 기능마다 공통 로직으로 작동하는 세션검증코드
public class AdminSessionCheckAspect {
	public Object sessionCheck(ProceedingJoinPoint joinPoint) throws Throwable{
		
		Object[] args = joinPoint.getArgs();
		HttpServletRequest request = null;
		HttpSession adminSession = null; 
		for(Object obj : args) {
			if(obj instanceof HttpServletRequest) {
				request = (HttpServletRequest)obj;
			};
		}
		
		String uri = request.getRequestURI();
		Object result = null;
		if(uri.equals("/admin/loginform") || uri.equals("/admin/login")) {
			result = joinPoint.proceed();
		}else {
			adminSession = request.getSession();
			if(adminSession.getAttribute("admin")==null) {
				throw new AdminExistException("로그인이 필요한 서비스입니다.");
			}else {
				result = joinPoint.proceed();
			}
		}
		return result;
	}
}
