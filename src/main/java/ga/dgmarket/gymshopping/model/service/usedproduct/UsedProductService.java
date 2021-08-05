package ga.dgmarket.gymshopping.model.service.usedproduct;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import ga.dgmarket.gymshopping.domain.UsedFavorites;
import ga.dgmarket.gymshopping.domain.UsedProduct;
import ga.dgmarket.gymshopping.domain.UsedProductExtend;

public interface UsedProductService {

	public void regist(HttpServletRequest request, UsedProduct usedProduct);
	public List selectAll(HttpServletRequest request);
	public Map getDetail(HttpServletRequest request, int used_product_id);
	public void delete(HttpServletRequest request, int used_product_id);
	public void soldout(HttpServletRequest request, int used_product_id);
	public int addFavorites(HttpServletRequest request, UsedFavorites usedFavorites);
	public void delFavorites(HttpServletRequest request, int	used_favorites_id);
	public List selectByKeyword(HttpServletRequest request, String type, String keyowrd);
	public List selectByFavorites(int member_id);
	//메인화면에 나올 리스트 from.도균
	public List selectMainList();
}