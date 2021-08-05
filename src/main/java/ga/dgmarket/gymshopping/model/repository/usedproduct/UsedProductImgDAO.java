package ga.dgmarket.gymshopping.model.repository.usedproduct;

import java.util.List;

import ga.dgmarket.gymshopping.domain.UsedProductImg;

public interface UsedProductImgDAO {
	public List getProductImg(int usedProduct_id); //조회할 상품과 관련된 이미지 전체 조회
	public void insert(UsedProductImg usedProductImg);
	public void delete(int usedProduct_id); //지우려는 상품의 id를 넣으면 관련된 이미지 전체 삭제
	public void update(UsedProductImg usedProductImg);
	public List productPre(int member_id);
	public List favoritesPre(int member_id);
}