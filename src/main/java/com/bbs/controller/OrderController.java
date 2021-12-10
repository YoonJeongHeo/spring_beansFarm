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
import com.bbs.model.CategoryDTO;
import com.bbs.model.MemberDTO;
import com.bbs.model.POptionDTO;
import com.bbs.model.P_orderDTO;
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
	
	@Autowired
	private p_orderService orderService;
	
	
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
	
	// 결제완료 (주문서추가)
	@PostMapping("/insert")
	@ResponseBody
	public String orderInsert(
			HttpServletRequest request,
			@RequestParam("order_id") String order_id,
			@RequestParam("recipient_name") String recipient_name,
			@RequestParam("postnum") String postnum,
			@RequestParam("address") String address,
			@RequestParam("detailed_address") String detailed_address,
			@RequestParam("recipient_phone") String recipient_phone,
			
			@RequestParam("cart_noArr") List<Long> cart_noArr
			
						
			) {
		
		HttpSession session = request.getSession();
		Long userNO = (Long) session.getAttribute("userNO");
				
		System.out.println("주문서 추가");
		System.out.println("회원번호 : " + userNO);
		System.out.println("주문번호 : " + order_id);
		System.out.println("받는사람 : " + recipient_name);
		System.out.println("우편번호 : " + postnum);
		System.out.println("기본주소 : " + address);
		System.out.println("상세주소 : " + detailed_address);
		System.out.println("연락처 : " + recipient_phone);
		System.out.println("장바구니번호 : " + cart_noArr);
		
		P_orderDTO p_DTO = new P_orderDTO();
		p_DTO.setCart_noArr(cart_noArr);
		System.out.println(p_DTO);
		
		for(Long i : cart_noArr) {
		CartDTO cartDTO = cartService.selectOne(i);
		System.out.println(cartDTO);
		}
		
		for(Long i : cart_noArr) {
			p_DTO.setOrder_id(order_id);
			p_DTO.setM_no(userNO);
			p_DTO.setPostnum(postnum);
			p_DTO.setAddress(address);
			p_DTO.setDetailed_address(detailed_address);
			p_DTO.setRecipient_name(recipient_name);
			p_DTO.setRecipient_phone(recipient_phone);
			
			CartDTO cartDTO = cartService.selectOne(i);
			p_DTO.setP_no(cartDTO.getP_no());
			p_DTO.setOp_no1(cartDTO.getOp_no1());
			p_DTO.setOption_quantity1(cartDTO.getOption_quantity1());
			p_DTO.setOp_no2(cartDTO.getOp_no2());
			p_DTO.setOrder_price(cartDTO.getOrder_price());
			orderService.orderInsert(p_DTO);
			cartService.deleteOne(i);
		}
		
		
		
		return "/orderviews/insert";
	}
	
	
	
}
