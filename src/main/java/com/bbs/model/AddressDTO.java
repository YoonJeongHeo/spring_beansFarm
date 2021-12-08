package com.bbs.model;

import lombok.Data;

@Data
public class AddressDTO {
	
	public Long addr_no;
	public Long m_no;
	public String addr_nickname;
	public String postnum;
	public String address;
	public String detailed_address;
	public String recipient_name;
	public String recipient_phone;
	public String address_delete;
	
}
