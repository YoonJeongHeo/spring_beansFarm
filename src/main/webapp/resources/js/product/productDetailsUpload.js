
	$(function () {
		
	
	
		$(function upload() {
			
			var regex = new RegExp("(.*?)\(jpg|png)");
			var pattern = new RegExp(/[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi);
			var maxSize = 20971520; // 20메가
			
			function checkExtension(fileName, fileSize) {
				
				var file = fileName.substring(0,fileName.length - 4);
				
				if(fileSize >= maxSize){
					alert("파일사이즈 초과");
					return false;
				}
				if(!regex.test(fileName)){
					alert("허용되지 않는 확장자")
					return false;
				}
				
				if(pattern.test(file)){
					alert("파일명에 특수문자가 포함되어 있습니다")
					return false;
				}
				return true;
			}
			
			$("#pdInsertBtn").on("click", function() {

				var formData = new FormData();
		
				var inputFile = $("input[name='pd_image']");
				
				formData.append("uuid", $("#uuid").val());

				var files = inputFile[0].files;

				console.log(files);

				for (var i = 0; i < files.length; i++) {
					if(!checkExtension(files[i].name, files[i].size)){
						return false;
					}
					
					formData.append("uploadFile", files[i])
				}

				$.ajax({

					url : '/product/product/product_details_upload',
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST', 
					dataType : 'Json',
					success : function(data) {
						console.log("업로드 성공");
						console.log(data);

					}

				})

			})

		})
	})