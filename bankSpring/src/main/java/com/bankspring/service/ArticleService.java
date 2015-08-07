package com.bankspring.service;

import java.util.List;

import com.bankspring.domain.ArticleDto;
import com.bankspring.factory.Command;

public interface ArticleService {
	/****************************/
	/*  === executeUpdate ===  */
	/****************************/
	public int insert(ArticleDto article);
	public int update(ArticleDto article);
	public int delete(ArticleDto article);
	
	/****************************/
	/*  === executeQuery ===  */
	/****************************/
	public ArticleDto detail(Command command);
	public List<ArticleDto> search(Command command);
	public List<ArticleDto> list(Command command);
	public int size(Command command);
	public int count(Command command);
}
