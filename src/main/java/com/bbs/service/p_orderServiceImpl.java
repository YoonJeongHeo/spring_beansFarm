package com.bbs.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.mapper.P_orderMapper;
import com.bbs.model.P_orderDTO;
import com.bbs.model.ProductDTO;
import com.bbs.page.Criteria;
import com.bbs.page.MypageCriteria;

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

	@Override
	public List<P_orderDTO> myOrderList(Long m_no) {
		
		return p_orderMapper.myOrderList(m_no);
	}

	@Override
	public List<P_orderDTO> myAllOrderList(MypageCriteria cri) {
		
		return p_orderMapper.myAllOrderList(cri);
	}

	@Override
	public void updateNtoY(P_orderDTO orderDTO) {
		p_orderMapper.updateNtoY(orderDTO);
		
	}

	@Override
	public void updateYtoN(P_orderDTO orderDTO) {
		p_orderMapper.updateYtoN(orderDTO);
		
	}

	@Override
	public void stockUpdate(P_orderDTO p_DTO) {
		
		
		p_orderMapper.stockUpdate(p_DTO);
		
		
	}

	@Override
	public List<P_orderDTO> myOrderHistory(Long m_no) {
		return p_orderMapper.myOrderHistory(m_no);
	}

	@Override
	public List<ProductDTO> myAllOrderHistory(MypageCriteria cri) {
		
		return p_orderMapper.myAllOrderHistory(cri);
	}

	@Override
	public int getTotalM_no(Long m_no) {
		
		return p_orderMapper.getTotalM_no(m_no);
	}

	@Override
	public List<P_orderDTO> selectOne(Long order_no) {
		
		
		return p_orderMapper.selectOne(order_no);
		
	}
	
	

}
