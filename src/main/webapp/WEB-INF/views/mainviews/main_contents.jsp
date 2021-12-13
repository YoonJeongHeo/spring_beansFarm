<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<link rel="stylesheet" href="../../../resources/css/main/mainCon.css">

	<div class="content">
            <!-- <div class="slide">

            </div> -->
            <!-- 추가본 -->
             <div class="slide" id="slide">
				  <input type="radio" name="pos" id="pos1" checked>
				  <input type="radio" name="pos" id="pos2">
				  <input type="radio" name="pos" id="pos3">
			  <ul class="slidee">
			    <li class="slideee"></li>
			    <li class="slideee"></li>
			    <li class="slideee"></li>
			  </ul>
			  <p class="pos">
			    <label for="pos1"></label>
			    <label for="pos2"></label>
			    <label for="pos3"></label>
			  </p>
			</div>        	 
		<!-- /추가본 -->
            <div class="product">

                <div>
            
                    <h1>상품 리스트</h1>
                    
                </div>
                    <div class="test">
                        
                        <div class="imgAll">
        					<c:set var="productListLength" value="${fn:length(productList)}"/>
        					<c:forEach var="productList" items="${productList}">
	        					<c:set var="i" value="${i+1}" />
	        					<c:if test="${i==1 || i == 5 || (i-5)%4 == 0}"> <div class="idx"> </c:if>
	                           		<div class="p_img" >
	                           			<a href="/product/product/pdDetailsCon_view?p_no=${productList.p_no}">
	                           			<img src="/upload/product/${productList.p_thumbnail}" style="max-width:100%; height:auto;">
	                           			<p id="productName">${productList.p_name}</p>
	                           			<p id="productPrice"><fmt:formatNumber value="${productList.p_price}" pattern="#,###"/> </p>
	                           			</a>
	                           		</div>
	                           		 
								<c:if test="${i % 4 == 0 || i == productListLength}"> </div> </c:if>
							</c:forEach>
                        </div>
                            
                    </div>
                </div>

            

        
    </div>