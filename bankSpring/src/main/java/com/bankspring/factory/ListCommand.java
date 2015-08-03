package com.bankspring.factory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ListCommand extends Command {
	private static final Logger logger = LoggerFactory.getLogger(ListCommand.class);
	@Override
	public void execute(int pageNo) {
		setPageNo(pageNo);
		logger.info("리스트 커맨드 에서 설정된 시작 = {}, 끝 ={}", getStart(),getEnd());
	}
	@Override
	public void execute(int pageNo, int theme) {
		setPageNo(pageNo);
		setTheme(theme);
		logger.info("리스트 커맨드 에서 설정된 시작 = {}, 끝 ={}", getStart(),getEnd());
	}
}
