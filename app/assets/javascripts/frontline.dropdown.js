$(document).ready(function () {
  $('#navigation li').hover(
    function () {
      $('ul', this).slideDown(100);
    },

  function () {
    $('ul', this).slideUp(100);
  });
});
