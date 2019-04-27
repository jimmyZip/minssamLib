package com.books.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminAssignController {
	
    @RequestMapping(value = "/admin/assign", method = RequestMethod.GET)
    public ModelAndView showAuth(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/admin_assign");
        return mav;        
    }
}
