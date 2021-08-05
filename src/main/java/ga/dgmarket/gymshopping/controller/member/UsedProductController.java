package ga.dgmarket.gymshopping.controller.member;

import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import ga.dgmarket.gymshopping.domain.Member;
import ga.dgmarket.gymshopping.domain.UsedFavorites;
import ga.dgmarket.gymshopping.domain.UsedProduct;
import ga.dgmarket.gymshopping.exception.DMLException;
import ga.dgmarket.gymshopping.exception.UploadException;
import ga.dgmarket.gymshopping.model.service.usedproduct.UsedProductService;

@Controller
public class UsedProductController {

	@Autowired
	private UsedProductService usedProductService;
	
	//중고상점의 메인페이지요청을 처리하는 메서드
	//메인 페이지로 이동하며 상품 정보가 담긴 List를 전송한다.
	@GetMapping("/used/main")
	public String getMain(Model model, HttpServletRequest request) {
		List usedProductList = usedProductService.selectAll(request);
		model.addAttribute("usedProductList", usedProductList);
		
		return "member/used/main";
	}
	
	//찜한 상품 목록을 가져오기
	@GetMapping("/used/main/favorites")
	public String getMainByFavorites(Model model, int member_id, HttpServletRequest request) {
		List usedProductList = usedProductService.selectByFavorites(member_id);
		model.addAttribute("usedProductList", usedProductList);

		return "member/used/main";
	}
	
	//상품 검색을 담당하는
	@GetMapping("/used/main/search")
	public String getMainByKeyword(Model model, HttpServletRequest request, String type, String keyword) {
		System.out.println("keyword : "+keyword+".");
		System.out.println("type : "+type+".");
		List usedProductList = usedProductService.selectByKeyword(request, type, keyword);
		model.addAttribute("usedProductList", usedProductList);
		
		return "member/used/main";
	}
	
	//중고상품 등록 폼 요청을 처리하는 메서드
	@GetMapping("/used/product/registForm")
	public String registForm(HttpServletRequest request) {
		return  "member/used/product/registForm";
	}

	//글등록 요청을 처리하는 메서드
	//등록을 마치면 바로 메인페이지로 이동함
	@PostMapping("/used/product/regist")
	public String regist(UsedProduct usedProduct, HttpServletRequest request) {
		usedProductService.regist(request, usedProduct);
		return "redirect:/member/used/main";
	}
	
	//상품의 상세페이지 요청을 처리하는 메서드
	//상품을 상세보기 한 유저의 세션에 최근 본 상품의 정보를 담아주기
	@GetMapping("/used/product/detail")
	public String getDetail(HttpServletRequest request, Model model, int used_product_id) {
		Map<String, Object> map = usedProductService.getDetail(request, used_product_id);
		model.addAttribute("map", map);	
		
		return "member/used/product/detail";
	}
	
	//상품 상태를 판매완료 처리 요청
	@GetMapping("/used/product/soldout")
	public String soldout(HttpServletRequest request, int used_product_id) {
		usedProductService.soldout(request, used_product_id);
		return "redirect:/member/used/product/detail?used_product_id="+used_product_id;
	}
	
	//상품 삭제 요청을 처리하는 메서드
	@GetMapping("/used/product/delete")
	public String delete(HttpServletRequest request, int used_product_id) {
		usedProductService.delete(request, used_product_id);
		//상품이미지 삭제[디비, 파일]
		//상품태그삭제
		//상품찜
		//상품주문삭제
		
		return "redirect:/member/used/main";
	}
	
	//찜하기 버튼을 클릭했을 때 동작하는 메서드
	@GetMapping("/used/product/addfavorites")
	@ResponseBody
	public String addFavorites(HttpServletRequest request, int used_product_id) {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		
		UsedFavorites favorites = new UsedFavorites();
		favorites.setMember_id(member.getMember_id());
		favorites.setUsed_product_id(used_product_id);

		int favorites_id = usedProductService.addFavorites(request, favorites);
		
		return Integer.toString(favorites_id);
	}
	
	//찜 삭제하기
	@GetMapping("/used/product/delfavorites")
	@ResponseBody
	public String delfavorites(HttpServletRequest request, int used_favorites_id) {
		usedProductService.delFavorites(request, used_favorites_id);
		return "";
	}
	
	//최근 본 목록에 들어있는 세션 지우기
	@GetMapping("/used/product/delSession")
	@ResponseBody
	public String delSession(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("id1", null);
		session.setAttribute("id2", null);
		session.setAttribute("id3", null);
		session.setAttribute("img1", null);
		session.setAttribute("img2", null);
		session.setAttribute("img3", null);
		
		
		return "";
	}
	
	
	//DML 실패 시 만나게 되는 에러 전용 핸들러
	@ExceptionHandler(DMLException.class)
	public String handleException(DMLException e, Model model) {
		
		model.addAttribute("e", e);
		return "error/result";
	}
	
	//파일 업로드 실패 시 만나게 되는 에러 전용 핸들러
	@ExceptionHandler(UploadException.class)
	public String hadleException(UploadException e, Model model) {
		model.addAttribute("e", e);
		
		return "error/result";
	}
}