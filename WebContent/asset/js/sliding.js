/**
 * sliding window and btns
 */
$(function(){

			$(".film").prepend($(".scene:last"));
			$(".film").css({"marginLeft":"-100%"});
			$("#btn2 ul li:eq(0)").addClass("addBtn");
			
			$(".nextBtn").click(function(){
				//alert("next img come on");
				$(".film").animate({"marginLeft":"-=100%"},1000,"swing",function(){
					$(".film").append($(".scene:first"));
					$(".film").css({"marginLeft":"-100%"});
					var str = $(".scene img").attr("src");
					var lastIndex = parseInt(str.lastIndexOf("."));
					//console.log("lastIndex : ",lastIndex);
					var btnNum = str.substr(lastIndex-1,1);
					//console.log(btnNum);
					
					//btnNum =Number(btnNum)+1;
					btnNum =Number(btnNum);
					if(btnNum==4){btnNum=0;}
					$("#btn2 ul li").removeClass();
					$("#btn2 ul li:eq("+Number(btnNum)+")").addClass("addBtn");
					

					// 동그라미 버튼들 없애기!
					//$("#btn2").fadeOut();
				});
			});
			$(".prevBtn").click(function(){
				//alert("prev img come on");
				$(".film").animate({"marginLeft":"+=100%"},1000,"swing",function(){
					$(".film").prepend($(".scene:last"));
					$(".film").css({"marginLeft":"-100%"});
					var str = $(".scene img").attr("src");
					var lastIndex = parseInt(str.lastIndexOf("."));
					var btnNum = str.substr(lastIndex-1,1);
					
					btnNum =Number(btnNum);
					if(btnNum==4){btnNum=0;}
					$("#btn2 ul li").removeClass();
					$("#btn2 ul li:eq("+Number(btnNum)+")").addClass("addBtn");
						
				});
			});

			$("#btn2 ul li").click(function(){
				var btnIndex = $(this).index();
				width = $(".screen").width();

				$("#btn2 ul li").removeClass();
				$("#btn2 ul li:eq("+btnIndex+")").addClass("addBtn");

				for(var i=0; i<width; i++){
					if(btnIndex== i ){
						$(".film").animate({"marginLeft":"-"+width*btnIndex+"px"},500);
					}
				}

				// 이전 이후버튼
				//$(".nextBtn, .prevBtn").fadeOut();
			});
			//var autoClicks = setInterval(function(){ $(".nextBtn").click(); },3000);
			// $("h1").click(function(){clearInterval(autoClicks)});
		});