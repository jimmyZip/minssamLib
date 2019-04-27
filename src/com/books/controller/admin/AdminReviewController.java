package com.books.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminReviewController {
	
    @RequestMapping(value = "/admin/review", method = RequestMethod.GET)
    public ModelAndView showReview(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/admin_review");
        return mav;        
    }
}
