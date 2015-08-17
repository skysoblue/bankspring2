package com.bankspring.domain;

import java.util.Date;

public class BookDto {
	private int bookSeq;
	private String userid;
	private String title; // 책제목
	private String creator; // 저자
	private String genre; // 책분류
	private Date regDate; // 등록일
	private String sort; // 분류 (베스트셀러)
	
	public int getBookSeq() {
		return bookSeq;
	}
	public void setBookSeq(int bookSeq) {
		this.bookSeq = bookSeq;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	@Override
	public String toString() {
		return "BookDto [bookSeq=" + bookSeq + ", userid=" + userid + ", title=" + title + ", creator=" + creator
				+ ", genre=" + genre + ", regDate=" + regDate + ", sort=" + sort + "]";
	}
	
}
