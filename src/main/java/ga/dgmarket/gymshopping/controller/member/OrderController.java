package ga.dgmarket.gymshopping.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ga.dgmarket.gymshopping.domain.Member;
import ga.dgmarket.gymshopping.domain.Order;
import ga.dgmarket.gymshopping.model.service.product.CartService;
import ga.dgmarket.gymshopping.model.service.product.ProductService;



@Controller
public class OrderController {
	
	@Autowired
	private CartService cartService;
	
	//비동기 주문완료 페이지 요청
	@PostMapping("/order")  //  
	@ResponseBody
	public ResponseEntity<String> order(HttpServletRequest request, Order order) {
		HttpSession session=request.getSession();
		session.setAttribute("order", order);
		
		
		Member member=(Member)session.getAttribute("member");
		cartService.afterOrderDelete(member.getMember_id());

		ResponseEntity<String> entity=new ResponseEntity<String>("ok", HttpStatus.OK);
		return entity;
	}
	
	@GetMapping("/shop/order")
	public String getList(HttpServletRequest request) {

		return ("/member/shop/order");
	}

}
