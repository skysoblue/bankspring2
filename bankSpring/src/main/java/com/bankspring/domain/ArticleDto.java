package com.bankspring.domain;

import java.util.Date;

import org.springframework.stereotype.Component;
@Component("articleDto")
public class ArticleDto {
	private int artSeq;
	private int thmSeq;
	private String userid;
	private int bookSeq;
	private Date postingDate;
	private int readCnt;
	private String title;
	private String content;
	public int getArtSeq() {
		return artSeq;
	}
	public void setArtSeq(int artSeq) {
		this.artSeq = artSeq;
	}
	public int getThmSeq() {
		return thmSeq;
	}
	public void setThmSeq(int thmSeq) {
		this.thmSeq = thmSeq;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getBookSeq() {
		return bookSeq;
	}
	public void setBookSeq(int bookSeq) {
		this.bookSeq = bookSeq;
	}
	public Date getPostingDate() {
		return postingDate;
	}
	public void setPostingDate(Date postingDate) {
		this.postingDate = postingDate;
	}
	public int getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
