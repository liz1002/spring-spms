package com.khrd.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.khrd.domain.Criteria;
import com.khrd.domain.PageMaker;
import com.khrd.domain.SpmsVO;
import com.khrd.service.SpmsService;

@Controller
public class SpmsController {
	private static final Logger logger = LoggerFactory.getLogger(SpmsController.class);
	
	@Autowired
	SpmsService service;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void list(Criteria cri, Model model) {
		logger.info("===== list =====");
		logger.info("===== cri 확인 : " + cri + " =====");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount());
		
		List<SpmsVO> list = service.list(cri);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value = "read", method = RequestMethod.GET)
	public void read(int no, Criteria cri, Model model) {
		logger.info("===== read =====");
		logger.info("===== no 확인 : " + no + " =====");
		logger.info("===== cri 확인 : " + cri + " =====");
		
		SpmsVO vo = service.read(no);
		logger.info("===== vo 확인 : " + vo + " =====");
		
		model.addAttribute("vo", vo);
		model.addAttribute("cri", cri);
	}
	
	@RequestMapping(value = "regist", method = RequestMethod.GET)
	public void registGet() {
		logger.info("===== regist get =====");
	}
	
	@RequestMapping(value = "regist", method = RequestMethod.POST)
	public String registPost(SpmsVO vo) {
		logger.info("===== regist post =====");
		logger.info("===== vo 확인 : " + vo + " =====");
		
		service.regist(vo);
		
		return "redirect:/list";
	}
	
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public void modifyGet(int no, Criteria cri, Model model) {
		logger.info("===== modify get =====");
		logger.info("===== no 확인 : " + no + " =====");
		logger.info("===== cri 확인 : " + cri + " =====");
		
		SpmsVO vo = service.read(no);
		logger.info("===== vo 확인 : " + vo + " =====");
		
		model.addAttribute("vo", vo);
		model.addAttribute("cri", cri);
	}
	
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String modifyPost(SpmsVO vo, Criteria cri) {
		logger.info("===== modify post =====");
		logger.info("===== vo 확인 : " + vo + " =====");
		logger.info("===== cri 확인 : " + cri + " =====");
		
		service.modify(vo);
		
		return "redirect:/read?no=" + vo.getNo() + "&page=" + cri.getPage();
	}
	
	@RequestMapping(value = "remove", method = RequestMethod.GET)
	public String removeGet(int no, Criteria cri) {
		logger.info("===== remove get =====");
		logger.info("===== no 확인 : " + no + " =====");
		logger.info("===== cri 확인 : " + cri + " =====");
		
		service.remove(no);
		
		return "redirect:/list?page=" + cri.getPage();
	}
}
