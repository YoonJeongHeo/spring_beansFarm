function postcode() {
    new daum.Postcode({
        oncomplete: function(data) {
             document.getElementById("postnum").value = data.zonecode; // 우편번호 넣기
             document.getElementById("address").value = data.address; // 주소 넣기
             document.querySelector("input[name=detailed_address]").focus(); //상세입력 포커싱
          }
      }).open();
}