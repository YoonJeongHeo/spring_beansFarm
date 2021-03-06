package com.bbs.model;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class P_orderDTO {
	private List<Long> cart_noArr;
	private Long order_no;
	private String order_id;
	private Long m_no;
	private Long c_no;
	private String postnum;
	private String address;
	private String detailed_address;
	private String recipient_name;
	private String recipient_phone;
	private int point_use;
	private int order_price;
	private Timestamp order_reg_date;
	private Long p_no;
	private int op_no1;
	private int op_no;
	private int option_quantity1;
	private int op_no2;
	private String p_return;
	private int op_stock;
	private Long cart_no;
	// 관리자페이지에서 전체 주문현황 보기위한 데이터 추가.
	private String p_name;
	private String m_id;	
	private String membership_no;	
	private String membership_name;	
	private String m_email;
	
	// 마이페이지에서 전체 주문현황 보기위한 데이터 추가.
	private int category_no;
	private int p_price;
	private String p_manufacturer;
	private int origin_no;
	private String p_image;
	private String p_thumbnail;
	
	//리뷰
	private String r_thumbnail;
	private String r_title;
	private String r_content;
	private int r_star;
}
