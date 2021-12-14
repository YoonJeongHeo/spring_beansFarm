$(function(){

	// 헤더 아이콘
	var m_id = $("#m_id").val();
	var m_name = $("#m_name").val();
	
	$("#headerSearch").click(function() {
	    $("#popup").fadeIn();
	    $(".realSearch").focus();
    });


	
	$("#logout").click(function() {
		if(confirm("로그아웃 하겠습니까?") == true) {
			
			
			$.ajax({
				url : '/logoutAjax',
				type : 'POST',
				data : {m_id:m_id, m_name:m_name},
				success : function(data) {
					alert(m_name + "님 안녕히 가세요");
					$(location).attr('href', '/');
				}
			})
			
			
		}else {
			return false;
		}


	});
	
	
	//검색창 닫기
	$("#searchFormx").on("click", function(){
		$("#popup").fadeOut();
	});
	
	
	//검색기능
	$("#searchAction").click(function (){
		search();
	});
	
	$(".realSearch").keypress(function(e){
		if(e.keyCode == 13){
			e.preventDefault();
			search(); 
		}  	
	});


	
	
	function search() {
		var keyword = $(".realSearch").val(); 
		
		$.ajax({
				url : '/product/product_view',
				type : 'get',
				data : {keyword:keyword},
				success : function(data) {					
					$("#mainSF").attr("action", "/product/product_view");
       				$("#mainSF").submit();
				}
		})
	}
	
	
	//파비콘
	$("head").append('<link rel="icon" type="image/x-icon" href="/resources/images/favicon.ico">');

});