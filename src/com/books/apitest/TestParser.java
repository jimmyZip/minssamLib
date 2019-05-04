package com.books.apitest;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.SAXException;

public class TestParser {
	SAXParserFactory saxParserFactory;
	SAXParser saxParser;//파싱 담당하는 객체 :: 팩토리 패턴을 이용 :: 팩토리로 부터 실행 주체 얻어옴
	URL url;
	URLConnection conn;
	String myKey = "217bf09f9578712358556d0d31517c227b88f090e49aceeae3f0880392bb8f18";
	int regionCode = 11;//서울 한정 test
	int pageSize=30;
	
	public TestParser() {
		saxParserFactory = saxParserFactory.newInstance();//get singleton instance
		try {
			url = new URL("http://data4library.kr/api/loanItemSrchByLib?authKey="+myKey+"&region="+regionCode+"&pageSize="+pageSize);
			conn = url.openConnection();
		} catch (MalformedURLException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		//generate parser
		try {
			saxParser = saxParserFactory.newSAXParser();
			saxParser.parse(conn.getInputStream(), new MyHandler());
			//saxParser.parse(urlLoader.data, new MyHandler());
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		new TestParser();
	}
}
