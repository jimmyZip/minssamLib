package com.books.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.books.common.Pager;
import com.books.exception.DeleteFailException;
import com.books.exception.EditFailException;
import com.books.model.domain.member.Auth;
import com.books.model.domain.member.Member;
import com.books.model.service.member.AuthService;
import com.books.model.service.member.MemberService;

@Controller
public class AdminMemberController {
	@Autowired
	MemberService memberService;

	@Autowired
	AuthService authService;

	Pager pager = new Pager();

	@RequestMapping(value = "/admin/member/page", method = RequestMethod.GET)
	public ModelAndView showMember(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/admin_member");
		List<Member> memberList = null;
		// search 파라미터 있는지 확인
		if (request.getParameter("search") != null) {
			String searchWord = request.getParameter("search");
			if(searchWord.equals("")) { // 검색어 있는지 확인. 없으면 전부 출력
				memberList = memberService.selectAll();
			}else {
				memberList = memberService.search(searchWord);
			}
		} else {
			memberList = memberService.selectAll();
		}

		List<Auth> authList = authService.selectAll();
		pager.init(request, memberList.size());

		mav.addObject("memberList", memberList);
		mav.addObject("pager", pager);
		mav.addObject("authList", authList);
		return mav;
	}

	@RequestMapping(value = "/admin/member/{member_id}", method = RequestMethod.DELETE)
	@ResponseBody
	public String deleteMember(@PathVariable("member_id") int member_id) {
		memberService.delete(member_id);

		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"resultCode\":1");
		sb.append("}");
		return sb.toString();
	}

	@RequestMapping(value = "/admin/member/{member_id}/{auth_id}", method = RequestMethod.PUT)
	@ResponseBody
	public String updateAuthMember(@PathVariable("member_id") int member_id, @PathVariable("auth_id") int auth_id) {
		Member member = new Member();
		member.setAuth(new Auth());
		member.setMember_id(member_id);
		member.getAuth().setAuth_id(auth_id);
		memberService.updateAuth(member);

		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"resultCode\":1");
		sb.append("}");
		return sb.toString();
	}

	@ExceptionHandler(DeleteFailException.class)
	@ResponseBody
	public String deleteFail(DeleteFailException e) {
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"resultCode\":0,");
		sb.append("\"msg\":\"" + e.getMessage() + "\"");
		sb.append("}");

		return sb.toString();
	}

	@ExceptionHandler(EditFailException.class)
	@ResponseBody
	public String updateFail(EditFailException e) {
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"resultCode\":0,");
		sb.append("\"msg\":\"" + e.getMessage() + "\"");
		sb.append("}");

		return sb.toString();
	}
}
