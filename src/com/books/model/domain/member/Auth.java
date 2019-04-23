package com.books.model.domain.member;

public class Auth {
	private int auth_id;
	private String auth_name;
	private boolean admin_assign;
	private boolean member_del;
	private boolean review_del;
	private boolean review_comment_del;
	private boolean book_comment_del;

	public int getAuth_id() {
		return auth_id;
	}

	public void setAuth_id(int auth_id) {
		this.auth_id = auth_id;
	}

	public String getAuth_name() {
		return auth_name;
	}

	public void setAuth_name(String auth_name) {
		this.auth_name = auth_name;
	}

	public boolean isAdmin_assign() {
		return admin_assign;
	}

	public void setAdmin_assign(boolean admin_assign) {
		this.admin_assign = admin_assign;
	}

	public boolean isMember_del() {
		return member_del;
	}

	public void setMember_del(boolean member_del) {
		this.member_del = member_del;
	}

	public boolean isReview_del() {
		return review_del;
	}

	public void setReview_del(boolean review_del) {
		this.review_del = review_del;
	}

	public boolean isReview_comment_del() {
		return review_comment_del;
	}

	public void setReview_comment_del(boolean review_comment_del) {
		this.review_comment_del = review_comment_del;
	}

	public boolean isBook_comment_del() {
		return book_comment_del;
	}

	public void setBook_comment_del(boolean book_comment_del) {
		this.book_comment_del = book_comment_del;
	}

}
