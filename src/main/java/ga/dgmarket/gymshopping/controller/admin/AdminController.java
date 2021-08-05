package ga.dgmarket.gymshopping.controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import ga.dgmarket.gymshopping.domain.Admin;
import ga.dgmarket.gymshopping.domain.Member;
import ga.dgmarket.gymshopping.domain.Product;
import ga.dgmarket.gymshopping.model.service.admin.AdminService;
import ga.dgmarket.gymshopping.model.service.member.MemberService;
import ga.dgmarket.gymshopping.model.service.product.ProductService;

@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	@Autowired
	private AdminService adminService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ProductService productService;
	@GetMapping("/loginform")
	public String loginForm(HttpServletRequest request) {
		return "admin/login/loginform";
	}
	//관리자 로그인
	@PostMapping("/login")
	public String login(Admin admin, HttpServletRequest request, Model model) {
		logger.info("관리자id = {}",admin.getHost_id());
		Admin obj = adminService.login(admin);
		HttpSession session = request.getSession();
		session.setAttribute("admin", obj);
		model.addAttribute("admin", obj);
		return "redirect:/admin/main/index";
	}
	@GetMapping("/main/index")
	public String adminMain(HttpServletRequest request,Model model) {
		List product = productService.selectTodayRegisted();
		Product product1 = (Product) productService.selectForDays(1);
		Product product2 = (Product) productService.selectForDays(2);
		Product product3 = (Product) productService.selectForDays(3);
		model.addAttribute("product",product);
		model.addAttribute("product1",product1);
		model.addAttribute("product2",product2);
		model.addAttribute("product3",product3);
		/* 위는 불편하게 짠 코드, 아래는 생각하고 짠 코드*/
		List<Product> productCount = new ArrayList<Product>();
		for(int i = 2; i >-2 ; i--) {
			Product cnt = (Product) productService.selectForDaysCount(i);
			productCount.add(cnt);
		}
		model.addAttribute("productCount", productCount);
		
		
		return "admin/login/index";
	}

	@GetMapping("/main/qna")
	public String admin_qna(HttpServletRequest request) {
		return "admin/main/qna";
	}
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		return "admin/login/out";
	}
}
