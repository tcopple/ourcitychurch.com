$(document).ready(function() {
  Gmaps.map.callback = function() {
    google.maps.event.addListenerOnce(Gmaps.map.serviceObject, 'idle', function() {
      // $.each(Gmaps.map.markers, function(index, marker) {
      for(var i = 0; i < Gmaps.map.markers.length; ++i) {
        var mark = Gmaps.map.markers[i];
        var m = mark.serviceObject;
        m.marker_id = mark.id;
        google.maps.event.addListener(m, 'click', function() {
          Gmaps.map.serviceObject.setCenter(this.getPosition());
          alert(this.marker_id);
        });
      }
    });
  };
});
