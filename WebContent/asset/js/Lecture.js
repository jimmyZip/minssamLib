/*-----------------------------------------------
 Mypage 에 사용되는 강좌 컴포넌트
-----------------------------------------------
class Lecture{
	constructor(container, lecture_id, lecture_img, lecture_name, total_time, total_count, price, level){
		var str="<div class=\"cl\">";
		str+="<div class=\"wish-chk\"><input type=\"checkbox\"></div>";
		str+="<div class=\"course-wrapper fl\">";
		str+="<a href=\"/online/1\" title=\"자세히 보기\" style=\"background-image:url('/upload/"+lecture_img+"');\">코스 이미지</a>";
		str+="<div class=\"course-info-box\">";
		str+="<div class=\"course-info-wrapper\">";
		str+="<span class=\"ellipsis\">"+lecture_name+"</span>";
		str+="<span>"+total_count+"강 "+total_time+"시간 </span>";
		str+="<span class=\"level\">"+level+"</span>";
		str+="</div>";
		str+="<div class=\"course-price-wrapper\">";
		str+="<span class=\"course-discount\">￦"+price+" 원</span>";
		str+="</div>";
		str+="</div>";
		str+="</div>";
		str+="</div>";
		container.append(str);
	}
}

*/