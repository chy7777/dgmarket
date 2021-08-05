package ga.dgmarket.gymshopping.model.service.topcategory;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ga.dgmarket.gymshopping.model.repository.topcategory.TopCategoryDAO;
@Service
public class TopCategoryServiceImpl implements TopCategoryService{
	@Autowired
	private TopCategoryDAO topCategoryDAO;
	@Override
	public List selectAll() {
		return topCategoryDAO.selectAll();
	}

}
