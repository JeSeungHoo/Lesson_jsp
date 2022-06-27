window.onload = function() {
	let input = document.getElementsByTagName("input");
	let btn = document.querySelector("button");
	btn.onclick = function(event) {
		for (let i = 0; i < input.length; i++) {
			// 작성된 값이 없을 때
			if (input[i].value.length == 0) {
				// data- 중에 msg
				let msg = input[i].dataset.msg + "를 확인해주세요.";
				alert(msg);
				input[i].focus();
				// 기본 이벤트 무시
				event.preventDefault();
				break;
			}
		}
	}
} 