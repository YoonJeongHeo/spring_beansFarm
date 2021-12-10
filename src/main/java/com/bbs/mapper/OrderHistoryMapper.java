package com.bbs.mapper;

import java.util.List;

import com.bbs.model.ProductDTO;
import com.bbs.page.MypageCriteria;

public interface OrderHistoryMapper {

	// 메인마이페이지 주문내역 조회. 5개까지 보임
	public List<ProductDTO> myOrderHistory(Long m_no);

	public List<ProductDTO> myAllOrderHistory(MypageCriteria cri);

	public int getTotal(Long m_no);
	


}
