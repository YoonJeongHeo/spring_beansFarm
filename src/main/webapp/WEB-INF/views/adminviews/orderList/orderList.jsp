<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<link rel="stylesheet" href="../../../../../resources/css/admin/adminOrderList.css">

<script src="../../../../../resources/js/jquery-3.6.0.min.js" ></script>
<script src="../../../../../resources/js/admin/memberShip/memberShip.js"></script>

	<div id="con2">
        <h1>제품 주문 현황</h1>

        <br><br>
        
		<!-- 검색기능 -->
    <%--     <div class="searchBox">
            <select name="type" id="type">
                <option value="s_id" <c:out value="${pageMaker.cri.type eq 's_id'?'selected':'' }"/>>아이디</option>
                <option value="s_tier" <c:out value="${pageMaker.cri.type eq 's_tier'?'selected':'' }"/>>등급</option>
            </select>
            <input type="text" name="keyword" id="keyword" placeholder="검색할 내용을 입력하세요" 
            		value="${pageMaker.cri.keyword}">
            <button id="searchBtn">검색</button>
        </div> --%>
        
        <br><br><br>
		
        <div>
        
                <table id="adminTbl">
                    <tr>
                        <th width="2%"><input type='checkbox' name='memberAll' id='memberAll'/></th>
                        <th width="3%"><span>주문번호</span></th>
                        <th width="5%"><span>회원번호</span></th>
                        <th width="10%"><span>회원아이디</span></th>
                        <th width="40%"><span>주문상품</span></th>
                        <th width="10%"><span>주문금액</span></th>                        
                        <th width="15%"><span>주문일</span></th>
                        <th width="5%"><span>환불여부</span></th>
                        <th width="10%"><span>결제취소</span></th>
                    </tr>
                   
                    <c:forEach var="adminOrderListPage" items="${adminOrderListPage}">
                    <tr>
                        <td><input type="checkbox" name='order_noChk' class="order_noChk" value="${adminOrderListPage.order_no}"></td>
                        <td>
                        	${adminOrderListPage.order_no}
                        	<input type="hidden" name="order_no" id="order_no" value="${adminOrderListPage.order_no}">
                        </td>
                        <td>${adminOrderListPage.m_no}</td>
                        <td>
                        	${adminOrderListPage.m_id}
                        	<input type="hidden" name="m_id" id="m_id" value="${adminOrderListPage.m_id}">
                        </td>
                        <td>${adminOrderListPage.membership_name}</td>
                        <td>${adminOrderListPage.p_name}</td>
                        <td>${adminOrderListPage.order_price}</td>
                        <td><fmt:formatDate value="${adminOrderListPage.order_reg_date}" type="both" pattern="yyyy. MM. dd" /></td>
                        <td>${adminOrderListPage.p_return}</td>
                        <td>
                        	<button type="button" class="orderDelete">결제취소</button>
                        </td>
                    </tr>
                    </c:forEach>
                </table>
                
        </div>
        
        <br><br>
        
        <!-- 페이징처리 -->
    <%--    <div class="pageInfo">
		
			<c:if test="${pageMaker.prev}">
				<li><a href="${pageMaker.startPage -1}">이전</a></li>
			</c:if>
			
			
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li><a href="${num}">${num}</a></li>
			</c:forEach>
			
			
			<c:if test="${pageMaker.next}">
				<li><a href="${pageMaker.endPage +1}">다음</a></li>
			</c:if>
			
		</div>
		
		
		
         <form method="get" class="moveForm">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			
			<input type="hidden" name="type" value="${pageMaker.cri.type }">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
		</form> --%>
		
    </div>