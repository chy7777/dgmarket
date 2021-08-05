package ga.dgmarket.gymshopping.controller.admin;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import ga.dgmarket.gymshopping.domain.Product;

import ga.dgmarket.gymshopping.domain.TopCategory;
import ga.dgmarket.gymshopping.exception.FileHandleException;
import ga.dgmarket.gymshopping.exception.UploadException;

import ga.dgmarket.gymshopping.model.common.file.FileManager;
import ga.dgmarket.gymshopping.model.service.product.ProductService;
import ga.dgmarket.gymshopping.model.service.topcategory.TopCategoryService;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	private TopCategoryService topCategoryService;
	@Autowired
	private FileManager fileManager;
	@GetMapping("/main/product")
	public String admin_product(HttpServletRequest request, Model model) {
		List cnt = productService.selectForCategory();
		List cntToday = productService.selectTodayRegisted();
		model.addAttribute("cnt",cnt);
		model.addAttribute("cntToday",cntToday);
		return "admin/main/product";
	}
	
	//모든 상품 가져오기

	@GetMapping("/main/productlist")
	public String memberList(Model model, HttpServletRequest request) {
		List productList = productService.selectAll();
		model.addAttribute("productList",productList);
		return "admin/main/productlist";
	}

	//등록페이지 호출

	@GetMapping("/main/product/regist")
	public String admin_product(Model model, HttpServletRequest request) {
		List topCategoryList = topCategoryService.selectAll();
		model.addAttribute("topCategoryList",topCategoryList);
		return "admin/main/product/regist";
	}

	//등록

	@PostMapping("/product/regist")
	public String product_regist(Product product, HttpServletRequest request) {
		MultipartFile photo = product.getPhoto();
		ServletContext context = request.getServletContext();
		Long time = System.currentTimeMillis();
		String filename = time+"."+fileManager.getExt(photo.getOriginalFilename());
		fileManager.saveFile(context, photo, "product/img");
		product.setProduct_img(filename);
		productService.regist(product);
		
		return "redirect:/admin/main/productlist";
	}

	
	//단일상품 가져오기
	@GetMapping("/main/product/detail")
	public String product_detail(int product_id, HttpServletRequest request, Model model) {
		Product product = productService.select(product_id);
		List topCategoryList = topCategoryService.selectAll();
		model.addAttribute("product", product);
		model.addAttribute("topCategoryList",topCategoryList);
		return "admin/main/product/detail";
	}
	
	//상품 삭제
	@PostMapping("/product/delete")
	public String product_delete(Product product, HttpServletRequest request) {
		ServletContext context = request.getServletContext();
		productService.delete(product.getProduct_id());
		
		fileManager.deleteFile(context, product.getProduct_img(), "product/img/");
		return "redirect:/admin/main/productlist";
	}
	
	//상품 수정
	@PostMapping("/product/update")
	public String product_update(Product product, HttpServletRequest request) {
		int leng = product.getPhoto().getOriginalFilename().length();
		
		if(leng>0) {
			ServletContext context = request.getServletContext();
			fileManager.deleteFile(context, product.getProduct_img(), "product/img/");
			MultipartFile photo = product.getPhoto();
			Long time = System.currentTimeMillis();
			String filename = time+"."+fileManager.getExt(photo.getOriginalFilename());
			fileManager.saveFile(context, photo, "product/img/");
			product.setProduct_img(filename);			
		}
		productService.update(product);
		return "redirect:/admin/main/productlist";
	}
	
	@ExceptionHandler(UploadException.class)
	public String handleException(UploadException e, Model model) {
		model.addAttribute("e",e);
		return "error/result";
	}

	@ExceptionHandler(FileHandleException.class)
	public String handleException(FileHandleException e, Model model) {
		model.addAttribute("e",e);
		return "error/result";
	}

}
