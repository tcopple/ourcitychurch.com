var slideshow_interval_id = null;

$(document).ready( function() {
  $('ul#banners').cycle({
      pager: '#pagers',
      slideExpr: 'img',

      pagerAnchorBuilder: function(idx, slide) {
        var src = $(slide.innerHTML).attr("src");
        return '<a href="#"></a>';
      }
  });
});
