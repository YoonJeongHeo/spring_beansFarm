package com.bbs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.bbs.model.ReviewDTO;
import com.bbs.page.Criteria;
import com.bbs.page.MypageCriteria;


public interface ReviewMapper {

	
	public void insert(ReviewDTO r_dto);
	
	public List<ReviewDTO> my_review_list(Long m_no);

	public ReviewDTO my_review_update_form(Long r_no);



	public void reviewDelete(Long r_no);

	public void reviewUpdate(ReviewDTO dto);

	public List<ReviewDTO> my_review_list_all(MypageCriteria cri);

	public int getTotal(Long m_no);

	public int cannotWriteFnc(ReviewDTO reDTO);

	public ReviewDTO my_review_one_show(long r_no);

	
}
