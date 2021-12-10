<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<link rel="stylesheet" href="../../../../resources/css/myShopping/myShoppingCenterCon.css">

<script src="../../../../resources/js/myShopping.js" ></script>

                <div id="con2">
                    <h1>주문내역 조회</h1>

                    <br>

                    <br><br>
                    
                    <br><br>
                    
                    <div id="myShoppingListForm">
                    
                        <table class="mypageTabel">
                            <tr>
                                <th width="40%" colspan="2">상품정보</th>
                                <th width="13%">주문일자</th>
                                <th width="13%">주문번호</th>
                                <th width="14%" colspan="2">주문금액(수량)</th>
                                <th width="20%" >후기작성</th>
                            </tr>
                            
							<c:forEach var="myAllOrderHistory" items="${myAllOrderHistory}">
		             			
				                <tr class="mypageTableHo">
								<td width="10%"> <a href="/product/product_details/pdDetailsCon_view?p_no=${myAllOrderHistory.p_no}"> <img src="src=/upload/review/${myAllOrderHistory.p_image}" width="150px" height="150px"></a> </td>
								<td width="10%">${myAllOrderHistory.p_name}</td>
                                <td width="15%"><fmt:formatDate value="${myAllOrderHistory.order_reg_date}" pattern="yyyy-MM-dd" /></td>
                                <td width="15%">${myAllOrderHistory.order_no}</td> 
                                <td width="25%" colspan="2">
	                                 <ul>
	                                  	<li><fmt:formatNumber value="${myAllOrderHistory.order_price}" pattern="#,###" /></li>
	                                  	<li>${myAllOrderHistory.product_quantity}</li>
	                                 </ul>
                            	</td>
                                <td width="20%">
                                 <form action="/mypageviews/myReviewList/reviewWriteForm_view" method="post" id="reviewChk" class="reviewChk">
                                	<input type="hidden" name="order_no" class="order_no" value="${myAllOrderHistory.order_no}"> 
                            	</form>
                            	<button class="reviewBtn">후기작성</button>
                            	
                                 </td>
                               
							</tr>
             				</c:forEach>
                            <!-- 글 내용 나타나야하는 공간 -->
                        </table>
                        
                       
                        
                        
                    </div>
                   <br>
                    <div class="pageInfo">
				
						<c:if test="${pageMaker.prev}">
							<li><a href="${pageMaker.startPage -1}">이전</a></li>
							<!-- 이전버튼이 있는데 이 버튼을 누르면 시작페이지에서 마이너스1을 해줘야 넘어간다. -->
						</c:if>
				
						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li><a href="${num}">${num}</a></li>
						</c:forEach>
				
						<c:if test="${pageMaker.next}">
							<li><a href="${pageMaker.endPage +1}">다음</a></li>
							<!-- 다음버튼이 있는데 이 버튼을 누르면 시작페이지에서 마이너스1을 해줘야 넘어간다. -->
						</c:if>
				
					</div>
					
                    <form method="get" class="moveForm">
					
						<!-- 엑션이 있어야지 값이 넘어가잖아 하지만 a태그를 눌렀을 때 액션이라는걸 추가해서 요 버튼을 눌렀을 때  -->
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
				
					</form>
                        
                        
                        
                        
                    </div>
                    

           