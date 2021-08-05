package ga.dgmarket.gymshopping.model.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ga.dgmarket.gymshopping.domain.Admin;
import ga.dgmarket.gymshopping.model.repository.admin.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public Admin login(Admin admin) {
		return adminDAO.login(admin);
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
