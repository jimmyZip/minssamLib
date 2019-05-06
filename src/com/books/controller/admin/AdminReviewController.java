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
import com.books.model.domain.book.Review;
import com.books.model.service.book.ReviewService;

@Controller
public class AdminReviewController {
	@Autowired 
	ReviewService reviewService;
	
	Pager pager = new Pager();
	
    @RequestMapping(value = "/admin/review/page", method = RequestMethod.GET)
    public ModelAndView showReview(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/admin_review");
        List<Review> reviewList = reviewService.selectAll();
        pager.init(request, reviewList.size());
        
        mav.addObject("reviewList", reviewList);
        mav.addObject("pager", pager);
        return mav;        
    }
    
	@RequestMapping(value="/admin/review/{review_id}", method = RequestMethod.DELETE)
	@ResponseBody
	public String deleteMember(@PathVariable("review_id") int review_id) {
		reviewService.delete(review_id);
		
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
		sb.append("\"msg\":\""+e.getMessage()+"\"");
		sb.append("}");
		
		return sb.toString();
	}
}
