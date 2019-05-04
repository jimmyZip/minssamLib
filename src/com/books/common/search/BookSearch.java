package com.books.common.search;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Component;

@Component
public class BookSearch {
	final String clientId = "tNA_CKzvmWAdw015cOGE";// 애플리케이션 클라이언트 아이디값";
	final String clientSecret = "ZAtvZgN9bu";// 애플리케이션 클라이언트 시크릿값";

	// 전체 범위 검색
	public String search(String query) {
		StringBuffer apiURL = new StringBuffer();
		apiURL.append("https://openapi.naver.com/v1/search/book.json?");
		apiURL.append("query=");
		apiURL.append(setEnc(query));

		return searchProcess(apiURL.toString());
	}
	

	// 출력건수 지정
	public String search(String query, int display) {
		StringBuffer apiURL = new StringBuffer();
		apiURL.append("https://openapi.naver.com/v1/search/book.json?");
		apiURL.append("query=");
		apiURL.append(setEnc(query));
		apiURL.append("&display=");
		apiURL.append(display);

		return searchProcess(apiURL.toString());
	}

	// 시작 위치 지정
	public String search(String query, int display, int start) {
		StringBuffer apiURL = new StringBuffer();
		apiURL.append("https://openapi.naver.com/v1/search/book.json?");
		apiURL.append("query=");
		apiURL.append(setEnc(query));
		apiURL.append("&display=");
		apiURL.append(display);
		apiURL.append("&start=");
		apiURL.append(start);
		return searchProcess(apiURL.toString());
	}

	private String setEnc(String word) {
		String result = null;
		try {
			result = URLEncoder.encode(word, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/*
	public String searchByIsbn(String d_isbn) {
		StringBuffer apiURL = new StringBuffer();
		apiURL.append("https://openapi.naver.com/v1/search/book.json?");
		apiURL.append("d_isbn=");
		apiURL.append(d_isbn);
		return searchProcess(apiURL.toString());
	}
	*/
	
	// 검색 프로세스 진행
	private String searchProcess(String apiURL) {
		//System.out.println(apiURL);
		BufferedReader br = null;
		StringBuffer result = new StringBuffer();

		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);

			int responseCode = con.getResponseCode();
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "utf-8"));
			}
			String inputLine;
			while ((inputLine = br.readLine()) != null) {
				result.append(inputLine);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (br != null) {
					br.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result.toString();
	}

}