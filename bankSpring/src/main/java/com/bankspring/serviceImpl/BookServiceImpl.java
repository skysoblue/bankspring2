package com.bankspring.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bankspring.domain.BookDto;
import com.bankspring.factory.Command;
import com.bankspring.mapper.BookMapper;
import com.bankspring.service.BookService;
@Service
public class BookServiceImpl implements BookService{
	@Autowired SqlSession sqlSession; 
	@Override
	public int add(BookDto book) {
		BookMapper mapper = sqlSession.getMapper(BookMapper.class);
		return mapper.insert(book);
	}

	@Override
	public int update(BookDto book) {
		BookMapper mapper = sqlSession.getMapper(BookMapper.class);
		return mapper.update(book);
	}

	@Override
	public int delete(BookDto book) {
		BookMapper mapper = sqlSession.getMapper(BookMapper.class);
		return mapper.delete(book);
	}

	@Override
	public List<BookDto> search(Command command) {
		BookMapper mapper = sqlSession.getMapper(BookMapper.class);
		return mapper.search(command);
	}

	@Override
	public List<BookDto> list(Command command) {
		BookMapper mapper = sqlSession.getMapper(BookMapper.class);
		return mapper.list(command);
	}

	@Override
	public BookDto login(Command command) {
		BookMapper mapper = sqlSession.getMapper(BookMapper.class);
		return mapper.detail(command);
	}

	@Override
	public int size() {
		BookMapper mapper = sqlSession.getMapper(BookMapper.class);
		return mapper.size();
	}

	@Override
	public int count(Command command) {
		BookMapper mapper = sqlSession.getMapper(BookMapper.class);
		return mapper.count(command);
	}

	@Override
	public BookDto detail(Command command) {
		BookMapper mapper = sqlSession.getMapper(BookMapper.class);
		return mapper.detail(command);
	}

}
