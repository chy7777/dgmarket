package ga.dgmarket.gymshopping.model.repository.usedreview;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ga.dgmarket.gymshopping.domain.UsedReview;
import ga.dgmarket.gymshopping.exception.DMLException;

@Repository
public class MybatisUsedReviewDAO implements UsedReviewDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//리뷰 전체 조회하기
	public List selectAll(int member_id) {
		return sqlSessionTemplate.selectList("UsedReview.selectAll", member_id);
	}
	
	//리뷰 한 건 등록하기
	public void regist(UsedReview review) throws DMLException{
		int result = sqlSessionTemplate.insert("UsedReview.regist", review);
		if(result == 0) {
			throw new DMLException("리뷰 한 건 삭제 실패");
		}
	}
	
	//리뷰 한 건 삭제하기
	public void delete(int used_review_id) throws DMLException{
		int result = sqlSessionTemplate.delete("UsedReview.delete", used_review_id);
		if(result == 0) {
			throw new DMLException("리뷰 한 건 삭제 실패");
		}
	}
}