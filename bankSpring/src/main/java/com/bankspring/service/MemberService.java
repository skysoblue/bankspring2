package com.bankspring.service;

import java.util.List;

import com.bankspring.domain.MemberDto;
import com.bankspring.factory.Command;

public interface MemberService {
/*===== executeUpdate =====*/	
	
	/*insert : 회원가입*/
    public int join(MemberDto bean);
    /*update : 회원정보 수정*/
    public int update(MemberDto bean);
    /*delete : 회원탈퇴*/
    public int delete(MemberDto bean);
    
/*===== executeQuery =====*/    
    
    /*getElementsByName : 검색어로 회원 검색*/
    public List<MemberDto> search(Command command);
    /*list : 회원전체 목록*/
    public List<MemberDto> list(Command command);
    /*login : 로그인*/
    public MemberDto login(Command command);
    /*count : 회원수*/
    public int size();
    /*count : 특정 회원수*/
    public int count(Command command);
    /*getElementById : 회원상세정보*/
    public MemberDto detail(Command command);
    
}
