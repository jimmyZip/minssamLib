package com.books.common.member;

import com.books.model.domain.member.Auth;

public class Admin {
	public boolean adminCheck(Auth auth) {
		return auth.isAdmin_assign() || auth.isBook_comment_del() || auth.isMember_del() || auth.isReview_comment_del()|| auth.isReview_del();
	}
}
