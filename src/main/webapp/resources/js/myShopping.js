$(function(){
	

	
	
	
	
	
	


	
	$("#reviewBtn").click(function(){
		
	});


	$("#reviewDeleteBtn").click(function(){
	   
		
	});

			var moveForm = $(".moveForm");
			
			$(".pageInfo a").on("click", function(e) {

						e.preventDefault(); // 기본 이벤트 막기
						moveForm.find("input[name = 'pageNum']").val(
				
						$(this).attr("href")); //	위에 벨류값을 뭘로 바꿔줄껀데 인풋네임이 '페이지넘'인아이의 벨류값을 넘길꺼다.
						moveForm.attr("action", "/mypageviews/myShoppingList/myShopping_view");
						moveForm.submit();

					})

	


});
 