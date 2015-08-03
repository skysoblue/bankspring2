package com.bankspring.demo.serviceImpl;

import com.bankspring.demo.domain.UserDto;
import com.bankspring.demo.service.UserService;

public class UserServiceImpl implements UserService{
	private UserDto user;
	@Override
	public void test() {
		System.out.println(user.getName());
	}
	public UserServiceImpl() {}
	public UserServiceImpl(UserDto user) {
		this.user = user;
	}
	public UserDto getUser() {
		return user;
	}
	public void setUser(UserDto user) {
		this.user = user;
	}
	
}
