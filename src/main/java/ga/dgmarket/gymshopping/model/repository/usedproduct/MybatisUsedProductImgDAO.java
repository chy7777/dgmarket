package ga.dgmarket.gymshopping.model.repository.usedproduct;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ga.dgmarket.gymshopping.domain.UsedProductImg;
import ga.dgmarket.gymshopping.exception.DMLException;

@Repository
public class MybatisUsedProductImgDAO implements UsedProductImgDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//중고 상품에 맞는 이미지를 조회
	public List getProductImg(int usedProduct_id) {
		return sqlSessionTemplate.selectList("UsedProductImg.selectProduct", usedProduct_id);
	}

	//중고 상품을 등록할 때 필요한 이미지만을 insert
	public void insert(UsedProductImg usedProductImg) throws DMLException{
		int result = sqlSessionTemplate.insert("UsedProductImg.insert", usedProductImg);
		if(result == 0) {
			throw new DMLException("UsedProdcutImg insert 실패");
		}
	}
	
	//상점에서 판매 상품 미리보기 이미지 가져오기
	public List productPre(int member_id) {
		return sqlSessionTemplate.selectList("UsedProductImg.productPre", member_id);
	}
	
	//상점에서 찜한 상품 미리보기 이미지 가져오기
	public List favoritesPre(int member_id) {
		return sqlSessionTemplate.selectList("UsedProductImg.favoritesPre", member_id);
	}

	@Override
	public void delete(int usedProduct_id) {
		sqlSessionTemplate.delete("UsedProductImg.delete", usedProduct_id);
	}

	@Override
	public void update(UsedProductImg usedProductImg) {
		// TODO Auto-generated method stub
		
	}

}