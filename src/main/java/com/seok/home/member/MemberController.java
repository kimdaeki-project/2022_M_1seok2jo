package com.seok.home.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.seok.home.lecture.teacher.TeacherDTO;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	/************************ 회원 **************************/
	
	//로그인(GET)
	@GetMapping("login")
	public String getLogin()throws Exception{
		System.out.println("로그인 접속(GET)");
		
		return "member/login";
	}
	
	//로그인(POST)
	@PostMapping("login")
	public ModelAndView getLogin(MemberDTO memberDTO, HttpSession session)throws Exception{
		System.out.println("로그인 접속(POST)");
		
		ModelAndView mv = new ModelAndView();
		
		//DB에 아이디 패스워드 확인(아이디, 이름, 이메일, 전화번호, 마일리지, 등급번호, 등급이름 조회)
		memberDTO = memberService.getLogin(memberDTO);
		
		//세션에 memberDTO 담기(아이디, 이름, 이메일, 전화번호, 마일리지, 등급번호, 등급이름)
		session.setAttribute("member", memberDTO);
		
		//로그인 성공 실패 확인
		if(memberDTO!=null) {
			System.out.println("로그인 성공!");
		}else {
			System.out.println("로그인 실패..");
		}
		
		mv.setViewName("member/login");
		
		return mv;
	}
	
	//로그아웃(GET)
	@GetMapping("logout")
	public String setLogout(HttpSession session)throws Exception{
		System.out.println("로그아웃 접속(GET)");
		
		session.invalidate();
		
		return "redirect:../";
	}
	
	//회원가입(GET)
	@GetMapping("join")
	public String setJoin()throws Exception{
		System.out.println("회원가입 접속(GET)");
		
		return "member/join";
	}
	
	//회원가입(POST)
	@PostMapping
	public String setJoin(MemberDTO memberDTO, HttpSession session)throws Exception{
		System.out.println("회원가입 접속(POST)");
		
		int result = memberService.setJoin(memberDTO);
		if(result>0) {
			System.out.println("회원가입 성공!");
		}else {
			System.out.println("회원가입 실패..");
		}
		
		return "member/join";
	}
	
	//강사신청(GET)
	@GetMapping("teacherAdd")
	public void setTeacherAdd()throws Exception{
		System.out.println("강사신청 접속(GET)");
	}
	
	//강사신청(POST)
	@PostMapping("teacherAdd")
	public String setTeacherAdd(TeacherDTO teacherDTO, HttpSession session)throws Exception{
		System.out.println("강사신청 접속(POST)");
		
		int result = memberService.setTeacherAdd(teacherDTO, session.getServletContext());
		if(result>0) {
			System.out.println("강사신청 성공!");
		}else {
			System.out.println("강사신청 실패..");
		}

		return "member/teacherAdd";
	}
	
	/************************ 마이페이지 **************************/
	
	//프로필수정(GET)
	@GetMapping("profile")
	public String setProfile()throws Exception {
		System.out.println("프로필 접속(GET)");
		
		return "member/profile";
	}
	
	//프로필수정(POST)
	@PostMapping("profile")
	public String setProfile(MemberDTO memberDTO, HttpSession session)throws Exception {
		System.out.println("프로필 접속(POST)");
		
		int result = memberService.setProfile(memberDTO);
		
		if(result>0) {
			System.out.println("프로필수정 성공!");
		}else {
			System.out.println("프로필수정 실패..");
		}
		
		return "member/profile";
	}
	
	//장바구니(GET)
	@RequestMapping(value="cart", method=RequestMethod.GET)
	public String getCartList() throws Exception{
		
		return "member/cart";
	}
	
}
