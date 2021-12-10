package com.bbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bbs.model.ProductDTO;
import com.bbs.page.MypageCriteria;


public interface OrderHistoryService {

	List<ProductDTO> myOrderHistory(Long m_no);

	List<ProductDTO> myAllOrderHistory(MypageCriteria cri);

	int getTotal(Long m_no);

	
	
}
