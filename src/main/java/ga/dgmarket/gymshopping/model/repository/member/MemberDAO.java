package ga.dgmarket.gymshopping.model.repository.member;

import java.util.List;

import ga.dgmarket.gymshopping.domain.Member;

public interface MemberDAO {
	public Member login(Member member);//로그인
	public void regist(Member member);//회원가입
	public void update(Member member);//정보 수정
	public void update_noPass(Member member);//비밀번호 수정없이 정보수정
	public void update2(Member member); //user_grade 8로 바꾸는 작업(탈퇴)
	//public void delete(int member_id);//아이디, 패스워드가 모두 일치할 때 탈퇴
	public List selectAll();
	public Member select(int member_id);
	public int idCheck(String memberId); //아이디 중복체크
	public int countUser(); // 한달간 가입한 회원 수
	public void updateByAdmin(Member member); // 관리자의 회원수정
	public List selectGoodUser();
	public List selectBadUser();
}
