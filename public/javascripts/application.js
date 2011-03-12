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
