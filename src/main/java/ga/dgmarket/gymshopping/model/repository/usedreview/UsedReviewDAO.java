package ga.dgmarket.gymshopping.model.repository.usedreview;

import java.util.List;

import ga.dgmarket.gymshopping.domain.UsedReview;

public interface UsedReviewDAO {
	public List selectAll(int member_id);
	public void regist(UsedReview review);
	public void delete(int used_review_id);
}
