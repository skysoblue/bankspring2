package com.bankspring.web;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bankspring.domain.ArticleDto;
import com.bankspring.factory.CommandFactory;
import com.bankspring.service.ArticleService;

@Controller
@RequestMapping("/article")
public class ArticleController {
	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);
	@Autowired ArticleDto article;
	@Autowired ArticleService service;
	
	@RequestMapping("/list")
	public @ResponseBody List<ArticleDto> list (@RequestParam(value="pageNo",defaultValue="1")
			String paramPage){
		List<ArticleDto> list = new ArrayList<ArticleDto>();
		int pageNo = Integer.parseInt(paramPage);
		list = service.list(CommandFactory.list(pageNo));
		System.out.println("리스트결과" + list.toString());
		return list;
	}
	@RequestMapping("/search/{userid}/{pageNo}")
	public @ResponseBody List<ArticleDto> search(@PathVariable("pageNo")String paramPage,
			@PathVariable("userid")String userid){
		List<ArticleDto> list = new ArrayList<ArticleDto>();
		int pageNo = Integer.parseInt(paramPage);
		list = service.search(CommandFactory.search(pageNo,"userid",userid,1000)); //1000 테마 시퀀스넘버 (방명록)
		System.out.println("리스트결과" + list.toString());
		return list;
	}
}
