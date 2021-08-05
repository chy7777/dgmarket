package ga.dgmarket.gymshopping.model.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ga.dgmarket.gymshopping.model.repository.member.GradeDAO;
@Service
public class GradeServiceImpl implements GradeService{
	@Autowired
	private GradeDAO gradeDAO;
	@Override
	public List selectAll() {
		return gradeDAO.selectAll();
	}

}
