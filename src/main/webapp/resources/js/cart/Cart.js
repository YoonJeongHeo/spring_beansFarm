$(function(){
	
	//전체 금액 나타내기
	
	var total = 0;
		

	$( document ).ready(function() {
		
		
		$(".order_price").each(function(){
			total+=parseInt($(this).val());
		})
		
		
		$("#total_price").val(numWithCommas(total))
	});

	
	
	
	// 체크박스선택
    $("#cartAll").click(function(){
   
        if($("input[name=cartAll]").prop("checked")){
           $("input[name=cartChk]").prop("checked",true);
			
			$(".order_price").each(function(){
			total+=parseInt($(this).val());
			})
		
		
			$("#total_price").val(numWithCommas(total))
			
      	}else{
            $("input[name=cartChk]").prop("checked",false);
			total = 0;
			$("#total_price").val(numWithCommas(total))
      }
    })


   // 개별 체크박스선택
   $(".cartChk").click(function(){
      var cartChk = $(this).closest('tr').find('.cartChk');
      var order_price = $(this).closest('tr').find(".order_price").val();
		order_price = parseInt(order_price);
		
	    if($(cartChk).is(":checked") == false){
	     	$(cartChk).prop("checked",false);
	        $("input[name=cartAll]").prop("checked",false);

			total = total - order_price
			
			$("#total_price").val(numWithCommas(total))
			

	  	}else if($(cartChk).is(":checked") == true) {
			$("input[name=cartAll]").prop("checked",true);
			
			total = total + order_price
			
			$("#total_price").val(numWithCommas(total))
			
			
		}
      
    })



	//선택삭제 클릭
	$("#choiceBtn").on("click",function(){
		if(confirm("선택된 제품을 삭제 하겠습니까?")){
			var cart_no = new Array();
	      
		      $("input[name='cartChk']:checked").each(function(i){
		         cart_no.push($(this).val());
		      })
			
			$.ajax({
			    url:'/cartviews/cartOneDelete',
			    type:'post',
			    data:{cart_no:cart_no},
				traditional:true, //배열
			    success: function(data) {
					alert("상품이 삭제 되었습니다");
					location.reload();
			    },
			    error: function(err) {
					alert("선택된 항목이 없습니다");
					location.reload();
			    }
			});
			
		}else {
			location.reload();
		 }
	});
	
	
	
	
	
	//전체삭제 클릭
	$("#allBtn").on("click",function(){
		 if(confirm("전체 제품을 삭제 하겠습니까?")){
		 	location.href='/cartviews/cartAllDelete';
		 }else {
			location.reload();
		 }
	});
	
	
	
	
	// 주문하기로 보내기(비로그인시)
	$("#orderNoBtn").on("click",function(){
		alert("로그인해주세요");
	});
	
	
	
	
	// 주문하기로 보내기
	$("#orderBtn").on("click",function(){
		var cart_no = new Array();
      
	      $("input[name='cartChk']:checked").each(function(i){
	         cart_no.push($(this).val());
	      })

		if(cart_no != ""){
			$("#cart_list").val(cart_no);
			
			$("#goToOrder").submit();
		}else {
			alert("주문할 상품을 선택해 주세요");
		}
		
	

	});
	
	// 천단위 콤마찍는 함수
 	function numWithCommas(num) {
		var commas = num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		return commas;
	} 
	
		
});