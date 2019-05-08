package com.books.model.domain.member;

//메일 인증할때 세션에 담을것들임 db에는 따로없음 
public class JoinCode {
	String email;
	String id;
	String num;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}

}
