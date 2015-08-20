package com.bankspring.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	//******************************************
	//no execute
	//******************************************
	@RequestMapping("/path/{theme}/{action}")
	public String path(@PathVariable("theme")String theme,
			@PathVariable("action")String action,
			@ModelAttribute("user")MemberDto user,Model model){
		// .jsp 는 타일즈에서 선언되 noTemplate 을 타기 위한 가상경로이다
		// 실제 jsp 파일을 가리키는 것이 아니다.
		logger.info("[컨트롤러 경로 액션] 경로={}, 액션={}", theme, action);
		model.addAttribute("member", user);
		model.addAttribute("action",action);
		return "auth/content/"+theme+".tiles";
	}
	//******************************************
	//executeUpdate
	//******************************************
	@RequestMapping(value="/write",method=RequestMethod.GET)
	public @ResponseBody List<ArticleDto> write(
			@ModelAttribute ArticleDto article){
		logger.info("글쓰기 아이디={}",article.getUserid());
		logger.info("글쓰기 제목={}",article.getTitle());
		logger.info("글쓰기 컨텐츠={}",article.getContent());
		List<ArticleDto> list = new ArrayList<ArticleDto>();
		int ok = service.insert(article);
		if (ok==1) {
			list = service.search(CommandFactory.search(1,"userid",article.getUserid(),1000));
		} else {
			list = null;
		}
		return list;
	}
	@RequestMapping("/update")
	public @ResponseBody ArticleDto update(
			@ModelAttribute ArticleDto article){
		int ok = service.update(article);
		if (ok == 1) {
			article = service.detail(CommandFactory.detail("userid", article.getUserid(), article.getArtSeq()));
		} else {
			article = null;
		}
		return article;
	}
	@RequestMapping("/remove")
	public String delete(
			@ModelAttribute ArticleDto article){
		int ok = service.delete(article);
		logger.info("글삭제 성공여부 : {}" , ok);
		logger.info("리다이렉트 아이디 : {}",article.getUserid());
		return "redirect:/article/search/1000/"+article.getUserid()+"/1";
	}	
	//******************************************
	//executeQuery
	//******************************************
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
	@RequestMapping("/search/{theme}/{userid}/{pageNo}")
	public @ResponseBody Map<String,Object> search(
			@PathVariable("pageNo")String paramPage,
			@PathVariable("theme")String strTheme,
			@PathVariable("userid")String userid){
		Map<String,Object>map = new HashMap<String,Object>();
		List<ArticleDto> list = new ArrayList<ArticleDto>();
		int pageNo = Integer.parseInt(paramPage);
		int theme = Integer.parseInt(strTheme);
		int size = service.size(CommandFactory.size(1000,userid));
		list = service.search(CommandFactory.search(pageNo,"userid",userid,theme)); //1000 테마 시퀀스넘버 (방명록)
		
		logger.info("리스트결과 = {}" + list.toString());
		logger.info("리스트 사이즈 = {}" + size);
		
		map.put("currentPage", pageNo);
		map.put("size", size);
		map.put("list", list);
		
		return map;
	}
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
	
	
	
		
/*
redirect : 1. DB 에 변화가 발생하는 요청 executeUpdate (로그인,회원가입,글쓰기 )
		   2. URL 이 바뀜
		   3. model 객체 초기화
forward  : 1. DB 에 변화가 발생하지 않는 요청 executeQuery
		   2. URL 이 바뀌지 않음
		   3. model 객체까지 넘김 
*/
	}







