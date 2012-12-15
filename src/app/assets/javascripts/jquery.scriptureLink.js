(function($) {
  $.fn.scriptureLink = function(options) {

    var defaults = {
      //would like to use supplied regex to parse out parts
      //of scripture references to add to anchor tags
      //regex: /(\d{1,3}?\s?\w{2,}\.?\s*\d{1,}\:\d{1,}-?,?\d{0,2}(?:,\d{0,2}){0,2})/,
      new_target: true,
      link: function(ref) { return 'http://www.gnpcb.org/esv/search/?q=' + ref.replace(/ /g, '+') }
    };

    var options = $.extend(defaults, options);

    return this.each(function() {
        var t = $(this).text();
        var link = $('<a/>');
        link.attr('href', options.link(t));

        if(options.new_target) {
          link.attr('target', '_blank');
        }

        link.text(t); 
        $(this).replaceWith(link);
      });
  };
}) ( jQuery );
