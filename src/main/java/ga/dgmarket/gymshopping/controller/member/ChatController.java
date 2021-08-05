package ga.dgmarket.gymshopping.controller.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatController {

	
	@GetMapping("/used/chat/list")
	public String chatList(HttpServletRequest request) {
		return "member/used/chat/chat";
	}
}
