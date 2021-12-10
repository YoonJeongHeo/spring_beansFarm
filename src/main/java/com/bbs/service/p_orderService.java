package com.bbs.service;

import java.util.List;

import com.bbs.model.P_orderDTO;

public interface p_orderService {

	public void orderInsert(P_orderDTO p_orderDTO);

	public List<P_orderDTO> adminMainOH();

	public List<P_orderDTO> adminOrderListPage();

	

}
