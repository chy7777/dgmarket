package ga.dgmarket.gymshopping.model.repository.product;

import java.util.List;

import ga.dgmarket.gymshopping.domain.Product;

public interface ProductDAO {
	public List selectAll();
	
	public List selectNewItem(); //메인에서 신상품 진열
	public List selectEquipment(); // 운동기구 페이지
	public List selectWear(); // 의류 페이지
	public List selectAccessory(); // 악세서리 페이지
	public List selectFood(); // 보조식품 페이지
	

	public Product select(int product_id);
	public void regist(Product product);
	public void update(Product product);
	public void delete(int product_id);
	public List selectForCategory();
	/* 하루에 등록된 상품 수를 가져오기*/
	public List selectTodayRegisted();
	public Product selectForDays(int days);
	public Product selectForDaysCount(int days);
	
}
