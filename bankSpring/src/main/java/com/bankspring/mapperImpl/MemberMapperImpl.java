package com.bankspring.mapperImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bankspring.domain.MemberDto;
import com.bankspring.factory.Command;
import com.bankspring.mapper.MemberMapper;
@Repository
public class MemberMapperImpl implements MemberMapper{
	String namespace = "com.bankspring.mapper.MemberMapper.";
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insert(MemberDto member) {
		return sqlSession.insert(
				namespace+"insert",member);
	}

	@Override
	public int update(MemberDto member) {
		return sqlSession.update(
				namespace+"update",member);
	}

	@Override
	public int delete(MemberDto member) {
		return sqlSession.delete(
				namespace+"delete",member);
	}

	@Override
	public int countAll() {
		return sqlSession.selectOne(
				namespace+"countAll");
	}

	@Override
	public int countSome(Command command) {
		return sqlSession.selectOne(
				namespace+"countSome",command);
	}

	@Override
	public MemberDto getElementById(Command command) {
		return sqlSession.selectOne(
				namespace+"getElementById",command);
	}

	@Override
	public List<MemberDto> getElementsByName(Command command) {
		return sqlSession.selectList(
				namespace+"getElementsByName",command);
	}

	@Override
	public List<MemberDto> list(Command command) {
		return sqlSession.selectList(
				namespace+"list",command);
	}

	@Override
	public MemberDto login(Command command) {
		return sqlSession.selectOne(
				namespace+"login",command);
	}



}
