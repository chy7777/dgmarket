package ga.dgmarket.gymshopping.aop.admin;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import ga.dgmarket.gymshopping.exception.AdminExistException;
import ga.dgmarket.gymshopping.exception.MemberExistException;

//모든 컨트롤러에 공통된 예외를 처리해주는 컨트롤러
@ControllerAdvice
public class GlobalExceptionHandler {
	@ExceptionHandler(AdminExistException.class)
	public String handleException(AdminExistException e, Model model) {
		model.addAttribute("e",e);
		return "redirect:/admin/loginform";
	}
}
