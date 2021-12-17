$(function(){
	
	/* 파일업로드 체크 */	
	$(function upload() {
		
		var file = $("#r_photo").val();
		var regex = new RegExp("(.*?)\.(jpg|png)$");
		var pattern = new RegExp(/[\{\}\[\]\/?,;\)*~`!^\-_+<>@\#$%&\=\(\'\"]/gi);
		
		/* 파일업로드 이벤트 막기 */
		$("#reviewFinalCheck").on("click",function(e){
			
				
				if(pattern.test(file)){
					
					alert("파일명에 특수문자가 포함되어 있습니다");
					return false;
					
				}else if(regex.test(file)){		
					e.preventDefault();
					alert("리뷰를 남겨주셔서 감사합니다");
					
					$('#reviewWriteForm').submit();
					return true;
					
				}else if(file.isempty()){
					e.preventDefault();
					alert("리뷰를 남겨주셔서 감사합니다");
					
					$('#reviewWriteForm').submit();
					
					return true;
					
				}

				if(!regex.test(file)){
				
					alert("이미지형식을 jpg나 png로 해주세요");
					
					return false;
				
				}
				
			
				alert("리뷰를 남겨주셔서 감사합니다");
				return true;
		});
		
		
		
	})
	
	
		
		
		
	

	
	var starRating = function(){
	var $star = $(".star-input"),
    $result = $star.find("output>b");
	
  	$(document)
	.on("focusin", ".star-input>.input", 
		function(){
   		 $(this).addClass("focus");
 	})
		 
   	.on("focusout", ".star-input>.input", function(){
    	var $this = $(this);
    	setTimeout(function(){
      		if($this.find(":focus").length === 0){
       			$this.removeClass("focus");
     	 	}
   		}, 100);
 	 })
  
    .on("change", ".star-input :radio", function(){
    	$result.text($(this).next().text());
  	})
    .on("mouseover", ".star-input label", function(){
    	$result.text($(this).text());
    })
    .on("mouseleave", ".star-input>.input", function(){
    	var $checked = $star.find(":checked");
    		if($checked.length === 0){
     	 		$result.text("0");
   		 	} else {
     	 		$result.text($checked.next().text());
    		}
  	});
};

starRating();
	
	
	
});
		
		

