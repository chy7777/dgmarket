package ga.dgmarket.gymshopping.aop.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

import ga.dgmarket.gymshopping.exception.MemberExistException;

//모든 컨트롤러에 공통된 예외를 처리해주는 컨트롤러
@ControllerAdvice
public class GlobalExceptionHandler {
	@ExceptionHandler(MemberExistException.class)
	public String handleException(MemberExistException e, Model model) {
		model.addAttribute("e",e);
		return "error/error_session";
	}
	
	@ExceptionHandler(NoHandlerFoundException.class)
	public String handle(HttpServletRequest request, NoHandlerFoundException e) {
		return "error/error_404";
	}
	
}
