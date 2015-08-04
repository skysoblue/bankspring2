package com.bankspring.service;

import java.util.List;

import com.bankspring.domain.ArticleDto;
import com.bankspring.factory.Command;

public interface ArticleService {
	/****************************
	  === executeUpdate ===
	  1. 삽입(insert)
	 ****************************/
	public int insert(ArticleDto article);
	/****************************
	 2. 수정(update)
	 ****************************/
	public int update(ArticleDto article);
	/****************************
	 3. 삭제(delete)
	 ****************************/
	public int delete(ArticleDto article);
	/****************************
	  === executeQuery ===
	  4. 상세(detail)
	 ****************************/
	public ArticleDto detail(Command command);
	
	/****************************
	  5. 조회(search)
	 ****************************/
	public List<ArticleDto> search(Command command);
	/****************************
	  6. 목록(list)
	 ****************************/
	public List<ArticleDto> list(Command command);
	/****************************
	  7. 크기(size)
	 ****************************/
	public int size(Command command);
	/****************************
	  8. 카운팅(count)
	 ****************************/
	public int count(Command command);
}
