package ga.dgmarket.gymshopping.model.service.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ga.dgmarket.gymshopping.domain.Qna;
import ga.dgmarket.gymshopping.exception.DMLException;
import ga.dgmarket.gymshopping.model.repository.qna.QnaDAO;

@Service
public class QnaServiceImpl implements QnaService{
	@Autowired
	private QnaDAO qnaDAO;
	
	//게시글 한건을 등록한다
	//이때 등록한 직후 team을 업데이트 해줘야 댓글을 달 때 활용할 수 있음
	public void regist(Qna Qna) throws DMLException{
		qnaDAO.insert(Qna);
		qnaDAO.updateTeam(Qna);
	}

	//게시글 전체 조회
	public List selectAll() {
		return qnaDAO.selectAll();
	}

	//게시글 한건 조회
	public Qna select(int Qna_id) {
		return qnaDAO.select(Qna_id);
	}

	//게시글 수정
	public void update(Qna Qna) throws DMLException{
		qnaDAO.update(Qna);
	}

	//게시글 삭제
	public void delete(Qna Qna) throws DMLException{
		qnaDAO.delete(Qna);
	}
	
	//댓글 한건 등록
	//등록하기 전 qna_id 정보만 가지고 있기 때문에 값을 얻어온 뒤 넣어야 함.
	public void reply(Qna Qna) throws DMLException{
		int qna_id = Qna.getQna_id();
		int writer = Qna.getMember_id();
		String content = Qna.getContent();
		
		Qna resultQna = qnaDAO.select(qna_id); //넘어온 id를 통해 구해온 게시글 정보
		System.out.println("값 넣으려고 구해온 qna 정보 : "+resultQna);
		qnaDAO.updateStep(resultQna); //공간 확보
		resultQna.setMember_id(writer); //구해온 qna객체의 member_id는 원글 작성자이다. 새로 작성하는 사람으로 교체.
		resultQna.setContent(content);
		
		qnaDAO.reply(resultQna);
	}

	//댓글 한건 삭제
	public void delReply(Qna qna) throws DMLException{
		Qna resultQna = qnaDAO.select(qna.getQna_id());
		qnaDAO.delStep(resultQna);
		qnaDAO.deleteReply(resultQna);
	}
}


