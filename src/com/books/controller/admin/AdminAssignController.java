package com.books.controller.admin;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.books.model.domain.member.Auth;
import com.books.model.service.member.AuthService;

@Controller
public class AdminAssignController {
	@Autowired
	AuthService authService;
	Logger logger = Logger.getLogger(this.getClass().getName());
	
	// 페이지 이동
    @RequestMapping(value = "/admin/assign/page", method = RequestMethod.GET)
    public ModelAndView showAuth() {
    	logger.trace("권한 관리 페이지로 이동");
        ModelAndView mav = new ModelAndView("admin/admin_assign");
        mav.addObject("authList", authService.selectAll());
        return mav;
    }
    
    // 전체 리스트 반환(json)
    @RequestMapping(value = "/admin/assign", method = RequestMethod.GET)
    @ResponseBody
    public List<Auth> showAuthList() {
        return authService.selectAll();
    }
    
    // 추가
    @RequestMapping(value="/admin/assign", method=RequestMethod.POST)
    @ResponseBody
    public String insertAuth(Auth auth) {
    	auth.setAuth_name("신규 추가");
    	authService.insert(auth);
    	return null;
    }
    
    // 수정
    @RequestMapping(value = "/admin/assign", method = RequestMethod.PUT)
    public String updateAuth(Auth auth) {
    	authService.insert(auth);
    	return null;
    }
    
    // 삭제
    @RequestMapping(value="/admin/assign/{auth_id}", method = RequestMethod.DELETE)
    @ResponseBody
    public String deleteAuth(@PathVariable("auth_id") int auth_id) {
    	authService.delete(auth_id);
    	return null;
    }
    
}
