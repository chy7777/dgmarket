package ga.dgmarket.gymshopping.model.repository.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ga.dgmarket.gymshopping.domain.Product;

@Repository
public class MybatisProductDAO implements ProductDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("Product.selectAll");
	}
	
	public List selectNewItem() {//메인에서 신상품 진열 from.도균
		return sqlSessionTemplate.selectList("Product.selectNewItem");
	}
	
	@Override
	public List selectEquipment() {// 운동기구 페이지 from.도균
		return sqlSessionTemplate.selectList("Product.selectEquipment");
	}

	@Override
	public List selectWear() {//의류 페이지 from.도균
		return sqlSessionTemplate.selectList("Product.selectWear");
	}

	@Override
	public List selectAccessory() {// 악세서리 페이지 from.도균
		return sqlSessionTemplate.selectList("Product.selectAccessory");
	}

	@Override
	public List selectFood() { // 보조식품 페이지 from.도균
		return sqlSessionTemplate.selectList("Product.selectFood");
	}
	
	
	
	
	

	@Override
	public Product select(int product_id) {
		return sqlSessionTemplate.selectOne("Product.select",product_id);
	}

	public void regist(Product product) {
		sqlSessionTemplate.insert("Product.insert",product);
	}

	@Override
	public void update(Product product) {
		sqlSessionTemplate.update("Product.update",product);
	}

	@Override
	public void delete(int product_id) {
		sqlSessionTemplate.delete("Product.delete", product_id);
	}

	@Override
	public List selectForCategory() {
		return sqlSessionTemplate.selectList("Product.selectForCategory");
	}

	@Override
	public List selectTodayRegisted() {
		return sqlSessionTemplate.selectList("Product.selectTodayRegisted");
	}

	@Override
	public Product selectForDays(int days) {
		return sqlSessionTemplate.selectOne("Product.selectForDays",days);
	}
	@Override
	public Product selectForDaysCount(int days) {
		return sqlSessionTemplate.selectOne("Product.selectForDaysCount",days);
	}



}
