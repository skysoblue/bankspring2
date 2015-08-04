package com.bankspring.mapperImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bankspring.domain.ArticleDto;
import com.bankspring.factory.Command;
import com.bankspring.mapper.ArticleMapper;
@Repository
public class ArticleMapperImpl implements ArticleMapper{
	private static final Logger logger = LoggerFactory.getLogger(ArticleMapperImpl.class);
	@Autowired SqlSessionTemplate sqlSession;
	String namespace = "com.bankspring.mapper.ArticleMapper.";
	@Override
	public int insert(ArticleDto article) {
		
		return sqlSession.insert(namespace+"insert", article);
	}

	@Override
	public int update(ArticleDto article) {
		return sqlSession.update(namespace+"update", article);
	}

	@Override
	public int delete(ArticleDto article) {
		return sqlSession.delete(namespace+"delete", article);
	}

	@Override
	public ArticleDto detail(Command command) {
		return sqlSession.selectOne(namespace+"detail", command);
	}

	@Override
	public List<ArticleDto> search(Command command) {
		return sqlSession.selectList(namespace+"search", command);
	}

	@Override
	public List<ArticleDto> list(Command command) {
		return sqlSession.selectList(namespace+"list", command);
	}

	@Override
	public int size(Command command) {
		return sqlSession.selectOne(namespace+"size", command);
	}

	@Override
	public int count(Command command) {
		return sqlSession.selectOne(namespace+"count", command);
	}
}
