package com.bankspring.factory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SizeCommand extends Command {
	private static final Logger logger = LoggerFactory.getLogger(SizeCommand.class);
	@Override
	public void execute() {
		logger.info("전체목록수");
	}
	@Override
	public void execute(int theme) {
		setTheme(theme);
		logger.info("테마별 목록수");
	}
}
