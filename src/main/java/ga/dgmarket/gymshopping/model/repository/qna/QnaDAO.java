package ga.dgmarket.gymshopping.model.repository.qna;

import java.util.List;

import ga.dgmarket.gymshopping.domain.Qna;

public interface QnaDAO {
	public Qna insert(Qna Qna);
	public void update(Qna Qna);
	public void updateTeam(Qna qna);
	public List selectAll();
	public Qna select(int Qna_id); 
	public void delete(Qna qna);
	public void delStep(Qna qna); //삭제하려는 댓글의 step옮기기 
	public void deleteReply(Qna qna); //댓글 한건 삭제
	public Qna updateStep(Qna qna); //답변이 들어갈 공간 확보
	public void reply(Qna Qna);//답변등록
}
