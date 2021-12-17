$(function(){
	$(".reviewBtn").on("click",function(){
	
		var order_no = $(this).closest('td').find('.order_no').val();

		$.ajax({
		
		        url: '/mypageviews/myPagereviewCountAjax',
		        type: 'POST',
				dataType : 'json',
		        data: {order_no:order_no},
				success : function(result) {
					if(result == 0){
						
						location.href = "/mypageviews/myReviewList/reviewWriteForm_view?order_no=" + order_no;
					
					}else{
					
						alert("해당제품에 대한 리뷰를 작성하셨습니다.");
						
					}
					
					
				}
			
		})
			
	})	
	
		$(".reDelBtn").on("click",function(event){
			
			
			
			var r_no = $(this).closest('tr').find('.reDelBtn').val();
			
			
			
			if(confirm('정말 삭제하시겠습니까?')){
				
	      		alert("삭제되었습니다!");

				$(location).attr("href", "/mypageviews/reviewDelete?r_no="+r_no);		
				

		     	return true;		

		
			    		}else {
	
						alert("취소되었습니다!");
						event.preventDefault();
		     			return false;
			      }
			
		});
		
	var moveForm = $(".moveForm");
	
	$(".pageInfo a").on("click", function(e) {

				e.preventDefault(); // 기본 이벤트 막기
				moveForm.find("input[name = 'pageNum']").val(
		
				$(this).attr("href")); //	위에 벨류값을 뭘로 바꿔줄껀데 인풋네임이 '페이지넘'인아이의 벨류값을 넘길꺼다.
				moveForm.attr("action", "/mypageviews/myReviewList/myReview_view");
				moveForm.submit();

			})


	


});