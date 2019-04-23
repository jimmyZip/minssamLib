package com.test.search;

public class BookSearchMain {
	public static void main(String[] args) {
		BookSearch bookSearch = new BookSearch();
		System.out.println(bookSearch.searchTotal("양자역학"));
		System.out.println(bookSearch.searchTotal("양자역학", 15));
		System.out.println(bookSearch.searchTotal("양자역학", 20, 30));
		// System.out.println(bookSearch.searchISBN("9791186900529"));
		// System.out.println(bookSearch.searchPubl("더숲"));

	}
}
