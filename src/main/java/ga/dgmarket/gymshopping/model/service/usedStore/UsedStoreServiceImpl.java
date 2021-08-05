package ga.dgmarket.gymshopping.model.service.usedStore;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ga.dgmarket.gymshopping.domain.Member;
import ga.dgmarket.gymshopping.domain.UsedProductImg;
import ga.dgmarket.gymshopping.domain.UsedReview;
import ga.dgmarket.gymshopping.exception.DMLException;
import ga.dgmarket.gymshopping.model.repository.member.MemberDAO;
import ga.dgmarket.gymshopping.model.repository.usedproduct.UsedProductImgDAO;
import ga.dgmarket.gymshopping.model.repository.usedreview.UsedReviewDAO;

@Service
public class UsedStoreServiceImpl implements UsedStoreService{

	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private UsedProductImgDAO usedProductImgDAO;
	@Autowired
	private UsedReviewDAO usedReviewDAO;
	
	public Map getStore(int member_id){
		Map map = new HashMap<String, Object>();
		
		Member member = memberDAO.select(member_id);
		//판매 상품 이미지 가져오기
		List productList = usedProductImgDAO.productPre(member_id);
		//찜 상품 이미지 가져오기
		List favoritesList = usedProductImgDAO.favoritesPre(member_id);
		//리뷰 가져오기
		List reviewList = usedReviewDAO.selectAll(member_id);
		
		map.put("member", member);
		map.put("productList", productList);
		map.put("favoritesList", favoritesList);
		map.put("reviewList", reviewList);
		
		return map;
	}
	
	//리뷰 한 건 삭제하기
	public void deleteReview(int used_review_id) throws DMLException{
		usedReviewDAO.delete(used_review_id);
	}

	//리뷰 한건 등록하기
	public void registReview(UsedReview usedReview) throws DMLException{
		usedReviewDAO.regist(usedReview);
	}
	
}
