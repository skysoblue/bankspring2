package com.bankspring.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bankspring.domain.MemberDto;
import com.bankspring.factory.Command;
import com.bankspring.mapperImpl.MemberMapperImpl;
import com.bankspring.service.MemberService;
import com.bankspring.web.MemberController;


@Service
public class MemberServiceImpl implements MemberService{
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	/*===== Field =====*/	
	Map<String,Object> map = new HashMap<String,Object>();
	MemberDto member = new MemberDto();
	
	@Autowired
	MemberMapperImpl memberMapper;

/*===== executeUpdate =====*/
    @Override
    public int joinMember(MemberDto member) {
    	logger.info("[ 서비스 ] 회원가입 이름 = {}", member.getName());
        return memberMapper.insert(member);
    }
    @Override
	public int updateMember(MemberDto member) {
    	logger.info("[ 서비스 ] 회원수정 이름 = {}", member.getName());
		return memberMapper.update(member);
	}
	@Override
	public int deleteMember(MemberDto member) {
		logger.info("[ 서비스 ] 회원탈퇴 이름 = {}", member.getName());
		return memberMapper.delete(member);
	}
   
/*===== executeQuery =====*/	
	@Override
	public MemberDto memberDetail(Command command) {
		logger.info("[서비스] 회원검색 아이디={}",command.getSearchVal());
		return memberMapper.getElementById(command);
	}
	@Override
	public List<MemberDto> searchByKeyword(Command command) {
		logger.info("[서비스] 회원검색 키워드={}",command.getSearchVal());
		return memberMapper.getElementsByName(command);
	}
	
	@Override
	public MemberDto login(Command command) {
		logger.info("[서비스] 로그인 아이디={}",command.getSearchKey());
		return memberMapper.login(command);
	}
    @Override
    public List<MemberDto> memberList(Command command) {
    	logger.info("[서비스] 회원목록 페이지 번호={}",command.getPageNo());
        return  memberMapper.list(command);
    }
	@Override
	public int memberCountAll() {
		logger.info("[서비스] 전체 회원수 지나는 중...");
		return memberMapper.countAll();
	}
	@Override
	public int memberCountSome(Command command) {
		logger.info("[서비스] 특정 회원수={}",command.getSearchVal());
		return memberMapper.countSome(command);
	}
}
