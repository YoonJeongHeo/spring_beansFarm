
function checkExtension(fileName){
	var regex = new RegExp("(.*?)\.(jpg|png)$");
		if(!regex.test(fileName)){
		
		alert("이미지형식을 jpg나 png로 해주세요");
		return false;
		}
		alert("리뷰를 수정했습니다.")
		return true;
		
	}
	
	/* 파일업로드 이벤트 막기 */
	$("#reviewUpdateCheck").on("click",function(){
		
		var file = $("#r_photo").val();
			
		  if(!checkExtension(file)) {
	            return false;
	        }
		return true;
		
	})

