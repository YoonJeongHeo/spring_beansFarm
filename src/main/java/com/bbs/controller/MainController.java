package com.bbs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bbs.model.ProductDTO;
import com.bbs.page.Criteria;
import com.bbs.page.ProductCriteria;
import com.bbs.service.CategoryService;
import com.bbs.service.ProductService;

@Controller
public class MainController {
	
	@Autowired
	ProductService product;
	
	//메인페이지
	@GetMapping("/")
	public String main_view(Model model) {
		ProductCriteria cri = new ProductCriteria();
		cri.setKeyword("");
		List<ProductDTO>productList = product.selectByAllPage(cri);
		model.addAttribute("productList", productList);
		
		return "mainviews/main_view";
	}
	
	
	
	// 로그아웃하기
	@PostMapping("/logoutAjax")
	public String logoutAjax(HttpServletRequest request) {
		
		System.out.println("logoutAjax 실행");
		
		HttpSession session = request.getSession();
//			session.getAttribute("userID");
//			session.getAttribute("userName");
		session.invalidate();
		
		System.out.println("로그아웃하기");
		
		return "redirect:/";
	}
	
	
}
