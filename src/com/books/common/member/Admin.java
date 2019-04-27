package com.books.common.member;

import org.springframework.stereotype.Component;

import com.books.model.domain.member.Auth;

@Component
public class Admin {
	public boolean adminCheck(Auth auth) {
		return auth.isAdmin_assign() || auth.isBook_comment_del() || auth.isMember_del() || auth.isReview_comment_del()|| auth.isReview_del();
	}
}
