package com.books.apitest;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import com.books.model.domain.book.Book;
@Component
public class MyHandler extends DefaultHandler{
	//커서 위치 잡기::현재 실행부 위치를 알기 위함
	private boolean no;
	private boolean ranking;
	private boolean bookname;
	private boolean isbn13;
	private boolean loan_count;
	private boolean bookImageURL;
	
	//dto를 구성하고 그 dto를 제너릭 타입으로 갖는 리스트 선언
	private List<PopularBookTest> popularBookList;
	

	//preparing empty dto
	PopularBookTest pb;
	
	public List<PopularBookTest> getPopularBookList(){
		return popularBookList;
	}
	public void setPopularBookList(List<PopularBookTest> popularBookList) {
		this.popularBookList = popularBookList;
	}
	
	
	@Override
	public void startDocument() throws SAXException {
		System.out.println("=================인기도서 문서의 시작================");
		popularBookList = new ArrayList<PopularBookTest>();
	}
	
	@Override
	public void startElement(String uri, String localName, String tag, Attributes attributes) throws SAXException {
		System.out.println("여는 태그 만남");
		System.out.print("<"+tag+">");
		if(tag.equals("no")) {
			pb = new PopularBookTest();
			no=true;
		}else if(tag.equals("ranking")) {
			ranking=true;
		}else if(tag.equals("bookname")) {
			bookname=true;
		}else if(tag.equals("isbn13")) {
			isbn13=true;
		}else if(tag.equals("loan_count")) {
			loan_count=true;
		}else if(tag.equals("bookImageURL")) {
			bookImageURL=true;
		}
	}
	
	//태그 사이에 들어가는 컨텐츠 감지 메서드
	@Override
	public void characters(char[] ch, int start, int length) throws SAXException {
		String content = new String(ch,start,length);
		//System.out.println(content);
		
		//실행부 위치에 따라 내용물을 dto에 주입
		if(no) {
			System.out.println("character메서드의 no 조건문에서"+content);
			pb.setNo(Integer.parseInt(content));
			System.out.println("책번호"+pb.getNo());
		}else if(ranking) {
			System.out.println("character메서드의 ranking 조건문에서"+content);
			pb.setRanking(content);
			System.out.println("책순위"+pb.getRanking());
		}else if(bookname) {
			System.out.println("character메서드의 bookname 조건문에서"+content);
			pb.setBookname(content);
			System.out.println("책제목"+pb.getBookname());
		}else if(isbn13) {
			System.out.println("character메서드의 isbn13 조건문에서"+content);
			pb.setIsbn13(content);	
			System.out.println("책코드"+pb.getBookname());
		}else if(loan_count) {
			System.out.println("character메서드의 loan_count 조건문에서"+content);
			pb.setLoan_count(content);
			System.out.println("책대출수"+pb.getLoan_count());
		}else if(bookImageURL) {
			System.out.println("character메서드의 bookImageURL 조건문에서"+content);
			pb.setBookImageURL(content);
			System.out.println("책이미지url"+pb.getBookImageURL());
		}
	}
	
	@Override
	public void endElement(String uri, String localName, String tag) throws SAXException {
		System.out.println("닫는 태그를 만났어요");
		System.out.println("</"+tag+">");
		
		//실행부 위치여부 변수 원상복귀
		if(tag.equals("no")) {
			no=false;
			popularBookList.add(pb);
			
		}
		if(tag.equals("ranking")) {
			ranking=false;
		}
		if(tag.equals("bookname")) {
			bookname=false;
		}
		if(tag.equals("isbn13")) {
			isbn13=false;
		}
		if(tag.equals("loan_count")) {
			loan_count=false;
		}
	}
	
	@Override
	public void endDocument() throws SAXException {
		System.out.println("================문서의 끝입니다.=====================");
		
		for(int i=0;i<popularBookList.size();i++) {
			System.out.println("최종 결과 : "+popularBookList.size());
		}
	}
}
