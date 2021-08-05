package ga.dgmarket.gymshopping.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ga.dgmarket.gymshopping.domain.Qna;
import ga.dgmarket.gymshopping.model.repository.qna.QnaDAO;
import ga.dgmarket.gymshopping.model.service.qna.QnaService;

@Controller
public class QnaController {
	
	@Autowired
	private QnaService qnaService;

	@GetMapping("/qna/list")
	public String getList(HttpServletRequest request, Model model) {
		System.out.println("목록 조회");
		List qnaList = qnaService.selectAll();
		
		model.addAttribute("qnaList", qnaList);
		
		return "member/qna/list";
	}
	
	@PostMapping("/qna/regist")
	public String regist(HttpServletRequest request, Qna qna) {
		System.out.println("글 등록을 위해 넘어온 값은 : "+qna);
		System.out.println();
		qnaService.regist(qna);
		return "redirect:/member/qna/list";
	}
	
	@PostMapping("/qna/reply")
	public String reply(HttpServletRequest request, Qna qna) {
		System.out.println("댓글 등록을 위해 넘어온 값은 : "+qna);
		qnaService.reply(qna);
		return "redirect:/member/qna/list";
	}
	
	//글 전체 삭제
	@PostMapping("/qna/delete")
	@ResponseBody
	public String delete(HttpServletRequest request, Qna qna) {
		System.out.println("글 전체 삭제 시 넘어온 qna : "+qna);
		qnaService.delete(qna);
		return "";
	}
	
	//댓글 하나 삭제
	@PostMapping("/qna/reply/delete")
	@ResponseBody
	public String deleteReply(HttpServletRequest request, Qna qna) {
		System.out.println("댓글 삭제 시 넘어온 : "+qna);
		qnaService.delReply(qna);
		return "";
	}
}
