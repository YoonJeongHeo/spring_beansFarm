package com.bbs.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/errorviews/*")
public class ErrorController {

	@RequestMapping(value = "/default-error")
	public String DefaultErrorpage(Exception e,HttpSession session, HttpServletRequest req, HttpServletResponse res) {

		e.printStackTrace();
		
		return "/errorviews/default_error";
	}
	

	@RequestMapping(value = "/no-resource")
	public String noresourceError(Exception e, HttpSession session, HttpServletRequest req, HttpServletResponse res){
		
		e.printStackTrace();
		
		return "/errorviews/no_resource";
	}
	
	@RequestMapping(value = "/server-error")
	public String serverError(Exception e, HttpSession session, HttpServletRequest req, HttpServletResponse res){

		e.printStackTrace();
		
		return "/errorviews/server_error";
	}

}
