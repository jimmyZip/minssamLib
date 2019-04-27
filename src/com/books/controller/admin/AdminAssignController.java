package com.books.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.books.model.service.member.AuthService;

@Controller
public class AdminAssignController {
	@Autowired
	AuthService authService;
	
    @RequestMapping(value = "/admin/assign", method = RequestMethod.GET)
    public ModelAndView showAuth(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/admin_assign");
        mav.addObject("authList", authService.selectAll());
        return mav;
    }
    
    @RequestMapping(value = "/admin/assign/list", method = RequestMethod.GET)
    @ResponseBody
    public List showAuthList(HttpServletRequest request) {
        return authService.selectAll();
    }
}
