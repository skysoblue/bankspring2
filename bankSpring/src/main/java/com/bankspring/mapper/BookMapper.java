package com.bankspring.mapper;

import java.util.List;

import com.bankspring.domain.ArticleDto;
import com.bankspring.domain.BookDto;
import com.bankspring.factory.Command;

public interface BookMapper {
	/****************************
	  === executeUpdate ===
	  1. 삽입(insert)
	 ****************************/
	public int insert(BookDto book);
	/****************************
	 2. 수정(update)
	 ****************************/
	public int update(BookDto book);
	/****************************
	 3. 삭제(delete)
	 ****************************/
	public int delete(BookDto book);
	/****************************
	  === executeQuery ===
	  4. 상세(detail)
	 ****************************/
	public BookDto detail(Command command);
	
	/****************************
	  5. 조회(search)
	 ****************************/
	public List<BookDto> search(Command command);
	/****************************
	  6. 목록(list)
	 ****************************/
	public List<BookDto> list(Command command);
	/****************************
	  7. 크기(size)
	 ****************************/
	public int size();
	/****************************
	  8. 카운팅(count)
	 ****************************/
	public int count(Command command);
}
