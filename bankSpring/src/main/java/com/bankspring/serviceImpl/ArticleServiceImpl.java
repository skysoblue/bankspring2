package com.bankspring.serviceImpl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bankspring.mapper.ArticleMapper;
import com.bankspring.mapperImpl.ArticleMapperImpl;
import com.bankspring.service.ArticleService;
import com.bankspring.web.AdminController;
@Service
public class ArticleServiceImpl implements ArticleService{
	private static final Logger logger = LoggerFactory.getLogger(ArticleServiceImpl.class);
	@Autowired ArticleMapperImpl articleMapper;
}
