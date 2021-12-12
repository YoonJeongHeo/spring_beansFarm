package com.bbs.mapper;

import java.util.List;

import com.bbs.model.P_orderDTO;

public interface P_orderMapper {

	public void orderInsert(P_orderDTO p_orderDTO);

	public List<P_orderDTO> adminMainOH();

	public List<P_orderDTO> adminOrderListPage();

	public List<P_orderDTO> myOrderList(Long m_no);



}
