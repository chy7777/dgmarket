package ga.dgmarket.gymshopping.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



import ga.dgmarket.gymshopping.domain.Cart;
import ga.dgmarket.gymshopping.domain.Member;
import ga.dgmarket.gymshopping.domain.Message;
import ga.dgmarket.gymshopping.exception.CartException;
import ga.dgmarket.gymshopping.model.service.product.CartService;

@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	
	//장바구니 담기(Restfull)
	@RequestMapping(value="/cart", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<Message> Regist(@RequestBody Cart cart, HttpServletRequest request) {
		
		cartService.insert(cart); //일시키기
		Message message=new Message();
		message.setMsg("장바구니 담기 성공 !!");
		message.setResultCode(1); //성공한다면 코드 1 반환
		ResponseEntity<Message> entity=new ResponseEntity<Message>(message, HttpStatus.OK);
		
		return entity;
	}
	
	
	@ExceptionHandler(CartException.class)
	@ResponseBody
	public ResponseEntity<Message> handle(CartException e, HttpServletRequest request) {
		Message message  =new Message();
		message.setMsg(e.getMessage());
		message.setResultCode(0); //오류나면 코드 0만환
		ResponseEntity<Message> entity = new ResponseEntity<Message>(message, HttpStatus.OK);
		return entity;
	}
	
	
	
	
	//장바구니 목록 가져오기 
		@GetMapping("/cart/list")  //  
		public String getList(HttpServletRequest request) {
			HttpSession session=request.getSession();
			Member member=(Member)session.getAttribute("member");
			int member_id= member.getMember_id();
		
			
			List cartList=cartService.selectAllJoin(member_id); // 서비스에 일시켜 리스트로 받기
			
			
			request.setAttribute("cartList", cartList);  //리퀘스트에 저장
			
			
			return "member/shop/cart";
		}

}
