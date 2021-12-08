<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<link rel="stylesheet" href="../../../resources/css/order/ordercon.css">

<script src="../../../resources/js/jquery-3.6.0.min.js" ></script>
<script src="../../../../resources/js/order/addressAPI.js" ></script>
<script src="../../../../resources/js/order/daummapapi.js" ></script>
<script src="../../../resources/js/order/orderCon.js" ></script>

<!-- 아임포트 결제 api -->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>


	<div id="content">
        <h1>주문서작성/결제</h1>
        <br>

        <h3>주문상세내역</h3>
        <table id="orderDetailsTbl">
            <tr>
                <th colspan="2">제품 / 옵션 정보</th>
                <th>수량</th>
                <th>제품금액</th>
            </tr>

         	<c:forEach var="cartList" items="${cartList}">
         	 <tr>
         	 	<td width="10%" >
         	 	<c:forEach var="productList" items="${productList}">
         	 		<c:if test="${cartList.p_no eq productList.p_no}"><img style="width: 100%; margin-left: 50%" src="/upload/product/${productList.p_thumbnail}"> </c:if>
         	 	</c:forEach>
         	 	</td>
         	 	<td>
         	 	
         	 	<c:forEach var="productList" items="${productList}">
         	 		<c:if test="${cartList.p_no eq productList.p_no}"><b>${productList.p_name}</b></c:if>
         	 	</c:forEach>
         	 	/
         	 	<c:forEach var="opList" items="${opList}">
         	 		<c:if test="${cartList.op_no1 eq opList.op_no}">${opList.op_name}</c:if>
         	 	</c:forEach>
         	 	/
         	 	<c:forEach var="opList" items="${opList}">
         	 		<c:if test="${cartList.op_no2 eq opList.op_no}">${opList.op_name}</c:if>
         	 	</c:forEach>
                </td>
                <td>${cartList.option_quantity1}</td>
                <td><fmt:formatNumber value="${cartList.order_price}" pattern="#,###" />
                <input type="hidden" name="order_price" class="order_price" value="${cartList.order_price}">
                </td>
            </tr>
         	
         	</c:forEach>
           

        </table>
        <div id="amountBox">
        	
            <div class="price">
            	
                <h4>주문 금액</h4><br>
                <%-- <c:forEach var="cartList" items="${cartList}"> --%>
                <h3><span class="total_price"></span></h3>
                <%-- </c:forEach> --%>
            </div>

            <div class="icon1">
                <br><p>+</p>
            </div>

            <div class="discount">
                <h4>배송비</h4><br>
                <h3><span class="delivery_price"></span></h3>
            </div>

            <div class="icon2">
                <br><p>=</p>
            </div>

            <div class="total">
                <h4>결제금액</h4><br>
                <h3><span class="last_price"></span></h3>
            </div>
        </div>




        <br><br><br>
        <!-- 배송정보 -->
        <div>
            <hr width="10%">
            <h4>배송 정보</h4>
            
            <table id="shippingTbl">
            
	            <tr>
	            	<th></th>
	            	<td>
		            <input type="radio" name="addrInfo" id="addrDefault" value="auto" checked="checked"> 기본배송지  
		            <input type="radio" name="addrInfo" id="addrInfo" value="new"> 신규배송지
		            <input type="button" name="addrList" id="addrList" class="m_no_btn" value="주소지 목록">
		            </td>
		            
	            </tr>
	            <tr>
	            	<th></th>
	            	<td>
	            	<input type="hidden" name="hiddenname" id="hiddenname" value="${memberList.m_name}">
	            	<input type="hidden" name="hiddepostnum" id="hiddepostnum" value="${memberList.m_postnum}">
	            	<input type="hidden" placeholder="기본주소" name="hiddeaddress" id="hiddeaddress" value="${memberList.m_address}">
	            	<input type="hidden" placeholder="나머지주소" name="hiddedetailed_address" id="hiddedetailed_address" value="${memberList.m_detailed_address}">
	            	<input type="hidden" name="hiddephone" id="hiddephone" value="${memberList.m_phone}">
	            	
	            	
                	</td>
                </tr>
                
                <tr>
                    <%-- <c:forEach var="addressList" items="${addressList}"> --%>
                    <th>배송지 별칭</th>
                    <td><input type="text" name="addr_nickname" id="addr_nickname" value="기본배송지"></td>
                	<%-- </c:forEach> --%>
                </tr>
                <tr>
                    <th>받으시는분</th>
                    <td><input type="text" name="recipient_name" id="recipient_name" value="${memberList.m_name}"></td>
                </tr>
                <tr>
                    <th rowspan="2">받으실곳</th>
                    <td><input type="text" name="postnum" id="postnum" value="${memberList.m_postnum}" readonly>
                    <input type="button" onclick="postcode();" value="우편번호 찾기"></td>
                    
                </tr>
                <tr>
                    <td><input type="text" placeholder="기본주소" name="address" id="address" value="${memberList.m_address}" readonly>
                    <input type="text" placeholder="나머지주소" name="detailed_address" id="detailed_address" value="${memberList.m_detailed_address}"></td>
                </tr>
                <tr>
                    <th>휴대폰 번호</th>
                    <td><input type="text" name="recipient_phone" id="recipient_phone" value="${memberList.m_phone}"></td>
                </tr>
                <tr>
                    <th>배송메시지</th>
                    <td>
                    	<input type="text" placeholder="문앞에 두세요">
                    	<button id="addrNew">주소지 추가</button>
                    </td>
                </tr>
            </table>
           
        </div>

       
       
       
       
       
		<br><br><br>
        <!-- 이용약관 -->
        <div id="conditionBox">
            <h4>쇼핑몰이용약관</h4>
            <iframe src="/orderviews/terms" frameborder="0" name="condition" id="condition" width="100%" height="100px"></iframe><br>
            <div class="chk"><input type="checkbox" class="terms"><span class="fontRed">(필수)</span>동의</div>
        </div>
        
        
        
        
        
        
		<br><br><br>
        <!-- 결제정보 -->
        <div>
            <hr width="10%">
            <h4>결제정보</h4>
            <table id="paymentInfoTbl">
                <tr>
                    <th>제품합계 금액</th>
                    <td><span class="total_price"></span>원</td>
                </tr>
                <tr>
                    <th>배송비</th>
                    <td><span class="delivery_price"></span>원</td>
                </tr>
                <!-- <tr>
                    <th>할인 및 적립</th>
                    <td>0원</td>
                </tr> -->
                <tr>
                    <th>최종 결제 금액</th>
                    <td><span class="last_price"></span>원</td>
                </tr>
            </table>
        </div>




        <br><br><br>
        <!-- 결제수단 -->
        <div>
            <hr width="10%">
            <h4>결제수단</h4>
            <table id="paymentMethodTbl">
                <tr>
                    <th rowspan="2">일반결제</th>
                    <td>
                        <input type="radio" name="passBookchk" id="passBookchk" value="passBookchk" checked> 무통장입금 
                        <input type="radio" name="passBookchk" id="cardChk" value="cardChk"> 신용카드
                    </td>
                </tr>

                <tr>
                    <td>
                        <div id="passBook">
                            <table id="passBookTbl">
                                <p>( 무통장 입금의 경우 입금확인 후부터 배송단계가 진행됩니다. )</p>
                                <tr>
                                    <th>입금자명</th>
                                    <td><input type="text" name="bankName" id="bankName_w"></td>
                                </tr>
                                <tr>
                                    <th>입금은행</th>
                                    <td>
                                        <input type="text" name="bank" id="bank_w" value="대구은행 182-07-011131-3 [예금주 : (주)원두 팜]">
                                        <input type="text" name="bank" id="bank_m" value="대구은행 182-07-011131-3 원두 팜">
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>

                <!-- <tr>
                    <th>현금영수증 발행</th>
                    <td>
                        <input type="radio" name="cashReceipt" id="cashReceiptyes" value="cashReceiptyes" checked> 현금영수증
                        <input type="radio" name="cashReceipt" id="cashReceiptno" value="cashReceiptno"> 신청안함
                    </td>
                </tr> -->
				
				<tr>
					<th></th>
					<td>
						<button id="paymentBtn" onclick="check_module()">결제하기</button>
						
						<!-- 결제창 값 -->
						<% UUID uuid = UUID.randomUUID(); %>
						<input type="text" name="order_no" id="order_no" value="<%= uuid %>">
						<input type="hidden" name="m_name" id="m_name" value="${memberList.m_name}">
						<input type="hidden" name="m_phone" id="m_phone" value="${memberList.m_phone}">
						<input type="hidden" name="m_postnum" id="m_postnum" value="${memberList.m_postnum}">
						<input type="hidden" name="m_address" id="m_address" value="${memberList.m_address}">
						<input type="hidden" name="m_detailed_address" id="m_detailed_address" value="${memberList.m_detailed_address}">
						
					
					<!-- 절대빼면 안됨 전화번호, 결제금액 ,  -->
					</td>
				</tr>
            </table>
        </div>
    </div>
    
    
<script>
function check_module(){
	// 주문번호
	 var order_no = $("#order_no").val();
	
	//주분번호 뒤에 날짜
	 var today = new Date();
	 var month = ('0' + (today.getMonth() + 1)).slice(-2);
	 var day = ('0' + today.getDate()).slice(-2);
	 var date = month + day;
	
	 var m_name = $("#m_name").val(); // 이름
	 var m_phone = $("#m_phone").val(); // 전화번호
	 var m_postnum = $("#m_postnum").val(); // 우편번호
	 var m_address = $("#m_address").val(); // 기본주소
	 var m_detailed_address = $("#m_detailed_address").val(); // 상세주소
	 var address =  m_address + m_detailed_address// 통합주소
	 
	 
	 
      var IMP = window.IMP; // 생략가능
      IMP.init('imp18470258');
      // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
      // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
      IMP.request_pay({
       pg : 'inicis',
       pay_method : 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
       merchant_uid : order_no + date, //상점에서 관리하시는 고유 주문번호를 전달
       name : '(주)BeansFarm',
       amount : 100,
       buyer_name : m_name,
       buyer_tel : m_phone,
       buyer_addr : address,
       buyer_postcode : m_postnum
   }, function(rsp) {
       if ( rsp.success ) {
          //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
          jQuery.ajax({
             url: "/payment", //cross-domain error가 발생하지 않도록 주의해주세요
             type: 'POST',
             contentType: "application/json; charset=UTF-8",
             data: JSON.stringify({
                imp_uid : rsp.imp_uid
                //기타 필요한 데이터가 있으면 추가 전달
             })
          }).done(function(data) {
             //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
             if ( everythings_fine ) {
                var msg = '결제가 완료되었습니다.';
                msg += '\n고유ID : ' + rsp.imp_uid;
                msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                msg += '\결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
                
                alert(msg);
             } else {
                //[3] 아직 제대로 결제가 되지 않았습니다.
                //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
             }
          });
       } else {
           var msg = '결제에 실패하였습니다.';
           msg += '에러내용 : ' + rsp.error_msg;
           
           alert(msg);
       }
   });
}   



</script>
    
    