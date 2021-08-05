package ga.dgmarket.gymshopping.controller.admin;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import ga.dgmarket.gymshopping.domain.Admin;
import ga.dgmarket.gymshopping.domain.Member;
import ga.dgmarket.gymshopping.model.common.file.FileManager;
import ga.dgmarket.gymshopping.model.service.admin.AdminService;
import ga.dgmarket.gymshopping.model.service.member.GradeService;
import ga.dgmarket.gymshopping.model.service.member.MemberService;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private MemberService memberService;
	@Autowired
	private GradeService gradeService;
	@Autowired
	private FileManager fileManager;
	//모든 회원 가져오기
	@GetMapping("/main/member")
	public String admin_member(Model model, HttpServletRequest request) {
		List memberList = memberService.selectAll();
		int cnt = memberService.countUser();
		model.addAttribute("memberList",memberList);
		model.addAttribute("cnt",cnt);
		return "admin/main/member";
	}
	//우수 회원 가져오기
	@GetMapping("/main/member/good")
	public String good_member(Model model, HttpServletRequest request) {
		List memberList = memberService.selectGoodUser();
		int cnt = memberService.countUser();
		model.addAttribute("memberList",memberList);
		model.addAttribute("cnt",cnt);
		return "admin/main/member";
	}
	//블랙리스트 / 탈퇴회원 가져오기
	@GetMapping("/main/member/bad")
	public String bad_member(Model model, HttpServletRequest request) {
		List memberList = memberService.selectBadUser();
		int cnt = memberService.countUser();
		model.addAttribute("memberList",memberList);
		model.addAttribute("cnt",cnt);
		return "admin/main/member";
	}
	//단일 회원 가져오기
	@GetMapping("/main/member/detail")
	public String getDetail(int member_id, Model model, HttpServletRequest request) {
		Member member = memberService.select(member_id);
		List gradeList = gradeService.selectAll();
		model.addAttribute("member",member);
		model.addAttribute("gradeList",gradeList);
		return "admin/main/member/detail";
	}
	@PostMapping("/member/update")
	public String member_update(Member member, HttpServletRequest request) {
		int leng=member.getPhoto().getOriginalFilename().length();
		
		if(leng>0) {
			ServletContext context = request.getServletContext();
			fileManager.deleteFile(context, member.getProfile_img());

			long time = System.currentTimeMillis();// 현재 날짜 구하기

			// 원하는 위치에 파일 저장하기
			String filename = time + "." + fileManager.getExt(member.getPhoto().getOriginalFilename());
			fileManager.saveFile(context, filename, member.getPhoto());
			member.setProfile_img(filename);
			
		}
		memberService.updateByAdmin(member);
		return "redirect:/admin/main/member";
	}
}
