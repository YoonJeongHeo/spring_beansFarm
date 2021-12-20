package com.bbs.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bbs.model.P_orderDTO;
import com.bbs.model.ProductDTO;
import com.bbs.page.Criteria;
import com.bbs.page.MypageCriteria;

public interface p_orderService {

	public void orderInsert(P_orderDTO p_orderDTO);

	public List<P_orderDTO> adminMainOH();

	public List<P_orderDTO> adminOrderListPage(Criteria cri);

	public int getTotal(Criteria cri);

	public List<P_orderDTO> myOrderList(Long m_no);

	public List<P_orderDTO> myAllOrderList(MypageCriteria cri);

	public void updateNtoY(P_orderDTO orderDTO);

	public void updateYtoN(P_orderDTO orderDTO);

	public void stockUpdate(P_orderDTO p_DTO);
	
	public List<P_orderDTO> myOrderHistory(Long m_no);

	public List<ProductDTO> myAllOrderHistory(MypageCriteria cri);

	public int getTotalM_no(Long m_no);

	public List<P_orderDTO> selectOne(Long order_no);

	
	
}
