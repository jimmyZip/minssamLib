/*-----------------------------------------------
index 와 온라인강좌에 사용되는 강좌 컴포넌트
-----------------------------------------------*/
class OnlineLecture{
	constructor(lecture_id, lecture_img, lecture_name,total_time,total_count,price, level){
		this.lecture_id=lecture_id;
		this.lecture_img=lecture_img;
		this.lecture_name=lecture_name;
		this.total_time=total_time;
		this.total_count=total_count;
		this.price=price;
		this.level=level;
		this.count=0;
		
		this.str="";
		this.str+="<div class=\"course-wrapper\">";
		this.str+="<a href=\"/online/detail?lecture_id="+this.lecture_id+"\" title=\"자세히 보기\" style=\"background-image:url('/upload/"+this.lecture_img+"');\">코스 이미지</a>";
		this.str+="<div class=\"course-info-box\">";
		this.str+="<div class=\"course-info-wrapper\">";
		this.str+="<span class=\"ellipsis\">"+this.lecture_name+"</span>";
		this.str+="<span>"+this.total_time+" 시간 </span>";
		this.str+="<span>"+this.level+"</span>";
		this.str+="</div>";
							     
		this.str+="<div class=\"course-price-wrapper\">";
		this.str+="<span class=\"course-discount\">총 "+this.total_count+"강</span>";
		this.str+="</div>";
					
		this.str+="</div>";
		this.str+="<span class=\"like\" id=\""+this.lecture_id+"\">"; //하트를 아이디로 접근할 수 있도록
		
					
		//찜목록 정보와 현재 강좌간 일치 여부 찾기
		if(getCookie(uid).length > 0){
			var json=JSON.parse(getCookie(uid));
			console.log("OnlineLecture constructor wish 쿠키의 길이: ", json.wish.length);
			
			for(var i=0;i<json.wish.length;i++){
				if(json.wish[i].lecture_id == this.lecture_id){
					this.count++;				
				}
			}
		}	
		
		if(this.count >0){ //wish리스트에 담겨진 강좌라면
			this.str+="<i class=\"fas fa-heart\" onClick=\"checkWish(this, "+this.lecture_id+")\"></i>";
		}else{
			this.str+="<i class=\"far fa-heart\" onClick=\"checkWish(this, "+this.lecture_id+")\"></i>";
		}
		
		this.str+="</span>";
		this.str+="</div>";
	}
	
	getTag(){
		return this.str;
	}
}

