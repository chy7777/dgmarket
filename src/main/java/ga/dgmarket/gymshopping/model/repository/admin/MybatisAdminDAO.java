package ga.dgmarket.gymshopping.model.repository.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ga.dgmarket.gymshopping.domain.Admin;
import ga.dgmarket.gymshopping.exception.LoginExistException;

@Repository
public class MybatisAdminDAO implements AdminDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public Admin login(Admin admin) throws LoginExistException {
		Admin obj = sqlSessionTemplate.selectOne("Admin.login",admin);
		if(obj == null) {
			throw new LoginExistException("로그인 정보가 올바르지 않습니다.");
		}
		return obj;
	}

	@Override
	public void regist(Admin admin) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Admin admin) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delelte(int admin_id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Admin select(int admin_id) {
		// TODO Auto-generated method stub
		return null;
	}
}
