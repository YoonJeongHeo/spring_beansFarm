$(function(){
	
	
	//쿠폰 
	$(".mycoco").click(function(){ 
		$(".mycoco").css({"background-color" : "#FBDEDC", "font-weight": "bold", "font-size" : "1.5rem"}) 
		$(".myShoppingList").css({"background-color" : "white", "font-weight": "nomal", "font-size" : "medium"})
	
		alert("!!");
	
		
	});
	
	
	// 주문내역
	$(".myShoppingList").click(function(){ 
		$(".myShoppingList").css({"background-color" : "#FBDEDC", "font-weight": "bold",	"font-size" : "1.5em" })
		$(".mycoco").css({"background-color" : "white", "font-weight": "nomal", "font-size" : "medium"})
	
	});
	
	
	
	
	
	
	
	
	$("#search").click(function() {
	    $("#popup").fadeIn();
	    $(".realSearch").focus();
    });

	$("#popup").click(function() {
		$("#popup").fadeOut();
    });

	$(".iBar").click(function() {
		alert("!!");
	});
	
	$(".iBar").click(function() {
		alert("!!");
	});

	
	$("#reviewBtn").click(function(){
		
		alert("!!");
	});


	$("#reviewDeleteBtn").click(function(){
		alert("!!");
	   
		
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
 