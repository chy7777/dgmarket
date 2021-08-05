package ga.dgmarket.gymshopping.model.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ga.dgmarket.gymshopping.domain.Member;
import ga.dgmarket.gymshopping.exception.DMLException;
import ga.dgmarket.gymshopping.exception.MemberExistException;
import ga.dgmarket.gymshopping.model.repository.member.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public Member login(Member member) throws MemberExistException{
		return memberDAO.login(member);
	}

	@Override
	public void regist(Member member) throws DMLException{
		memberDAO.regist(member);
		
	}

	//패스워드 입력 없이 업데이트할 경우 else로 넘어감
	@Override
	public void update(Member member) throws DMLException{
		//넘어온 member 패스워드 찍어보기
		if(member.getPassword().equals("")||member.getPassword()==null) {
			memberDAO.update_noPass(member);
		}else {
			String encryPassword = UserSha256.encrypt(member.getPassword());
			member.setPassword(encryPassword);
			memberDAO.update(member);			
		}
	
	}

	/*
	@Override
	public void delete(int member_id) throws DMLException{
		memberDAO.delete(member_id);
		
	}
	*/

	@Override
	public List selectAll() {
		return memberDAO.selectAll();
	}

	@Override
	public Member select(int member_id) {
		return memberDAO.select(member_id);
	}
	
	@Override
	public int countUser() {
		return memberDAO.countUser();
	}

	@Override
	public int idCheck(String memberId){
		return memberDAO.idCheck(memberId);
	}

	@Override
	public void updateByAdmin(Member member) {
		memberDAO.updateByAdmin(member);
	}

	//user_grade 8로 바꾸는 작업(탈퇴)
	@Override
	public void update2(Member member) {
		memberDAO.update2(member);
		
	}
	public List selectGoodUser() {
		return memberDAO.selectGoodUser();
	}

	@Override
	public List selectBadUser() {
		return memberDAO.selectBadUser();
	}


	
}
