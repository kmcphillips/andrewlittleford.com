//= require jquery-1.4.2.min
//= require jquery.fancybox-1.3.4.pack
//= require jquery.easing-1.3.pack
//= require jquery.swfobject

$(document).ready(function(){
  if($.fancybox)
  {
    $("a.inline_image").fancybox({       'transitionIn' : 'elastic',
      'transitionOut' : 'elastic',
      'hideOnContentClick' : true,
      'titlePosition' : 'inside'
    });
  }
});
