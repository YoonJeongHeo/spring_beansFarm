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
	
	
});