package com.bankspring.web;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bankspring.domain.ArticleDto;
import com.bankspring.domain.MemberDto;
import com.bankspring.factory.CommandFactory;
import com.bankspring.service.ArticleService;

@Controller
@SessionAttributes("user")
@RequestMapping("/article")
public class ArticleController {
	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);
	@Autowired ArticleDto article;
	@Autowired ArticleService service;
	
	@RequestMapping("/list/{theme}/{pageNo}")
	public @ResponseBody List<ArticleDto> list (
			@PathVariable("pageNo")String paramPage,
			@PathVariable("theme")String strTheme){
		List<ArticleDto> list = new ArrayList<ArticleDto>();
		if (paramPage == null) {
			paramPage = "1";
		}
		int pageNo = Integer.parseInt(paramPage);
		int theme = Integer.parseInt(strTheme);
		list = service.list(CommandFactory.list(pageNo,theme));
		System.out.println("리스트결과" + list.toString());
		return list;
	}
	@RequestMapping("/search/{theme}/{userid}/{pageNo}")
	public @ResponseBody List<ArticleDto> search(@PathVariable("pageNo")String paramPage,
			@PathVariable("theme")String strTheme,
			@PathVariable("userid")String userid){
		List<ArticleDto> list = new ArrayList<ArticleDto>();
		int pageNo = Integer.parseInt(paramPage);
		int theme = Integer.parseInt(strTheme);
		list = service.search(CommandFactory.search(pageNo,"userid",userid,theme)); //1000 테마 시퀀스넘버 (방명록)
		System.out.println("리스트결과" + list.toString());
		return list;
	}
	@RequestMapping("/path/{path}")
	public String path(@PathVariable("path")String path,
			@ModelAttribute("user")MemberDto user,Model model){
		// .jsp 는 타일즈에서 선언되 noTemplate 을 타기 위한 가상경로이다
		// 실제 jsp 파일을 가리키는 것이 아니다.
		model.addAttribute("member", user);
		return "article/"+path+".jsp";
	}
	@RequestMapping(value="/write",method=RequestMethod.GET)
	public @ResponseBody List<ArticleDto> write(
			@RequestParam("userid")String userid,
			@RequestParam("thmSeq")String thmSeq,
			@RequestParam("title")String title,
			@RequestParam("content")String content
			
			){
		logger.info("글쓰기 아이디={}",userid);
		logger.info("글쓰기 테마={}",thmSeq);
		logger.info("글쓰기 제목={}",title);
		logger.info("글쓰기 컨텐츠={}",content);
		List<ArticleDto> list = new ArrayList<ArticleDto>();
		article.setUserid(userid);
		article.setThmSeq(Integer.parseInt(thmSeq));
		article.setTitle(title);
		article.setContent(content);
		int ok = service.insert(article);
		if (ok==1) {
			list = service.search(CommandFactory.search(1,"userid",article.getUserid(),1000));
			
		} else {
			list = null;
		}
		return list;
	}
	@RequestMapping("/detail/{userid}/{artSeq}")
	public @ResponseBody ArticleDto detail(
			@PathVariable("userid")String userid,
			@PathVariable("artSeq")String artSeq){
		// .jsp 는 타일즈에서 선언되 noTemplate 을 타기 위한 가상경로이다
		// 실제 jsp 파일을 가리키는 것이 아니다.
		logger.info("[상세]아이디={}",userid);
		logger.info("[상세]글 일련번호={}",artSeq);
		return service.detail(CommandFactory.detail("userid", userid, Integer.parseInt(artSeq)));
	}
}
