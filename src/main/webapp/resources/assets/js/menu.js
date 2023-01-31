
$(document).ready(function(){
	// gnb
	$(".gnb > ul > li > a").on("mouseover focus" , function(){
		if ($(this).next().is(':animated')) {
			return false;
		}

		$(".sub_bg").slideDown(200);
		$('.gnb > ul').css('','');
		//if($(this).parent().hasClass('menu04')){
  		//$('.gnb > ul').css('height','55');
  		//$(".quick_wrap").animate({ 'top' : '0px' }, 300);
		// }else{
  		//$(".quick_wrap").animate({ 'top' : '250px' }, 300);
		//}
		$(".gnb > ul > li > a").removeClass('on').find('span').hide();
		$(this).addClass('on').find('span').show();
		$(".gnb > ul > li > a").next().hide();
		$(this).next().slideDown(300);

		if ($(".gnb").mouseover()) {
			$(".gnb > ul > li > a").next().hide();
			$(this).next().show();
		}
	});
	//$(".gnb > ul > li:last-child > a").on("mouseover focus" , function(){
	//	$(".sub_bg").stop().slideUp(200);
	//	$('.sub_menu').hide();
	//});

	$(".gnb > ul").on("mouseleave" , function(){
  	$('.gnb > ul').css('','');
		$(this).find('> li > a').next().hide();
		$(".gnb > ul > li > a").removeClass('on').find('span').hide();
		$(".sub_bg").stop().slideUp(200);
		//$(".quick_wrap").animate({ 'top' : '0px' }, 300);
	});



});

		//�쒕툕 left_menu
		$(document).ready(function(){		
			$(".sub_li").click(function(){		
				var tg = $(this).siblings(".sub");		
				var dis = tg.css("display");		
				if(dis == "block"){
					$(this).removeClass("on");
					tg.slideUp(300);
				}		
				if(dis == "none"){
					$(".sub_li").removeClass("on");
					$(this).addClass("on");
					$(".sub").slideUp(300);
					tg.slideDown(300);
				}
				return false;
			});
		});

