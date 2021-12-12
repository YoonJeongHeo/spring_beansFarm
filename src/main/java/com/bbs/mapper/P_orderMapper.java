package com.bbs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bbs.model.P_orderDTO;
import com.bbs.page.Criteria;
import com.bbs.page.MypageCriteria;

public interface P_orderMapper {

	public void orderInsert(P_orderDTO p_orderDTO);

	public List<P_orderDTO> adminMainOH();

	public List<P_orderDTO> adminOrderListPage(Criteria cri);

	public int getTotal(Criteria cri);

	public List<P_orderDTO> myOrderList(Long m_no);

	public List<P_orderDTO> myAllOrderList(@Param("m_no") Long m_no, @Param("cri") MypageCriteria cri);



}
