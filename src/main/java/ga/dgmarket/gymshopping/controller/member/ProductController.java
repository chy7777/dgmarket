package ga.dgmarket.gymshopping.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ga.dgmarket.gymshopping.domain.Member;
import ga.dgmarket.gymshopping.domain.Product;
import ga.dgmarket.gymshopping.model.service.product.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	
	
	
	// 메인에서 상품클릭시 상세보기 요청처리 --도균--
		@GetMapping("/product/detail")
		public String detailform(int product_id, Model model, HttpServletRequest request) {
			// 3단계: 일 시키기
			Product product = new Product(); //empty VO
			product = productService.select(product_id);
			
			// 4단계: 저장
			model.addAttribute("product", product);

			return "member/shop/detail";
	}

	// 메인에서 운동기구 카테고리클릭시 모아보기 요청처리 --도균--
		@GetMapping("/product/equipment")
		public String equipmentform(HttpServletRequest request, HttpSession session) {
			Member member = (Member)session.getAttribute("member");
			// 3단계: 일 시키기
			List equipmentList= productService.selectEquipment();
			
			// 4단계: 저장
			request.setAttribute("equipmentList", equipmentList);
			request.setAttribute("member", member);
			
			return "member/shop/page_equipment";
		}
		
		
		// 메인에서 의류 카테고리클릭시 모아보기 요청처리 --도균--
		@GetMapping("/product/wear")
		public String wearform(HttpServletRequest request, HttpSession session) {
			Member member = (Member)session.getAttribute("member");
			// 3단계: 일 시키기
			List wearList= productService.selectWear();
			
			// 4단계: 저장
			request.setAttribute("wearList", wearList);
			request.setAttribute("member", member);
			
			return "member/shop/page_wear";
		}
		
		
		// 메인에서 악세서리 카테고리클릭시 모아보기 요청처리 --도균--
		@GetMapping("/product/accessory")
		public String accessoryform(HttpServletRequest request, HttpSession session) {
			Member member = (Member)session.getAttribute("member");
			// 3단계: 일 시키기
			List accessoryList= productService.selectAccessory();
			
			// 4단계: 저장
			request.setAttribute("accessoryList", accessoryList);
			request.setAttribute("member", member);
			
			return "member/shop/page_accessory";
		}
		
		
		// 메인에서 식품 카테고리클릭시 모아보기 요청처리 --도균--
		@GetMapping("/product/food")
		public String foodform(HttpServletRequest request, HttpSession session) {
			Member member = (Member)session.getAttribute("member");
			// 3단계: 일 시키기
			List foodList= productService.selectFood();
			
			// 4단계: 저장
			request.setAttribute("foodList", foodList);
			request.setAttribute("member", member);
			
			return "member/shop/page_food";
		}
		
		
		
		
}
