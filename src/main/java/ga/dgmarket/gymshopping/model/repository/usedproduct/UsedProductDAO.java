package ga.dgmarket.gymshopping.model.repository.usedproduct;

import java.util.List;

import ga.dgmarket.gymshopping.domain.UsedFavorites;
import ga.dgmarket.gymshopping.domain.UsedProduct;
import ga.dgmarket.gymshopping.domain.UsedProductExtend;
import ga.dgmarket.gymshopping.domain.UsedTag;

public interface UsedProductDAO {
	public UsedProduct insert(UsedProduct usedProduct);
	public List selectAll(int member_id);
	public UsedProductExtend getDetail(UsedProductExtend usedProductExtend);
	public UsedFavorites getFavoritesCount(int used_product_id);
	public List getProductTag(int used_product_id);
	public void soldout(int used_product_id);
	public void deleteProduct(int used_product_id);
	public void deleteFavorites(int used_product_id);
	public void deleteFavoritesOne(int used_favorites_id);
	public int insertFavorites(UsedFavorites usedFavorites);
	public List selectByTagName(UsedTag usedTag);
	public List selectByProductName(UsedProductExtend productExtend);
	public List selectByStoreId(UsedProductExtend productExtend);
	public List selectByStoreName(UsedProductExtend productExtend);
	public List selectByMaxPrice(UsedProductExtend productExtend);
	public List selectByMinPrice(UsedProductExtend productExtend);
	public List selectByFavorites(int member_id);	
	
	//메인화면에 나올 최신순위 4개 리스트 from.도균
	public List selectMainList();
	
}