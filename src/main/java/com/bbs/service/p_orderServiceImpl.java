package com.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.mapper.P_orderMapper;
import com.bbs.model.P_orderDTO;
import com.bbs.page.Criteria;

@Service
public class p_orderServiceImpl implements p_orderService{

	@Autowired
	private P_orderMapper p_orderMapper;
	
	@Override
	public void orderInsert(P_orderDTO p_orderDTO) {
		
		p_orderMapper.orderInsert(p_orderDTO);
	}

	@Override
	public List<P_orderDTO> adminMainOH() {
		
		return p_orderMapper.adminMainOH();
	}

	@Override
	public List<P_orderDTO> adminOrderListPage(Criteria cri) {
		
		return p_orderMapper.adminOrderListPage(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		
		return p_orderMapper.getTotal(cri);
	}
	
	

}
