package com.books.controller.book;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.books.common.FileManager;
import com.books.common.Pager;
import com.books.common.search.BookSearch;
import com.books.common.search.BookSerachMapping;
import com.books.exception.DeleteFailException;
import com.books.exception.EditFailException;
import com.books.model.domain.book.Book;
import com.books.model.domain.book.Review;
import com.books.model.domain.book.Score;
import com.books.model.domain.member.Member;
import com.books.model.domain.member.Searchbook;
import com.books.model.service.book.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	BookSerachMapping mapping;
	@Autowired
	BookSearch bookSearch;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private FileManager fileManager;
	
	Logger logger = Logger.getLogger(this.getClass().getName());
	
	Pager pager=new Pager();

	//리뷰 쓰기 페이지로 이동
	@RequestMapping(value="/book/reviews/write/{isbn}",method=RequestMethod.GET)
	public ModelAndView insertPage(HttpServletRequest request,@PathVariable("isbn") String isbn) {
		System.out.println("리뷰 작성페이지로 이동 요청, isbn은"+isbn);
		List<Book> detailList = mapping.mapping((bookSearch.search(isbn)));	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("review/review_write");
		mav.addObject("isbn", isbn);
		mav.addObject("detailList",detailList);
		return mav;	
	}
	//리뷰 수정 페이지 이동
	@RequestMapping(value="/book/reviews/update/{review_id}",method=RequestMethod.GET)
	public ModelAndView editPage(HttpServletRequest request, @PathVariable("review_id") int review_id) {
		logger.info("리뷰컨트롤러 작성페이지로 이동하는 review_id는 : "+review_id);
		Review thisReview = reviewService.select(review_id);
		String isbn = thisReview.getIsbn();
		logger.info("bookDetail에서 꺼내온 detailList에서 추출한 isbn:"+isbn);
		List<Book> thisDetailList = mapping.mapping((bookSearch.search(isbn)));
		ModelAndView mav = new ModelAndView();
		mav.setViewName("review/review_update");
		mav.addObject("thisDetailList", thisDetailList);
		mav.addObject("isbn", isbn);
		mav.addObject("thisReview",thisReview);
		return mav;
	}
	
	//리뷰 전체 보기
	@RequestMapping(value="/book/reviews",method=RequestMethod.GET)
	public ModelAndView selectAll() {
		List<Review> allReviewList = reviewService.selectAll();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("review/list");
		mav.addObject("allReviewList",allReviewList);
		return mav;
	}
	
	//index에서 클릭한 최근리뷰 상세보기
	@RequestMapping(value="/book/reviews/{isbn}",method=RequestMethod.GET)
	public ModelAndView select(@PathVariable("isbn") String isbn) {
		List<Review> pickReviewList = reviewService.selectByIsbn(isbn);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("review/detail");
		mav.addObject("allReviewList",pickReviewList);
		return mav;
	}
	
	//리뷰 전체 중 최근3건 가져오기
	@RequestMapping(value="/book/review/summary",method=RequestMethod.GET)
	@ResponseBody
	public String selectAllReview() {
		List<Review> reviewLimitList = reviewService.selectAllWithLimit();
		JSONObject json = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		for(int i=0;i<reviewLimitList.size();i++) {
			Review review = reviewLimitList.get(i);
			JSONObject obj = new JSONObject();
			obj.put("review_id", review.getReview_id());
			obj.put("id", review.getMember().getId());
			obj.put("isbn", review.getIsbn());
			obj.put("title", review.getTitle());
			obj.put("content", review.getContent());
			obj.put("regdate", review.getRegdate());
			obj.put("modidate", review.getModidate());
			obj.put("img", review.getImg());
			jsonArray.add(obj);
		}
		json.put("reviewLimitList", jsonArray);
		return json.toString();
	}
	
	//리뷰 1건 등록
	@RequestMapping(value="/review/write",method=RequestMethod.POST)
	public String insert(Review review,HttpServletRequest request) {
		logger.info("reviewController의 review:: "+review);
		System.out.println("리뷰에 등록하려는 이미지"+review.getMyImg());
		MultipartFile myImg = review.getMyImg();
		String filename = myImg.getOriginalFilename();
		logger.info("업로드할 때 중간 filename :: "+filename);

		String realPath = request.getServletContext().getRealPath("/upload");
		logger.info("프로젝트상 업로드 경로 :: C:\\javafinal\\finalproject\\minssamLib\\WebContent\\upload");
		logger.info("업로드 파일 올라갈 실제경로는:: "+realPath);
		
		File uploadingFile = null;
		
		try {
			uploadingFile = new File(realPath+"/"+filename);
			logger.info("업로드할 파일 풀네임:: "+uploadingFile);
			myImg.transferTo(uploadingFile);//업로드
			filename = fileManager.renameByDate(uploadingFile, realPath);//파일명 변경
			logger.info("filemanager로 변환한 파일 이름 :: "+filename);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		if(filename!=null) {
			review.setImg(filename);//내 dto의 멤버명이 img이므로
			reviewService.insert(review);
		}
		//http://localhost:8080/book/search/detail/9788932030050, 여기로 다시 가야함
		//return "redirect:/books/bookDetail.jsp";
		String isbn = review.getIsbn();
		return "redirect:/book/search/detail/"+isbn;
	}
	
	
	
	//리뷰 삭제
	@RequestMapping(value="/review/delete/{review_id}",method=RequestMethod.DELETE)
	@ResponseBody
	public String deleteReview(HttpServletRequest request, @PathVariable("review_id") int review_id) {
		logger.info("리뷰 삭제요청");
		Member member = (Member)request.getSession().getAttribute("member");
		int membersMember_id = member.getMember_id();
		Review receivedReview = reviewService.select(review_id);
		int compareMember_id = receivedReview.getMember().getMember_id();
		if(membersMember_id==compareMember_id) {//본인글 여부 확인			
			reviewService.delete(review_id);//맞으면 삭제
		}else {
			return "{\"result\":0,\"msg\":\"본인 작성 글이 아닙니다.\"}";
		}
		return "{\"result\":1,\"msg\":\"삭제성공\"}";
	}
	
	//리뷰 수정
	@RequestMapping(value="/review/update",method=RequestMethod.POST)
	@ResponseBody
	public String editReview(HttpServletRequest request,Review review) {
		logger.info("리뷰 수정요청");
		Member member = (Member)request.getSession().getAttribute("member");
		int membersMember_id = member.getMember_id();
		//int compareMember_id = review.getMember().getMember_id();
		Date d = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String transD = transFormat.format(d);
		StringBuffer sb = new StringBuffer();
		//if(membersMember_id==compareMember_id) {//본인글 여부 확인			
			review.setModidate(transD);
			reviewService.update(review);//맞으면 수정
			sb.append("{");
			sb.append("\"result\":1");
			sb.append("}");
//		}else {
//			sb.append("<script>");
//			sb.append("alert('본인 작성 글이 아닙니다.');");
//			sb.append("</script>");
//		}
		return sb.toString();
	}
	
	/*
	 * //리뷰 목록보기요청
	@RequestMapping(value="/review/list",method=RequestMethod.GET)
	public ModelAndView selectAll() {
		System.out.println("리뷰 컨트롤러 목록보기 요청");
		List<Review> reviewList = reviewService.selectAll();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("review/reviewlist");
		return mav;
	}
	 * 
	 */
	
	@ExceptionHandler(DeleteFailException.class)
	@ResponseBody
	public String deleteReviewFail(DeleteFailException e) {
		return "{\"result\":0, \"msg\":\"" + e.getMessage() + "\"}";
	}
	
	@ExceptionHandler(EditFailException.class)
	@ResponseBody
	public String editReviewFail(EditFailException e) {
		return "{\"result\":0, \"msg\":\"" + e.getMessage() + "\"}";
	}
}
