package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ranking")
public class RankingController {
	private static final Logger logger = LoggerFactory.getLogger(RankingController.class);

	@RequestMapping("/ranking")
	public String ranking() { //http://localhost:8080/teamproject
		logger.info("실행");
		return "ranking/ranking";
	}
}
