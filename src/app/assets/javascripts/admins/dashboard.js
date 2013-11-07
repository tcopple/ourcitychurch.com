var down = '<i class="icon-circle-arrow-down icon-white"></icon>';
var up = '<i class="icon-circle-arrow-up icon-white"></icon>';

function update_arrows(node) {
  node.children('.bump').children('.icon-circle-arrow-up').remove();
  node.children('.bump').children('.icon-circle-arrow-down').remove();

  if(node.prev().hasClass('sub-page')) {
    node.children('.bump').first().append(up);
  }

  if(node.next().hasClass('sub-page')) {
    node.children('.bump').first().append(down);
  }
}

$(document).ready(function() {
  $('tr.sub-page .icon-circle-arrow-up').live('click', function() {
    var source = $(this).parent().parent(); // tr -> td -> icon
    var destination = source.prev();

    $.get(
      '/pages/' + source.attr('id') + '/swap/' + destination.attr('id'),
      { },
      function(data) {
        source.after(destination);
        update_arrows(source)
        update_arrows(destination)
      }, 'html');
  });

  $('tr.sub-page .icon-circle-arrow-down').live('click', function() {
    var source = $(this).parent().parent();
    var destination = source.next();

    $.get(
      '/pages/' + source.attr('id') + '/swap/' + destination.attr('id'),
      { },
      function(data) {
        destination.after(source);
        update_arrows(source)
        update_arrows(destination)
      }, 'html');
  });
});


function update_banner_arrows(node) {
  node.children('.banner').children('.icon-circle-arrow-up').remove();
  node.children('.banner').children('.icon-circle-arrow-down').remove();

  if(node.prev().hasClass('banner')) {
    node.children('.banner').first().append(up);
  }

  if(node.next().hasClass('banner')) {
    node.children('banner').first().append(down);
  }
}

$(document).ready(function() {
  $('tr.banner .icon-circle-arrow-up').live('click', function() {
    var source = $(this).parent().parent(); // tr -> td -> icon
    var destination = source.prev();

    $.get(
      '/banners/' + source.attr('id') + '/swap/' + destination.attr('id'),
      { },
      function(data) {
        source.after(destination);
        update_banner_arrows(source)
        update_banner_arrows(destination)
      }, 'html');
  });

  $('tr.banner .icon-circle-arrow-down').live('click', function() {
    var source = $(this).parent().parent();
    var destination = source.next();

    $.get(
      '/banners/' + source.attr('id') + '/swap/' + destination.attr('id'),
      { },
      function(data) {
        destination.after(source);
        update_banner_arrows(source)
        update_banner_arrows(destination)
      }, 'html');
  });
});
