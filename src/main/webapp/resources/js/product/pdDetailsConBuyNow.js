$(function(){
	
		$("#buyBtn").on("click", function(){
			orderChk();
			
			if(orderChk() == true){
				$("#goToCart").attr("method", "post");
				$("#goToCart").attr("action", "/orderviews/orderCon_view_buy_now");
				$("#goToCart").submit();
			}
		})
		
		// 체크
		function orderChk() {
		if($("#m_no").val() == ""){
			alert("로그인 해주세요.");
			return false;
		}else if($("#op_no1").val() == ""){
			alert("용량을 선택해주세요.");
			return false;
		}else if($("#op_no2").val() == ""){
			alert("분쇄를 선택해주세요.");
			return false;
		}else{
			return true;
		}
	}		
 		
  
});