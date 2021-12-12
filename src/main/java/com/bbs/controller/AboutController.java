package com.bbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/aboutviews/*")
public class AboutController {
	         
	
	// about 페이지 이동
	 @GetMapping("/about_view")
	 public String about_view(){
		 
		 System.out.println("about 페이지 이동");
		 
		return "/aboutviews/about_view";
	 }
}
