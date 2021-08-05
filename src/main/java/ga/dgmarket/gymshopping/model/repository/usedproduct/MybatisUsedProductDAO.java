package ga.dgmarket.gymshopping.model.repository.usedproduct;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ga.dgmarket.gymshopping.domain.UsedFavorites;
import ga.dgmarket.gymshopping.domain.UsedProduct;
import ga.dgmarket.gymshopping.domain.UsedProductExtend;
import ga.dgmarket.gymshopping.domain.UsedTag;
import ga.dgmarket.gymshopping.exception.DMLException;

@Repository
public class MybatisUsedProductDAO implements UsedProductDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//중고거래 상품을 등록하는 메서드. 이미지는 별도로 업로드 from.성일
	public UsedProduct insert(UsedProduct usedProduct) throws DMLException{
		int result = sqlSessionTemplate.insert("UsedProductExtend.insert", usedProduct);
		if(result == 0) {
			 throw new DMLException("상품 등록 실패");
		}else {			
			return usedProduct;
		}
	}

	//중고 상품 전체 조회
	public List selectAll(int member_id) {
		return sqlSessionTemplate.selectList("UsedProductExtend.selectAll", member_id);
	}
	
	//상품 상세 목록 가져오기
	public UsedProductExtend getDetail(UsedProductExtend usedProductExtend) {
		return sqlSessionTemplate.selectOne("UsedProductExtend.getDetail", usedProductExtend);
	}
	
	//상품에 대한 찜 갯수 count
	public UsedFavorites getFavoritesCount(int used_product_id) {
		return sqlSessionTemplate.selectOne("UsedFavorites.getFavoritesCount", used_product_id);
	}
	
	//상품에 대한 태그들 가져오기
	public List getProductTag(int used_product_id) {
		return sqlSessionTemplate.selectList("UsedTag.getProductTag", used_product_id);
	}

	//상품의 정보를 판매완료 처리하기
	public void soldout(int used_product_id) {
		sqlSessionTemplate.update("UsedProductExtend.soldout", used_product_id);
	}

	//상품 삭제하기
	public void deleteProduct(int used_product_id) {
		sqlSessionTemplate.delete("UsedProductExtend.delete", used_product_id);
	}
	
	//상품에 대한 찜 정보 전체 삭제
	public void deleteFavorites(int used_product_id) {
		sqlSessionTemplate.delete("UsedFavorites.delete", used_product_id);
	}

	//찜 정보 한건 삭제
	public void deleteFavoritesOne(int used_favorites_id) throws DMLException{
		
		int result = sqlSessionTemplate.delete("UsedFavorites.deleteOne", used_favorites_id);
		if(result == 0) {
			throw new DMLException("찜 한 건 삭제에 실패했습니다.");
		}
	}
	
	//상품에 대한 찜 등록
	public int insertFavorites(UsedFavorites usedFavorites) throws DMLException{
		int result = sqlSessionTemplate.insert("UsedFavorites.insert", usedFavorites);
		if(result == 0) {
			throw new DMLException("찜 등록에 실패했습니다.");
		}
		return usedFavorites.getUsed_favorites_id();
	}

	//태크를 통해 상품 조회
	public List selectByTagName(UsedTag usedTag) {
		return sqlSessionTemplate.selectList("UsedProductExtend.selectByTagName", usedTag);
	}
	
	//상품명을 통해 조회
	public List selectByProductName(UsedProductExtend productExtend) {
		return sqlSessionTemplate.selectList("UsedProductExtend.selectByProductName", productExtend);
	}

	//상점 아이디를 통해 조회
	public List selectByStoreId(UsedProductExtend productExtend) {
		return sqlSessionTemplate.selectList("UsedProductExtend.selectByStoreId", productExtend);
	}

	//상점 이름을 통해 조회
	public List selectByStoreName(UsedProductExtend productExtend) {
		return sqlSessionTemplate.selectList("UsedProductExtend.selectByStoreName", productExtend);
	}

	//상품의 최대가격을 통해 조회
	public List selectByMaxPrice(UsedProductExtend productExtend) {
		return sqlSessionTemplate.selectList("UsedProductExtend.selectByMaxPrice", productExtend);
	}

	//상품의 최소가격을 통해 조회
	public List selectByMinPrice(UsedProductExtend productExtend) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("UsedProductExtend.selectByMinPrice", productExtend);
	}
	
	public List selectByFavorites(int member_id) {
		return sqlSessionTemplate.selectList("UsedProductExtend.selectByFavorites", member_id);
	}

	//메인화면에 나올 최신순위 4개 리스트 from.도균
	public List selectMainList() {
		return sqlSessionTemplate.selectList("UsedProductExtend.selectMainList");
	}
	
}