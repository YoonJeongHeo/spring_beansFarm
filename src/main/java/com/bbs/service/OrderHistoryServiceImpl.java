package com.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.mapper.OrderHistoryMapper;
import com.bbs.model.ProductDTO;
import com.bbs.page.MypageCriteria;


@Service
public class OrderHistoryServiceImpl implements OrderHistoryService {

	@Autowired
	private OrderHistoryMapper mapper;
	
	@Override
	public List<ProductDTO> myOrderHistory(Long m_no) {
		
		return mapper.myOrderHistory(m_no);
	}

	@Override
	public List<ProductDTO> myAllOrderHistory(MypageCriteria cri) {
		
		return mapper.myAllOrderHistory(cri);
	}

	@Override
	public int getTotal(Long m_no) {
		
		return mapper.getTotal(m_no);
	}


	
	

}
