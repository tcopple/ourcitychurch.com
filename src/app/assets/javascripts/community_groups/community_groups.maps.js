$(document).ready(function() {
  Gmaps.map.callback = function() {
    google.maps.event.addListenerOnce(Gmaps.map.serviceObject, 'idle', function() {
      for(var i = 0; i < Gmaps.map.markers.length; ++i) {
        var mark = Gmaps.map.markers[i];
        var m = mark.serviceObject;

        m.marker_id = mark.id;

        google.maps.event.addListener(m, 'click', function() {
          // Gmaps.map.serviceObject.setCenter(this.getPosition());
          var id = this.marker_id

          if($('.directions').is(':visible')) {
            transition($('.directions'), $(".community-group-wrapper[data-group-id='" + id + "']"));
          } else {
            var elem = $('.community-group-wrapper:visible').first();
            transition(elem, $(".community-group-wrapper[data-group-id='" + id + "']"));
          }
        });
      }
    });
  };
});

function transition(selector_out, selector_in) {
  selector_out.slideUp('medium', function() {
    selector_in.slideDown('medium')
  });
}
