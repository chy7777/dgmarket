package ga.dgmarket.gymshopping.model.service.qna;

import java.util.List;

import org.springframework.stereotype.Service;

import ga.dgmarket.gymshopping.domain.Qna;

public interface QnaService {
	public void regist(Qna qna); //regist, updateTeam 순서대로 호출 해야됨
	public List selectAll(); //게시글 전체 조회
	public Qna select(int qna_id);  //게시글 한건 조회
	public void update(Qna qna); //게시글 수정
	public void delete(Qna qna); //게시글 한건 삭제
	public void reply(Qna qna);//답변등록 updateStep, reply 순서대로 호출 해야됨
	public void delReply(Qna qna); //댓글 한건 삭제
}
