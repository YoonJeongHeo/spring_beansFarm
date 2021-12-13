<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<link rel="stylesheet" href="../../../resources/css/admin/adminMain.css">

<script src="../../../resources/js/jquery-3.6.0.min.js" ></script>
<script src="../../../resources/js/admin/adminMemberList.js" ></script>

	<div id="con2">
		
		<div class="order">
		<br><br>
			<h1>제품주문</h1>
			
			<br><br><br>
			
			<table id="adminTbl">
				<tr>
					<th width="10%">번호</th>
					<th width="10%">아이디</th>
					<th width="50%">주문상품</th>
					<th width="15%">주문금액</th>
					<th width="15%">주문시간</th>
					
				</tr>
				<c:forEach var="adminMainOH" items="${adminMainOH}">
				<tr>
					<td>${adminMainOH.order_no}</td>
					<td>${adminMainOH.m_id}</td>
					<td>${adminMainOH.p_name}</td>
					<td><fmt:formatNumber value="${adminMainOH.order_price}" pattern="#,###" /></td>
					<td><fmt:formatDate value="${adminMainOH.order_reg_date}" type="both" pattern="yyyy. MM. dd" /></td>
				</tr>
				</c:forEach>
				
				
			</table>
			
			<br><br>
			
			<div class="memberAllListPageDIV">
			
				<button type="button" onclick="location.href='/adminviews/orderList/orderList_view'" id="orderAllListPage">전체 목록 보기</button>
			
			</div>
			
		</div>
		
			    
		<div class="member">
		<br><br>
			<h1>회원관리</h1>
			
			<br><br><br>
			
			<table id="adminTbl">
				<tr>
					<th width="15%">번호</th>
					<th width="20%">아이디</th>
					<th width="20%">닉네임</th>
					<th width="20%">등급</th>
					<th width="25%">가입일</th>
				</tr>
				
				<c:forEach var="adminMainMemberList" items="${adminMainMemberList}">
				<tr>
					<td>${adminMainMemberList.m_no}</td>
					<td>${adminMainMemberList.m_id}</td>
					<td>${adminMainMemberList.m_name}</td>
					<td>${adminMainMemberList.membership_name}</td>
					<td><fmt:formatDate value="${adminMainMemberList.m_reg_date}" type="both" pattern="yyyy. MM. dd" /></td>
				</tr>
				</c:forEach>
			</table>
			
			<br><br>
			
			<div class="memberAllListPageDIV">
			
			<button type="button" onclick="location.href='/adminviews/adminMemberList_view'" id="memberAllListPage">전체 목록 보기</button>
			
			</div>
		</div>
		
		
	                    
	</div>
