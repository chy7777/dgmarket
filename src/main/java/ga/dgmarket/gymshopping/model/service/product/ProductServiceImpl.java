package ga.dgmarket.gymshopping.model.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ga.dgmarket.gymshopping.domain.Product;
import ga.dgmarket.gymshopping.model.repository.product.ProductDAO;
@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public List selectAll() {
		return productDAO.selectAll();
	}

	@Override
	public List selectNewItem() {//메인에서 신상품 진열 from.도균
		return productDAO.selectNewItem();
	}
	
	@Override
	public List selectEquipment() {// 운동기구 페이지 from.도균
		return productDAO.selectEquipment();
	}

	@Override
	public List selectWear() {//의류 페이지 from.도균
		return productDAO.selectWear();
	}

	@Override
	public List selectAccessory() {// 악세서리 페이지 from.도균
		return productDAO.selectAccessory();
	}

	@Override
	public List selectFood() { // 보조식품 페이지 from.도균
		return productDAO.selectFood();
	}
	
	@Override
	public Product select(int product_id) {
		return productDAO.select(product_id);
	}

	public void regist(Product product) {
		productDAO.regist(product);
	}

	@Override
	public void update(Product product) {
		productDAO.update(product);
	}

	@Override
	public void delete(int product_id) {
		productDAO.delete(product_id);
	}

	@Override
	public List selectForCategory() {
		return productDAO.selectForCategory();
	}

	@Override
	public List selectTodayRegisted() {
		return productDAO.selectTodayRegisted();
	}

	@Override
	public Product selectForDays(int days) {
		return productDAO.selectForDays(days);
	}

	@Override
	public Product selectForDaysCount(int days) {
		return productDAO.selectForDaysCount(days);
	}




}
