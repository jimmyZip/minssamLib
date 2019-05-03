<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업로드 대기 이미지 미리보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script>
	$(function(){
		$("#myfile").change(function(e){
			//alert("사진 선택 완료");
			preview(e);//미리보기 함수 호출
			//유저가 선택한 이미지 정보를 포함한 수많은 정보가 e 파라미터에 담겨있음
		});
	});
	//html 상에 있는 자바스크립트는 로컬 파일에 접근할 수 없다. 보안상 막혀있다.
	//해결책) FileReader
	function preview(e){
		for(var i=0;i<e.target.files.length;i++){			
			var reader=new FileReader();//reader하나가 한 이미지 감당하기 때문에 여러 이미지 하려면 전부 for문 안으로 들어가면서 문제가 심각해짐
			
			//파일 로드 이벤트
			reader.onload=function(){//파일이 다 읽혀지면 구현되는 비동기방식
				console.log("현재 로드 된 파일정보 출력",e.target.files[i]);//비동기라 for문 index는 부적절, class를 만들어 i를 보관해서 심음
				//preview영역에 img를 동적으로 추가하기
				//방법1) jquery.append();//문자열 취급해서 프로그래밍적인 처리가 어렵다.
				//방법2) 동적으로 DOM생성해서 넣기
				var img = document.createElement("img");
				img.style.width=100+"px";
				//img.src=reader.result;
				img.src=this.result;//이미지의 소스는 reader가 알고있다.
				document.querySelector("#preview").appendChild(img);
			};
			reader.readAsDataURL(e.target.files[i]);//파일을 로드하는 시점//파일 읽기//비동기, 파일마다 읽는 속도가 다르기 때문
				//비동기라 for문 index는 부적절, class를 만들어 i를 보관해서 심음
				//e.target.files속성은 json배열		
		}
	}
</script>
</head>
<body>
	<!-- 이미지 미리보기 영역 -->
	<div id="preview">
		
	</div>
	<input id="myfile" name="myfile" type="file" multiple/>
</body>
</html>