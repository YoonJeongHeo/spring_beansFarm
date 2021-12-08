 package com.bbs.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbs.model.AddressDTO;
import com.bbs.model.CartDTO;
import com.bbs.model.MemberDTO;
import com.bbs.model.POptionDTO;
import com.bbs.model.ProductDTO;
import com.bbs.service.AddressService;
import com.bbs.service.CartService;
import com.bbs.service.MemberService;
import com.bbs.service.POptionService;
import com.bbs.service.ProductService;
import com.bbs.service.p_orderService;
 
@Controller
@RequestMapping("/orderviews/*")
public class OrderController {
	
	@Autowired
	private p_orderService p_orderService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private POptionService opService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AddressService addressService;
	
	
	//주문 페이지 열기
	@PostMapping("/orderCon_view")
	public String orderCon(@RequestParam("cartNoList")String cartNoList, Model model,
			HttpServletRequest request
			) {
		System.out.println("주문 페이지 열기");
		
		HttpSession session = request.getSession();
		Long m_no = (Long)session.getAttribute("userNO");
		System.out.println(m_no);
		String[] cartNo = cartNoList.split(",");
		
		
		ArrayList<CartDTO> cartList = new ArrayList<>();
		
		for(String i : cartNo) {
			cartList.add(cartService.selectOne(Long.parseLong(i)));
		}
		
		List<ProductDTO> productList = productService.selectByAllDetails();
		List<POptionDTO> opList = opService.selectByAll();
		MemberDTO memberList = memberService.selectByOne(m_no);
		List<AddressDTO> addressList = addressService.selectByOne(m_no);
		
		System.out.println("addressList===============>"+addressList);
		System.out.println("memberList===============>"+memberList);
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("addressList", addressList);
		model.addAttribute("cartList", cartList);
		model.addAttribute("productList", productList);
		model.addAttribute("opList", opList);
		
		
		System.out.println("주문페이로 가기");
		
		return "/orderviews/orderCon_view";
	}
	
	
	
	//이용약관
	@GetMapping("/terms")
	public String admin_B() {
		
		
		
		System.out.println("주문서 작성에 이용약관 불러오기");
		
		return "/orderviews/terms";  
	}
	

	// 주소지추가 컨트롤러
	@RequestMapping(value = "/insertAddrAjax", method =  {RequestMethod.POST})
	@ResponseBody
	public int insertAddr(AddressDTO addressDTO, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Long m_no = (Long)session.getAttribute("userNO");
		
		addressDTO.setM_no(m_no);
		List<AddressDTO>addressList = addressService.selectByOne(m_no);
		addressList.size();
		
		if(addressList.size() < 5) {
			addressService.insertAddr(addressDTO);
		}else {
			return 0;
		}
		
		System.out.println("주소지추가 이동!");
		
		
		System.out.println(addressDTO);
		
		return 1;
	}
	
	
	
	
	
	
}
