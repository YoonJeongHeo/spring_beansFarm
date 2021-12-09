$(function(){
	
	
    $("input:radio[id=passBookchk]").click(function(){
        document.getElementById("passBook").style.display = "block";
    });
    
    $("input:radio[id=cardChk]").click(function(){
        document.getElementById("passBook").style.display = "none";
        
    })
	
	

	
	//전체 금액 나타내기
	$( document ).ready(function() {
		
		var total = 0;
		var delivery_price = 0;
		
		$(".order_price").each(function(){
			total+=parseInt($(this).val());
		})
		if(total < 30000){
		delivery_price = 2500;
		}
		
		$(".total_price").html(numWithCommas(total));
		$(".delivery_price").html(numWithCommas(delivery_price));
		$(".last_price").html(numWithCommas(total+delivery_price));
		$("#totalPrice").val(total+delivery_price);
	});
	
	$("#paymentBtn").on("click",function(){
		alert("ddd");
	
		var terms = $(".terms").is(":checked");
		var passBookchk = $("#passBookchk").is(":checked");
		var cardChk = $("#cardChk").is(":checked");
		
		if(terms == false){
			alert("이용 약관에 동의 해 주세요")
		}else if(passBookchk == true) {
			//입금
			alert("모달창 예정");
		}else if(cardChk == true) {
		
			//카드
			// check_module();
			
			// 주문변호
			 var order_no = $("#order_no").val();
			 var today = new Date();
			 var month = ('0' + (today.getMonth() + 1)).slice(-2);
			 var day = ('0' + today.getDate()).slice(-2);
			 var date = month + day;
			
	 		 order_no = order_no + date;
			
			// 회원정보
			 var recipient_name = $("#recipient_name").val(); // 받는사람
			 var postnum = $("#postnum").val(); // 우편번호
			 var address = $("#address").val(); // 기본주소
			 var detailed_address = $("#detailed_address").val(); // 상세즈소
		     var addr =  address + detailed_address// 통합주소	 
			 var recipient_phone = $("#recipient_phone").val(); // 연락처
			 			 
			//주문금액
			 var totalPrice = $("#totalPrice").val();
			
			//제품정보
			
			
			$.ajax({
				url : "/orderviews/insert", 
		        type :'POST',
		        dataType: 'json',
				data : {
						order_no:order_no,
						recipient_name:recipient_name,
						postnum:postnum,
						address:address,
						detailed_address:detailed_address,
						recipient_phone:recipient_phone,
						totalPrice:totalPrice,
						p_no:p_no
						
						},
		        success: function(data){
				  if(data == 0){
				  alert(data);
		          alert("결제성공");
				 }else{
					alert("결제실패")
				}
				  

		        }
			})

			
		
			
		}
	
	
	});
	
	
	
	// 천단위 콤마찍는 함수
 	function numWithCommas(num) {
		var commas = num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		return commas;
	} 
	
	
	// 배송정보 클릭시 
	$("input:radio[name=addrInfo]").click(function(){
	
	
	
	
	//기본
	if($("input:radio[name=addrInfo]:checked").val()=='auto'){
		var recipient_name = $('#hiddenname').val();
		var postnum = $('#hiddepostnum').val();
		var address = $('#hiddeaddress').val();
		var detailed_address = $('#hiddedetailed_address').val();
		var recipient_phone = $('#hiddephone').val();
		
		$('#recipient_name').val(recipient_name);
		$('#postnum').val(postnum);
		$('#address').val(address);
		$('#detailed_address').val(detailed_address);
		$('#recipient_phone').val(recipient_phone);	
		$('#addr_nickname').val("기본배송지");
    }

	

	
    // 신규
    if($("input:radio[name=addrInfo]:checked").val()=='new'){
        $('#recipient_name').val("");
		$('#postnum').val("");
		$('#address').val("");
		$('#detailed_address').val("");
		$('#recipient_phone').val("");	
		$('#addr_nickname').val("");	
    }



	});
	
	//주소지목록
	$('.m_no_btn').on("click",function(e){
		e.preventDefault();
		let popUrl = "/mypageviews/myPageInfo/myPageInfo_addressManagePop";
		let popOption = "width = 900px, height=650px, top=260px, left=950px, scrollbars=yes";
		
		window.open(popUrl,"주소 찾기",popOption);
		
	});
	
	
	
	
	
	$('#addrNew').on("click",function(e){
		
		var addr_nickname = $('#addr_nickname').val();
		var recipient_name = $('#recipient_name').val();
		var postnum = $('#postnum').val();
		var address = $('#address').val();
		var detailed_address = $('#detailed_address').val();
		var recipient_phone = $('#recipient_phone').val();
		
		if($("#addr_nickname").val()==""){
			alert("닉네임을 입력해주세요");
			
		}else if($("#recipient_name").val()==""){
			alert("받으시는분을 입력해주세요");
			
		}else if($("#postnum").val()==""){
			alert("우편번호를 입력해주세요");
			
		}else if($("#address").val()==""){
			alert("기본주소를 입력해주세요");
			
		}else if($("#detailed_address").val()==""){
			alert("상세주소를 입력해주세요");
			
		}else if($("#recipient_phone").val()==""){
			alert("받으시는분의 휴대폰 번호를 입력해주세요");
			
		}else{
			
			
			
			$.ajax({
				url : '/orderviews/insertAddrAjax',
				type : 'POST',
				dataType : "json",
				data : {
				
				addr_nickname:addr_nickname,
				recipient_name:recipient_name,
				postnum:postnum,
				address:address,
				detailed_address:detailed_address,
				recipient_phone:recipient_phone
				
				},
				success : function(data) {
					alert(data);
					if(data == 1){
						alert("신규 주소지가 추가되었습니다.");
					}else if(data == 0){
						alert("5개초과 등록 불가");
					}
					
					
				}
			})
			
			
		}
	
	});

});

//주소지 목록안에서 선택
function setAddress(address){
		console.log(address);
		
		document.querySelector("#addr_nickname").value = address.addr_nickname;
		document.querySelector("#postnum").value = address.postnum;
		document.querySelector("#address").value = address.address;
		document.querySelector("#detailed_address").value = address.detailedAddress;
		document.querySelector("#recipient_name").value = address.recipient_name;
		document.querySelector("#recipient_phone").value = address.recipient_phone;
	}
	

// 결재창 미완성
// 결제창(api)
function check_module(){
	
	// 주문번호
	 var order_no = $("#order_no").val() + date;

	//주분번호 뒤에 날짜
	 var today = new Date();
	 var month = ('0' + (today.getMonth() + 1)).slice(-2);
	 var day = ('0' + today.getDate()).slice(-2);
	 var date = month + day;

	order_no = order_no  + date;
	
	 var m_name = $("#m_name").val(); // 이름
	 var m_phone = $("#m_phone").val(); // 전화번호
	 var m_postnum = $("#m_postnum").val(); // 우편번호
	 var m_address = $("#m_address").val(); // 기본주소
	 var m_detailed_address = $("#m_detailed_address").val(); // 상세주소
	 var address =  m_address + m_detailed_address// 통합주소
	 
//주문금액
	 var totalPrice = $("#totalPrice").val();
	 
      var IMP = window.IMP; // 생략가능
      IMP.init('imp21886594');
      // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
      // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
      IMP.request_pay({
       pg : 'inicis',
       pay_method : 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
       merchant_uid : order_no, //상점에서 관리하시는 고유 주문번호를 전달
       name : '(주)BeansFarm',
       amount : 100, // 변경해야함~!!!!!!!!!!!!!!
       buyer_name : m_name,
       buyer_tel : m_phone,
       buyer_addr : address,
       buyer_postcode : m_postnum

   }, function(rsp){
		if(rsp.success){//결제 성공시
			var msg = '결제가 완료되었습니다';
			
			$.ajax({
				url : '/orderviews/insert', 
		        type :'POST',
		        data : {order_no:order_no,
						m_name:m_name},
		        contentType:'application/json;charset=utf-8',
		        dataType: 'json', //서버에서 보내줄 데이터 타입

		        success: function(res){
				  alert(res);
		          alert("결제성공");

		        },

		        error:function(){
		          console.log("Insert ajax 통신 실패!!!");
		        }
			}) //ajax
			
		
       } else {
           var msg = '결제에 실패하였습니다.';
           msg += '에러내용 : ' + rsp.error_msg;
           
           alert(msg);
       }
   });
}


// 결제창(api)
function check_module(){
	
	// 주문번호
	 var order_no = $("#order_no").val() + date;

	//주분번호 뒤에 날짜
	 var today = new Date();
	 var month = ('0' + (today.getMonth() + 1)).slice(-2);
	 var day = ('0' + today.getDate()).slice(-2);
	 var date = month + day;

	order_no = order_no  + date;
	
	 var m_name = $("#m_name").val(); // 이름
	 var m_phone = $("#m_phone").val(); // 전화번호
	 var m_postnum = $("#m_postnum").val(); // 우편번호
	 var m_address = $("#m_address").val(); // 기본주소
	 var m_detailed_address = $("#m_detailed_address").val(); // 상세주소
	 var address =  m_address + m_detailed_address// 통합주소
	 
//주문금액
	 var totalPrice = $("#totalPrice").val();
	 
      var IMP = window.IMP; // 생략가능
      IMP.init('imp21886594');
      // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
      // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
      IMP.request_pay({
       pg : 'inicis',
       pay_method : 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
       merchant_uid : order_no, //상점에서 관리하시는 고유 주문번호를 전달
       name : '(주)BeansFarm',
       amount : 100, // 변경해야함~!!!!!!!!!!!!!!
       buyer_name : m_name,
       buyer_tel : m_phone,
       buyer_addr : address,
       buyer_postcode : m_postnum

   }, function(rsp){
		if(rsp.success){//결제 성공시
			var msg = '결제가 완료되었습니다';
			
			$.ajax({
				url : '/orderviews/insert', 
		        type :'POST',
		        data : {order_no:order_no,
						m_name:m_name},
		        contentType:'application/json;charset=utf-8',
		        dataType: 'json', //서버에서 보내줄 데이터 타입

		        success: function(res){
				  alert(res);
		          alert("결제성공");

		        },

		        error:function(){
		          console.log("Insert ajax 통신 실패!!!");
		        }
			}) //ajax
			
		
       } else {
           var msg = '결제에 실패하였습니다.';
           msg += '에러내용 : ' + rsp.error_msg;
           
           alert(msg);
       }
   });
}