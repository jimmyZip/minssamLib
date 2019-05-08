package com.books.controller.member;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.books.common.SecurityBean;
import com.books.exception.EditFailException;
import com.books.exception.LoginFailException;
import com.books.exception.RegistFailException;
import com.books.model.domain.member.JoinCode;
import com.books.model.domain.member.Member;
import com.books.model.service.member.MemberService;



@Controller
//@RequestMapping("/rest")//공통
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	SecurityBean security;
	
	@RequestMapping(value="/member/regist",method=RequestMethod.POST)
	public String regist(Member member) {
		
		member.setPass(security.textToHash(member.getPass()));
		//System.out.println(member.getPass());
		memberService.insert(member);

		return "redirect:/index.jsp";
	}
	@RequestMapping(value="/member/edit",method=RequestMethod.POST)
	@ResponseBody
	public String edit(Member member, HttpServletRequest request) {
		member.setPass(security.textToHash(member.getPass()));
		memberService.update(member);
		StringBuilder sb = new StringBuilder();
		sb.append("<script>");
		sb.append("alert('정보가 수정되었습니다.');");
		sb.append("location.href='/member/mypage/{currentPage}';");
		sb.append("</script>");
		return sb.toString();
	}
	
	@RequestMapping(value="/member/login", method = RequestMethod.POST)
	public String login(Member member, HttpServletRequest request) {
		
		String viewName=null;
		member.setPass(security.textToHash(member.getPass()));
		Member obj = memberService.loginCheck(member);
		// 세션에 담기!
		String prev = request.getHeader("referer");
		Date d = new Date();
		java.sql.Date sqlDate = new java.sql.Date(d.getTime());
		
		if(obj==null) {
			viewName="member/login/loginfail";
			
		}else {
			request.getSession().setAttribute("member", obj);
			
			member.setLastlogin(sqlDate);
			memberService.lastLogin(member);
			viewName="redirect:"+prev;
		}	
		return viewName;
	}
	
	@RequestMapping(value="/member/logout", method = RequestMethod.GET)
	@ResponseBody
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		StringBuilder sb = new StringBuilder();
		sb.append("<script>");
		sb.append("alert('로그아웃 되었습니다.');");
		sb.append("location.href='/';");

		sb.append("</script>");
		return sb.toString();
	}
	
	
	@RequestMapping(value="/member/modify",method=RequestMethod.GET)
	public ModelAndView select(int member_id) {
		System.out.println("넘어온 member_id:" + member_id);
		Member member = memberService.select(member_id);
		ModelAndView mav = new ModelAndView("member/detail");
		mav.addObject("member",member);
		return mav;
	}
	
	@RequestMapping(value="/rest/member/idCheck", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(String id) {
		//회원가입할때 중복을 체크하자
		String result;
		Member member = memberService.idCheck(id);
		//System.out.println("멤버아이디"+member.getId());
		if(member==null) {
			result="중복없음";
			//System.out.println(result);
		}else {
			result="중복있음";
			//System.out.println(result);
		}
		//System.out.println("id="+id);
		//System.out.println("member="+member);
		//System.out.println("보내는거"+result);
		return result;
	}
	
	@RequestMapping(value="/rest/member/emailCheck", method = RequestMethod.POST)
	@ResponseBody
	public String emailCheck(String email) {
		//회원가입할때 중복을 체크하자
		String result;
		System.out.println("이메일:"+email);
		Member member = memberService.emailCheck(email);
		//System.out.println("멤버아이디"+member.getId());
		if(member==null) {
			result="중복없음";
			//System.out.println(result);
		}else {
			result="중복있음";
			//System.out.println(result);
		}
		//System.out.println("id="+id);
		//System.out.println("member="+member);
		//System.out.println("보내는거"+result);
		return result;
	}	
	
	@RequestMapping(value="/rest/member/passCheck", method = RequestMethod.POST)
	@ResponseBody
	public String passCheck(String pass) {
		//회원가입할때 중복을 체크하자
		String result;
		pass = security.textToHash(pass);
		Member member = memberService.passCheck(pass);
		if(member==null) {
			result="일치하지않음";
		}else {
			result="일치함";
		}
		return result;
	}	
	
	@RequestMapping(value="/rest/member/findId", method = RequestMethod.POST)
	@ResponseBody
	public String findId(Member member) {
		//회원가입할때 중복을 체크하자
		String result;
		Member obj = memberService.findId(member);
		//System.out.println("멤버아이디"+member.getId());
		if(obj!=null) {
			result = obj.getId();
		}else {
			result="일치하는 아이디가 없습니다.";
		}
		//System.out.println("보내는거"+result);
		return result;
	}
	
	@RequestMapping(value="/rest/member/infoCheck", method = RequestMethod.POST)
	@ResponseBody
	public String infoCheck(Member member) {
		String result;
		Member obj = memberService.infoCheck(member);
		if(obj!=null) {
			result="아이디 찾음";
		}else {
			result="일치하는 정보가 없습니다";
		}
		System.out.println("infocheck"+result);
		return result;
	}
	


	@RequestMapping(value = "/rest/member/sendMail", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public boolean sendMail(HttpSession session,Member member) {
		JoinCode joinCode= new JoinCode(); 
		Member obj = memberService.infoCheck(member);
		
        int ran = new Random().nextInt(100000) + 10000; 
        String num = String.valueOf(ran);
        System.out.println(obj);
        System.out.println(joinCode);
        joinCode.setId(obj.getId());
        joinCode.setNum(num);
        joinCode.setEmail(obj.getEmail());
        session.setAttribute("joinCode", joinCode);
        
        String subject = "비밀번호 재발급을 위한 인증 코드 발급 안내 입니다.";
        StringBuilder sb = new StringBuilder();
        sb.append("귀하의 인증 코드는 " + num + " 입니다.");
	    /** 메일 전송
	     * subject 제목
	     * text 내용
	     * from 보내는 메일 주소
	     * to 받는 메일 주소
	     **/
        return memberService.send(subject, sb.toString(), "dosn1011@gmail.com", member.getEmail());
    }
	
	@RequestMapping(value="/rest/member/codeCheck",method=RequestMethod.POST)
	@ResponseBody
	public String codeCheck(HttpServletRequest request, HttpSession session,JoinCode clientCode) {
		String result=null;
		JoinCode sendedCode =(JoinCode) request.getSession().getAttribute("joinCode"); //번호발송시그 정보를 담은 객체
		System.out.println("페이지에서 보낸거"+clientCode.getNum());
		System.out.println("세션에 있던거"+sendedCode.getNum());
		//사용자가 넘겨준 아이디와 발급받은 인증번호를 현재 세션에 들어있는 값과 비교 
		if( clientCode.getId().equals(sendedCode.getId())) {
			//번호 끄집어 내기 
			if(clientCode.getNum().equals(sendedCode.getNum())) {
				
				session.setAttribute("id", clientCode.getId());
				session.setAttribute("email", clientCode.getEmail());
				result="일치함";
			}		
		}
		
		
		return result;
	}

	@RequestMapping(value="/rest/member/resetPass",method=RequestMethod.POST)
	@ResponseBody
	public String resetPass(Member member) {
		System.out.println(member.getId()+"아이디");
		System.out.println(member.getEmail()+"이메일");
		System.out.println(member.getPass()+"비밀번호");
		member.setPass(security.textToHash(member.getPass()));
		memberService.resetPass(member);
		StringBuilder sb = new StringBuilder();
		sb.append("<script>");
		sb.append("alert('비밀번호가 변경되었습니다.');");
		sb.append("location.href='/'");
		sb.append("</script>");
		return sb.toString();
	}
	
	
	@ExceptionHandler(RegistFailException.class)
	@ResponseBody
	public String handleRegistFail(RegistFailException e) {
		
		return "{\"resultCode\":0,\"msg\":\""+e.getMessage()+"\"}";
	}

	@ExceptionHandler(LoginFailException.class)
	@ResponseBody
	public String handleLoginFail(LoginFailException e) {
		
		return "{\"resultCode\":0,\"msg\":\""+e.getMessage()+"\"}";
	}
	
	@ExceptionHandler(EditFailException.class)
	@ResponseBody
	public String handleEditFail(EditFailException e) {
		
		return "{\"resultCode\":0,\"msg\":\""+e.getMessage()+"\"}";
	}
}



