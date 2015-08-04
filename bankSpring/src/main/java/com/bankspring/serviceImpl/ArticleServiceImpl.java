package com.bankspring.serviceImpl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bankspring.domain.ArticleDto;
import com.bankspring.factory.Command;
import com.bankspring.mapper.ArticleMapper;
import com.bankspring.mapperImpl.ArticleMapperImpl;
import com.bankspring.service.ArticleService;
import com.bankspring.web.AdminController;
@Service
public class ArticleServiceImpl implements ArticleService{
	private static final Logger logger = LoggerFactory.getLogger(ArticleServiceImpl.class);
	@Autowired ArticleMapperImpl mapper;
	@Override
	public int insert(ArticleDto article) {
		logger.info("[서비스] 삽입");
		return mapper.insert(article);
	}
	@Override
	public int update(ArticleDto article) {
		logger.info("[서비스] 수정");
		return mapper.update(article);
	}
	@Override
	public int delete(ArticleDto article) {
		logger.info("[서비스] 삭제");
		return mapper.delete(article);
	}
	@Override
	public ArticleDto detail(Command command) {
		logger.info("[서비스] 상세");
		return mapper.detail(command);
	}
	@Override
	public List<ArticleDto> search(Command command) {
		logger.info("[서비스] 조회");
		return mapper.search(command);
	}
	@Override
	public List<ArticleDto> list(Command command) {
		logger.info("[서비스] 목록");
		return mapper.list(command);
	}
	@Override
	public int size(Command command) {
		logger.info("[서비스] 사이즈");
		return mapper.size(command);
	}
	@Override
	public int count(Command command) {
		logger.info("[서비스] 카운팅");
		return mapper.count(command);
	}
}
