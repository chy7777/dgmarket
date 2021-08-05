package ga.dgmarket.gymshopping.model.repository.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ga.dgmarket.gymshopping.domain.Member;
import ga.dgmarket.gymshopping.exception.DMLException;
import ga.dgmarket.gymshopping.exception.MemberExistException;

@Repository
public class MybatisMemberDAO implements MemberDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessonTemplate;

	@Override
	public Member login(Member member) throws MemberExistException{
		Member obj=sqlSessonTemplate.selectOne("Member.login",member);
		if(obj==null) {
			throw new MemberExistException("로그인에 실패하였습니다");
		}
		return obj;
	}

	@Override
	public void regist(Member member) throws DMLException{
		int result=sqlSessonTemplate.insert("MemberJoin.join", member);
		if(result==0) {
			throw new DMLException("회원가입에 실패하였습니다");
		}
	}

	@Override
	public void update(Member member) {
		int result=sqlSessonTemplate.update("Member.update",member);
		if(result==0) {
			throw new DMLException("수정실패");
		}
		
	}

	/*
	@Override
	public void delete(int member_id) {
		int result=sqlSessonTemplate.delete("Member.delete",member_id);
		if(result==0) {
			throw new DMLException("탈퇴실패");
		}
		
	}
	*/

	@Override
	public List selectAll() {
		return sqlSessonTemplate.selectList("Member.selectAll");
	}

	@Override
	public Member select(int member_id) {
		return sqlSessonTemplate.selectOne("Member.detail", member_id);
	}
	
	@Override
	public int countUser() {
		return sqlSessonTemplate.selectOne("Member.countUser");
	}

	@Override
	public int idCheck(String memberId) {
		return sqlSessonTemplate.selectOne("Member.idCheck",memberId);
	}

	@Override
	public void updateByAdmin(Member member) {
		sqlSessonTemplate.update("Member.updateByAdmin",member);
	}

	//user_grade 8로 바꾸는 작업(탈퇴)
	@Override
	public void update2(Member member) {
		int result=sqlSessonTemplate.update("Member.update2",member);
		if(result==0) {
			throw new DMLException("탈퇴실패");
		}
	}
		
	public List selectGoodUser() {
		return sqlSessonTemplate.selectList("Member.selectGoodUser");
	}

	@Override
	public List selectBadUser() {
		return sqlSessonTemplate.selectList("Member.selectBadUser");
	}

	@Override
	public void update_noPass(Member member) {
		int result=sqlSessonTemplate.update("Member.update_noPass",member);
		if(result==0) {
			throw new DMLException("수정실패");
		}
		
	}

	

}
