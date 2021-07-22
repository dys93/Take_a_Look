var scrollEvent = false;
var count = 0;

$("html").on('mousewheel', function(c) {
	c.preventDefault();
	var m = c.originalEvent.wheelDelta;
	var sb = $(".window1").height();
	
	if(m > 1 && scrollEvent == false && count >= 1) {
		scrollEvent = true;
		count--;
		 $("html").stop().animate({scrollTop:sb*count},
			{duration:300, complete: function () {
				scrollEvent = false;}
			});
	} else if (m < 1 && scrollEvent == false && count < 4) {
		scrollEvent = true;
		count++;
		 $("html").stop().animate({scrollTop:sb*count},
			{duration:300, complete: function () {
				scrollEvent = false;}
			});
	}
});