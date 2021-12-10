$(function() {
	

   
   // 검색기능
   $("#searchBtn").on("click", function(){
      var moveForm = $(".moveForm");
      
        
      let type = $(".searchBox select").val();
        let keyword = $("input[name='keyword']").val();

      alert("type : " + type);
      alert("keyword : " + keyword);
      
      if(!type){
            alert("검색 종류를 선택하세요.");
            return false;
        }
        
        if(!keyword){
            alert("키워드를 입력하세요.");
            return false;
        }   

      moveForm.find("input[name='type']").val(type);
        moveForm.find("input[name='keyword']").val(keyword);
        moveForm.find("input[name='pageNum']").val(1).attr("href");
      moveForm.attr("action", "/adminviews/adminMemberList_view");
        moveForm.submit();
    });



   // 페이징
   $(".pageInfo a").on("click",function(e) {
      var moveForm = $(".moveForm");
      
      e.preventDefault();
      moveForm.find("input[name = 'pageNum']").val($(this).attr("href"));
      moveForm.attr("action", "/adminviews/adminMemberList_view");
      moveForm.submit();
      
      
   })
	
	
	   
   
   
   
   // 체크박스선택
    $("#orderAll").click(function(){
   
        if($("input[name=orderAll]").prop("checked")){
           $("input[name=order_noChk]").prop("checked",true);

      	}else{
            $("input[name=order_noChk]").prop("checked",false);
      }
    })


   // 개별 체크박스선택
   $(".order_noChk").click(function(){
      var order_noChk = $(this).closest('tr').find('.order_noChk').val();
      
	    if($(order_noChk).prop("checked",false)){
	     	$(order_noChk).prop("checked",false);
	        $("input[name=orderAll]").prop("checked",false);

	  	}else if($("input[name=orderAll]").prop("checked",true)) {
			$("input[name=orderAll]").prop("checked",true);
		}
      
    })



   
   
   
	
	
});