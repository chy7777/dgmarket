package ga.dgmarket.gymshopping.model.repository.qna;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ga.dgmarket.gymshopping.domain.Qna;
import ga.dgmarket.gymshopping.exception.DMLException;

@Repository
public class MybatisQnaDAO implements QnaDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//게시글 한 건 작성
	public Qna insert(Qna qna) throws DMLException{
		int result = sqlSessionTemplate.insert("Qna.insert", qna);
		if(result == 0) {
			throw new DMLException("qna 게시글 작성 실패");
		}
		return qna;
	}
	
	//게시글 작성 한 후 반환 되는 id로 team을 update
	public void updateTeam(Qna qna) throws DMLException{
		int result = sqlSessionTemplate.update("Qna.updateTeam", qna);
		if(result == 0) {
			throw new DMLException("qna updateTeam 실패");
		}
	}
	
	//게시글 수정하기
	public void update(Qna Qna) throws DMLException{
		int result = sqlSessionTemplate.update("Qna.update", Qna);
		if(result == 0) {
			throw new DMLException("qna update 실패");
		}
	}
	
	//게시글 전체 조회
	public List selectAll() {
		return sqlSessionTemplate.selectList("Qna.selectAll");
	}

	//게시글 한 건 조회하기
	public Qna select(int Qna_id) {
		return sqlSessionTemplate.selectOne("Qna.select", Qna_id);
	}
	

	//게시글 한 건 삭제
	public void delete(Qna qna) throws DMLException{
		int result = sqlSessionTemplate.delete("Qna.delete", qna);
		if(result == 0) {
			throw new DMLException("qna delete 실패");
		}
	}
	
	//삭제하려는 게시물 뒤에 있는 댓글들의 step을 앞으로 한칸씩 당긴다.
	public void delStep(Qna qna) throws DMLException{
		int result = sqlSessionTemplate.update("Qna.delStep", qna);
	}

	//댓글 한건 삭제
	public void deleteReply(Qna qna) throws DMLException{
		int result = sqlSessionTemplate.delete("Qna.deleteReply", qna);
		if(result == 0) {
			throw new DMLException("댓글 한건 삭제 실패");
		}
	}

	//답글을 달기 위한 자리 확보
	public Qna updateStep(Qna qna) throws DMLException{
		int result = sqlSessionTemplate.update("Qna.updateStep", qna);
		return qna;
	}
	
	//답글 달기
	public void reply(Qna qna) throws DMLException{
		int result = sqlSessionTemplate.insert("Qna.reply", qna);
		if(result == 0) {
			throw new DMLException("qna reply달기 실패");
		}
	}
}
