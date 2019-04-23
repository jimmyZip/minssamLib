/**
 * sliding window and btns
 */
$(function(){

			$(".slideScreen").prepend($(".slideFilm:last"));
			$(".slideScreen").css({"marginLeft":"-100%"});
			$("#btn2 ul li:eq(0)").addClass("addBtn");
			
			$(".nextBtn").click(function(){
				$(".slideScreen").animate({"marginLeft":"-=100%"},1000,"swing",function(){
					$(".slideScreen").append($(".slideFlim:first"));
					$(".slideScreen").css({"marginLeft":"-100%"});
						var btnNum = $(".slideFilm img").attr("src").substring(lastIndexOf("."),-1);
						
						btnNum =Number(btnNum)+1;
						if(btnNum==4){btnNum=0;}
					
						var newClass = $("#btn2 ul li:eq("+btnNum+")");
						$("#btn2 ul li").removeClass();
						newClass.addClass("addBtn");

						// 동그라미 버튼들 없애기!
						//$("#btn2").fadeOut();
				});
			});
			$(".prevBtn").click(function(){
				$(".slideScreen").animate({"marginLeft":"+=100%"},1000,"swing",function(){
					$(".slideScreen").prepend($(".slideFilm:last"));
					$(".slideScreen").css({"marginLeft":"-100%"});
					var btnNum = $(".slideFilm img").attr("src").substring(lastIndexOf("."),-1);
						
						btnNum =Number(btnNum)+1;
						if(btnNum==4){btnNum=0;}
					
						var newClass = $("#btn2 ul li:eq("+btnNum+")");
						$("#btn2 ul li").removeClass();
						newClass.addClass("addBtn");
						
						//$("#btn2").fadeOut();
				});
			});

			$("#btn2 ul li").click(function(){
				var btnIndex = $(this).index();
				width = $("#screen").width();

				$("#btn2 ul li").removeClass();
				$("#btn2 ul li:eq("+btnIndex+")").addClass("addBtn");

				for(var i=0; i<width; i++){
					if(btnIndex== i ){
						$("#film").animate({"marginLeft":"-"+width*btnIndex+"px"},500);
					}
				}

				// 이전 이후버튼
				//$(".nextBtn, .prevBtn").fadeOut();
			});
			//var autoClicks = setInterval(function(){ $(".nextBtn").click(); },3000);
			// $("h1").click(function(){clearInterval(autoClicks)});
		});