package ga.dgmarket.gymshopping.model.service.usedStore;

import java.util.Map;

import ga.dgmarket.gymshopping.domain.UsedReview;

public interface UsedStoreService {
	public Map getStore(int member_id);
	public void registReview(UsedReview usedReview);
	public void deleteReview(int used_review_id);
	
}