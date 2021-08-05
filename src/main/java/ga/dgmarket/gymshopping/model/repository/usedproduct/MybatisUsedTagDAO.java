package ga.dgmarket.gymshopping.model.repository.usedproduct;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ga.dgmarket.gymshopping.domain.UsedTag;
import ga.dgmarket.gymshopping.exception.DMLException;

@Repository
public class MybatisUsedTagDAO {

	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public void insert(UsedTag usedTag) throws DMLException{
		int result = sessionTemplate.insert("UsedTag.insert", usedTag);
		if(result == 0) throw new DMLException("Tag insert 실패");
	}
	
	public void delete(int used_product_id) {
		sessionTemplate.delete("UsedTag.delete", used_product_id);
	}
}
