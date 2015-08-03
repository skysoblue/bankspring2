package com.bankspring.demo.domain;

public class UserDto {
	private String name;
	public UserDto() {}
	public UserDto(String name) {
		this.name = name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
}
