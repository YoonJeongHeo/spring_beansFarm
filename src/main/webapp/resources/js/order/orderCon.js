$(function(){
	
	
    $("input:radio[id=passBookchk]").click(function(){
        document.getElementById("passBook").style.display = "block";
    });
    
    $("input:radio[id=cardChk]").click(function(){
        document.getElementById("passBook").style.display = "none";
        
    })
	
	

	
	//전체 금액 나타내기
	$( document ).ready(function() {
	
		
		$(".nobankbook").hide();
		
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
	
	
	
	//결재하기 버튼 클릭시
	$("#paymentBtn").on("click",function(){
	
		var terms = $(".terms").is(":checked");
		var passBookchk = $("#passBookchk").is(":checked");
		var cardChk = $("#cardChk").is(":checked");
		
		if(terms == false){
			alert("이용 약관에 동의 해 주세요")
		}else if(passBookchk == true) {
			//입금
			var bankName_w = $("#bankName_w").val();
			
			if(bankName_w == ""){
				alert("입금자명을 입력하세요");
			
			}else {
			
				$(".nobankbook").show();
			}
			
		}else if(cardChk == true) {
			//카드
			check_module();
		}
	
	});
	
	// 무통장입금 모달창입금시 확인버튼 누르기
	$("#bankChk").on("click", function(){
		location.href="/";
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
	
	
// 결제창(api)
function check_module(){
	
	// 주문변호
	 var order_id = $("#order_no").val();
	 var today = new Date();
	 var month = ('0' + (today.getMonth() + 1)).slice(-2);
	 var day = ('0' + today.getDate()).slice(-2);
	 var date = month + day;
	
	 order_id = order_id + date;
	
	// 회원정보
	 var recipient_name = $("#recipient_name").val(); // 받는사람
	 var postnum = $("#postnum").val(); // 우편번호
	 var address = $("#address").val(); // 기본주소
	 var detailed_address = $("#detailed_address").val(); // 상세즈소
     var addr =  address + detailed_address// 통합주소	 
	 var recipient_phone = $("#recipient_phone").val(); // 연락처
	
	//제품정보
	var cart_noArr = new Array();
	var totalPrice = $("#totalPrice").val();
	
	$("input[name=cart_noList]").each(function(i, item){
	   	cart_noArr.push($(item).val());
   	});

	 
      var IMP = window.IMP; // 생략가능
      IMP.init('imp21886594');
      // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
      // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
      IMP.request_pay({
       pg : 'inicis',
       pay_method : 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
       merchant_uid : order_id, //상점에서 관리하시는 고유 주문번호를 전달
       name : '(주)BeansFarm',
       amount : totalPrice, // 변경해야함~!!!!!!!!!!!!!!
       buyer_name : recipient_name,
       buyer_tel : recipient_phone,
       buyer_addr : addr,
       buyer_postcode : postnum

   }, function(rsp){
		if(rsp.success){//결제 성공시
		
			$.ajax({
				url : "/orderviews/insert", 
		        type :'POST',
		        dataType: 'text',
				data : {
						order_id:order_id,
						recipient_name:recipient_name,
						postnum:postnum,
						address:address,
						detailed_address:detailed_address,
						recipient_phone:recipient_phone,
						cart_noArr:cart_noArr
						},
				traditional:true,
				async:false,
		        success: function(data){
					alert("결재가 되었습니다");
					location.href="../mypageviews/myShoppingList/myShopping_view";
				  
		        }, error: function() {
		            alert('결재 오류');
					location.reload();
		        }
			}) //ajax
			
		
       } else {
           alert('결재 실패');
			location.reload();
       }
   });
}
	