package ga.dgmarket.gymshopping.model.service.admin;

import java.util.List;

import ga.dgmarket.gymshopping.domain.Admin;

public interface AdminService {
	public Admin login(Admin admin);
	public void regist (Admin admin);
	public void update (Admin admin);
	public void delelte (int admin_id);
	public List selectAll();
	public Admin select(int admin_id);
}
